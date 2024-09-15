import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/widgets/input_text_container.dart';

class CollegeIdLoginPage extends StatefulWidget {
  const CollegeIdLoginPage({super.key});

  @override
  State<CollegeIdLoginPage> createState() => _CollegeIdLoginPageState();
}

TextEditingController collegeId = TextEditingController();
TextEditingController password = TextEditingController();

class _CollegeIdLoginPageState extends State<CollegeIdLoginPage> {
  @override
  void initState() {
    collegeId = TextEditingController();
    password = TextEditingController();
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
                con: password,
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
                onTap: (){
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
