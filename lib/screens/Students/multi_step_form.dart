import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:pillai_hackcelestial/models/student.dart';
import 'package:pillai_hackcelestial/models/student_form_data.dart';
import 'package:pillai_hackcelestial/provider/student_form.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class StudentMultiStepForm extends ConsumerStatefulWidget {
  @override
  _StudentMultiStepFormState createState() => _StudentMultiStepFormState();
}

class _StudentMultiStepFormState extends ConsumerState<StudentMultiStepForm> {
  int _currentStep = 0;
  bool isLoading = false;
  final AuthService _authService = AuthService();
  String? studentId;

  @override
  void initState() {
    getStudentId();
    checkIfFormFilled();
    super.initState();
  }

  Future<void> getStudentId() async {
    print("hello ??");
    developer.log("hello");

    var studentBox = await Hive.openBox<Student>('studentsBox');
    if (studentBox.isNotEmpty) {
      print("Student box keys: ${studentBox.keys}");
    } else {
      print("Student box is empty");
    }
   
      String studentIdFromPrefs = studentBox.keys.first.toString();  // Example for retrieving the first key
      var student = studentBox.get(studentIdFromPrefs);
    if (student != null) {
      developer.log("Student here: ${student.toString()}");
      setState(() {
        studentId = student.id;
      });
      developer.log("Student ID: $studentId");
    } else {
      print("Student is null");
    }
  }

  // Check if the form has already been filled using SharedPreferences
  Future<void> checkIfFormFilled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool formFilled = prefs.getBool('formFilled') ?? false;

