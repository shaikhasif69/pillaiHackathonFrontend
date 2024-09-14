import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/widgets/username.dart';

class CollegeIdLoginPage extends StatefulWidget {
  const CollegeIdLoginPage({super.key});

  @override
  State<CollegeIdLoginPage> createState() => _CollegeIdLoginPageState();
}

class _CollegeIdLoginPageState extends State<CollegeIdLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 320,
              width: double.infinity,
              child: Image.asset(
                "assets/images/ACADEMICVERSE.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            InputTextContainer(),
            const SizedBox(
              height: 10,
            ),
            InputTextContainer(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text("Forgot Password?",  style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                )
              ],
            ), 

            const SizedBox(height: 20,),
             Container(
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
            )
          ],
        ),
      ),
    );
  }
}
