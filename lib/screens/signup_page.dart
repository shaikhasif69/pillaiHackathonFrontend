import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/userOtpForm.dart';
import 'package:pillai_hackcelestial/services/auth_services.dart';
import 'package:pillai_hackcelestial/widgets/input_text_container.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _authService = AuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signup() async {
    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Call the signup function from the service
    final result = await _authService.signup(email, username, password);

    if (result['success']) {
      // Show OTP screen or success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
       Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => userOtpFormPage(email: _emailController.text),
          ),
        );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
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
                con: _emailController,
                label: "College ID",
              ),
              const SizedBox(height: 10),
              InputTextContainer(
                con: _usernameController,
                label: "Username",
              ),
              const SizedBox(height: 10),
              InputTextContainer(
                con: _passwordController,
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
                  _signup();
                  // GoRouter.of(context).pushNamed(StudentsRoutes.studentSetup);
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
                          "Sign Up",
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
