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
      print("the user: " + user.toString()); // Corrected print statement
      print("id : " +
          user['_id'].toString()); // Safely convert to String for print
      // Check if the user is a student
      final prefs = await SharedPreferences.getInstance();

      if (widget.email.contains('@student')) {
        await prefs.setString('userType', 'student');
        final studentBox = Hive.box<Student>('studentsBox');
        studentBox.put(
            user['_id'],
            Student(
              id: user['_id'],
              username: user['username'],
              name: "", // Empty string as a placeholder
              email: user['email'],
              department: "", // Empty string for now
              year: "", // Empty string for now
              address: "", // Empty string for now
              handicapped: false, // Default value for now
            ));

        print("Student box contents: ${studentBox.toMap()}");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StudentMultiStepForm(),
          ),
        );
      } else {
        await prefs.setString('userType', 'faculty');
        final facultyBox = Hive.box<Faculty>('facultyBox');
        facultyBox.put(
            user['_id'],
            Faculty(
                id: user['_id'],
                name: user['name'],
                email: user['email'],
                username: user['username'],
                department: "",
                subjects: List<String>.from(user['subjects'] ?? []),
                experience: 0,
                gender: ""));

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => FacultyMultiStepForm(),
        //   ),
        // );
      }

      // Optionally save token and login state using SharedPreferences
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
