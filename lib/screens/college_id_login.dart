import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
// import 'package:pillai_hackcelestial/widgets/username.dart';
// import 'package:pillai_hackcelestial/widgets/username.dart';
import 'package:pillai_hackcelestial/services/auth_services.dart';
import 'package:pillai_hackcelestial/widgets/input_text_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollegeIdLoginPage extends StatefulWidget {
  const CollegeIdLoginPage({super.key});

  @override
  State<CollegeIdLoginPage> createState() => _CollegeIdLoginPageState();
}

class _CollegeIdLoginPageState extends State<CollegeIdLoginPage> {
  TextEditingController collegeId = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final AuthService _authService = AuthService();

  void signIn() async {
    setState(() {
      isLoading = true;
    });

    String email = collegeId.text.trim();
    String password = passwordController.text.trim();

    final response = await _authService.signIn(email, password);

    setState(() {
      isLoading = false;
    });

    if (response['success']) {
      // Store authentication status
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      // Navigate to respective home screen based on email type
      if (email.contains('@student')) {
        await prefs.setString('userType', 'student');

        GoRouter.of(context).pushReplacement(StudentsRoutes.studentHomePage);
      } else {
        await prefs.setString('userType', 'faculty');
        GoRouter.of(context).pushReplacement(FacultyRoutes.facultyHomePage);
      }
    } else {
      print("error bro error");
      print("error : " + response['message']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'])),
      );
    }
  }

  @override
  void initState() {
    collegeId = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              SizedBox(
                height: screenHeight * 0.35,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/ACADEMICVERSE.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              InputTextContainer(
                con: collegeId,
                label: "College ID",
              ),
              const SizedBox(height: 10),
              InputTextContainer(
                con: passwordController,
                label: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  signIn();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: MyColors.ourPrimary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log in",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
