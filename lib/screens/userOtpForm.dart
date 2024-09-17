import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:pillai_hackcelestial/models/faculty.dart';
import 'package:pillai_hackcelestial/models/student.dart';
import 'package:pillai_hackcelestial/screens/Students/multi_step_form.dart';
import 'package:pillai_hackcelestial/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userOtpFormPage extends StatefulWidget {
  final String email;

  userOtpFormPage({Key? key, required this.email}) : super(key: key);

  @override
  _userOtpFormPageState createState() => _userOtpFormPageState();
}

class _userOtpFormPageState extends State<userOtpFormPage> {
  final TextEditingController otpController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;
  // final UserService userService = UserService();

  // void verifyOtp(BuildContext context) async {
  //   try {
  //     final response =
  //         await userService.verifyOtp(widget.email, otpController.text);
  //     if (response['response'] == 'Success') {
  //       User user = User.fromJson(response['user']);
  //       HiveUser hiveUser = HiveUser(
  //         id: user.id,
  //         firstName: user.firstName,
  //         lastName: user.lastName,
  //         address: user.address,
  //         phone: user.phone,
  //         email: user.email,
  //         username: user.username,
  //         profilePicture: user.profilePicture,
  //         gender: user.gender,
  //       );

  //       final hiveService = HiveService();
  //       await hiveService.saveUser(hiveUser);
  //       final userProvider = Provider.of<UserProvider>(context, listen: false);
  //       userProvider.setUser(User.fromJson(response['user']));
  //       await _authService.storeLoginDetails(
  //         'user',
  //         response['token'] ?? '',
  //         widget.email,
  //       );
  //       print('Navigating to home page...');
  //       GoRouter.of(context).pushNamed(PatientRoutes.homePage);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Invalid OTP')),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error during OTP verification: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('An error occurred. Please try again.')),
  //     );
  //   }
  // }
    AuthService authService = AuthService(); // Create an instance of AuthService

  void verifyOTP() async {
  setState(() {
    isLoading = true;
  });

  String otp = otpController.text.trim();

  final response = await authService.verifyOTP(widget.email, otp);

  setState(() {
    isLoading = false;
  });

  if (response['success']) {
    var user = response['user'];

    // Check if the user is a student
    if (widget.email.contains('@student')) {
      final studentBox = Hive.box<Student>('studentsBox');
      studentBox.put(user['id'], Student(
        id: user['id'],
        username: user['username'],
        name: user['name'],
        email: user['email'],
        department: user['department'],
        year: user['year'],
        address: user['address'],
        handicapped: user['handicapped'] ?? false,
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentMultiStepForm(),
        ),
      );
    } else {
      // Save faculty info locally
      final facultyBox = Hive.box<Faculty>('facultyBox');
      facultyBox.put(user['id'], Faculty(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        username: user['username'],
        department: user['department'],
        subjects: List<String>.from(user['subjects'] ?? []),
        experience: user['experience'],
        gender: user['gender'],
      ));

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => FacultyMultiStepForm(),
      //   ),
      // );
    }

    // Optionally save token and login state using SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('token', response['token']);
    
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response['message'])),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "Enter the code sent to your Email",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text(
                  widget.email,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter OTP',
                ),
                maxLength: 6,
                onChanged: (value) {
                  if (value.length == 6) {
                    print("yes yes all set");
                    // verifyOtp(
                    //     context);
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => verifyOTP(),
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