    // If form is already filled, navigate directly to homepage
    if (formFilled) {
      GoRouter.of(context).pushNamed(StudentsRoutes.studentHomePage);
    }
  }

  // Save form completion status to SharedPreferences
  Future<void> saveFormCompletionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('formFilled', true);
  }

  void submitForm(BuildContext context, WidgetRef ref) async {
    final formData = ref.read(formDataProvider);

    String academicStream = formData.academicStream ?? '';
    String yearOfStudy = formData.yearOfStudy ?? '';
    List<String> academicInterests = formData.academicInterests ?? [];
    List<String> extracurricularInterests =
        formData.extracurricularInterests ?? [];
    String activityPreference = formData.activityPreference ?? '';
    String timeCommitment = formData.timeCommitment ?? '';
    String communityEngagement = formData.communityEngagement ?? '';
    String communityType = formData.communityType ?? '';
    String leadershipPreference = formData.leadershipPreference ?? '';
    String longTermGoal = formData.longTermGoal ?? '';
    String collaborationPreference = formData.collaborationPreference ?? '';

    setState(() {
      isLoading = true;
    });

    if (studentId != null) {
      final response = await _authService.submitUserForm(
        studentId!,
        academicStream,
        yearOfStudy,
        academicInterests,
        extracurricularInterests,
        activityPreference,
        timeCommitment,
        communityEngagement,
        communityType,
        leadershipPreference,
        longTermGoal,
        collaborationPreference,
      );

      setState(() {
        isLoading = false;
      });

      if (response['success']) {
        // Save that the form has been filled and navigate to homepage
        await saveFormCompletionStatus();
        GoRouter.of(context).pushReplacement(StudentsRoutes.studentHomePage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    } else {
      // If studentId is null, handle error (you can show a snackbar or alert dialog here)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get student ID')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formData = ref.watch(formDataProvider);
    final formNotifier = ref.read(formDataProvider.notifier);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          SizedBox(
            height: screenHeight * 0.15,
            width: screenWidth * 0.4,
            child: Image.asset(
              "assets/images/ACADEMICVERSE.png",
              fit: BoxFit.cover,
            ),
          ),
          Stepper(
            steps: _getSteps(context, formNotifier, formData),
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep <
                  _getSteps(context, formNotifier, formData).length - 1) {
                setState(() {
                  _currentStep += 1;
                });
              } else {
                submitForm(context, ref);
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            onStepTapped: (step) {
              setState(() {
                _currentStep = step;
              });
            },
          ),
          Text("Picture here!")
        ],
      ),
    );
  }

  List<Step> _getSteps(
      BuildContext context, FormDataNotifier formNotifier, FormData formData) {
    return [
      // Step 1: Basic Information
      Step(
        title: Text("Basic Information"),
        content: Column(
          children: [
            DropdownButton<String>(
              value: formData.academicStream,
              hint: Text("Select Academic Stream"),
              items: ['Engineering', 'Science', 'Commerce', 'Arts', 'Other']
                  .map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateAcademicStream(value!);
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: formData.yearOfStudy,
              hint: Text("Select Year of Study"),
              items: [
                '1st Year',
                '2nd Year',
                '3rd Year',
                '4th Year',
                'Postgraduate'
              ].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateYearOfStudy(value!);
              },
            ),
            SizedBox(height: 20),
            Text("Select Academic Interests (up to 3):"),
            _buildMultiSelectDropdown(
              formData.academicInterests ?? [],
              _getAcademicInterests(formData.academicStream),
              (selectedItems) {
                formNotifier.updateAcademicInterests(selectedItems);
              },
            ),
          ],
        ),
      ),

      // Step 2: Extracurricular Interests
      Step(
        title: Text("Extracurricular Interests"),
        content: Column(
          children: [
            Text("Select Extracurricular Interests (up to 3):"),
            _buildMultiSelectDropdown(
              formData.extracurricularInterests ?? [],
              [
                'Sports',
                'Singing',
                'Dancing',
                'Acting',
                'Photography',
                'Public Speaking',
                'Chess',
                'Fashion Design',
                'Painting/Art'
              ],
              (selectedItems) {
                formNotifier.updateExtracurricularInterests(selectedItems);
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: formData.activityPreference,
              hint: Text("Do you prefer individual or team-based activities?"),
              items: ['Individual', 'Team-based', 'Both'].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateActivityPreference(value!);
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: formData.timeCommitment,
              hint: Text("How much time can you dedicate weekly?"),
              items: [
                'Less than 5 hours',
                '5-10 hours',
                '10-15 hours',
                '15+ hours'
              ].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateTimeCommitment(value!);
              },
            ),
          ],
        ),
      ),

      Step(
        title: Text("Social & Engagement Preferences"),
        content: Column(
          children: [
            DropdownButton<String>(
              value: formData.communityEngagement,
              hint: Text("How do you prefer to engage with communities?"),
              items: ['Online events', 'In-person events', 'Both'].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateCommunityEngagement(value!);
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: formData.communityType,
              hint: Text("What type of communities do you prefer?"),
              items: [
                'Academic-focused',
                'Skill-focused',
                'Hobby-focused',
                'Social-focused',
                'Leadership-focused'
              ].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateCommunityType(value!);
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: formData.leadershipPreference,
              hint: Text("Do you like to take on leadership roles?"),
              items: ['Yes', 'No', 'Maybe in the future'].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateLeadershipPreference(value!);
              },
            ),
          ],
        ),
      ),

      Step(
        title: Text("Goals and Future Ambitions"),
        content: Column(
          children: [
            DropdownButton<String>(
              value: formData.longTermGoal,
              hint: Text("What are your long-term goals?"),
              items: [
                'Build a strong academic network',
                'Enhance specific skills',
                'Make new friends and socialize',
                'Build leadership skills',
                'Collaborate on projects',
                'Other'
              ].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateLongTermGoal(value!);
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: formData.collaborationPreference,
              hint: Text("Would you like to collaborate on college events?"),
              items: ['Yes', 'No', 'Maybe later'].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                formNotifier.updateCollaborationPreference(value!);
              },
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildMultiSelectDropdown(List<String> selectedItems,
      List<String> options, Function(List<String>) onChanged) {
    return DropdownButtonFormField<String>(
      hint: Text("Select Interests"),
      items: options.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (value) {
        if (value != null &&
            !selectedItems.contains(value) &&
            selectedItems.length < 3) {
          setState(() {
            selectedItems.add(value);
          });
          onChanged(selectedItems);
        }
      },
    );
  }

  List<String> _getAcademicInterests(String? stream) {
    final academicInterestsMap = {
      'Engineering': [
        'DSA',
        'Machine Learning',
        'Web Development',
        'App Development',
        'AI/ML',
        'Blockchain',
        'Cybersecurity'
      ],
      'Science': [
        'Physics',
        'Chemistry',
        'Biology',
        'Mathematics',
        'Statistics'
      ],
      'Commerce': [
        'Economics',
        'Business Studies',
        'Accounting',
        'Finance',
        'Marketing'
      ],
      'Arts': [
        'History',
        'Literature',
        'Philosophy',
        'Fine Arts',
        'Performing Arts'
      ],
      'Other': ['Other'],
    };
    return academicInterestsMap[stream] ?? [];
  }
}
