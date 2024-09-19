import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class AskLoginpage extends StatelessWidget {
  const AskLoginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              width: double.infinity,
              child: Image.asset(
                "assets/images/ACADEMICVERSE.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(CommonRoutes.signUpScreen);
              },
              child: Container(
                width: screenWidth * 0.7,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "images/google.png",
                      height: 30,
                    ),
                    Text(
                      "Sign Up with College Id",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              "Not a current Student or Faculty? ",
              style: GoogleFonts.abyssinicaSil(fontSize: 16),
            ),
            SizedBox(
              height: screenHeight * 0.11,
            ),
            Text(
                "Reconnect with the roots that shaped you,\n and let your journey inspire the next generation.", textAlign: TextAlign.center,
                style: GoogleFonts.abyssinicaSil(fontSize: 16),
                ),
            // Text(
            //   "and let your journey inspire the next generation.",
            //   style: GoogleFonts.abyssinicaSil(fontSize: 17),
            // ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            GestureDetector(
              onTap: () {
                print("Navigate to the Alumni Page Further Page");
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
                        "Let's Go Alumni ",
                        style: GoogleFonts.abyssinicaSil(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.06,
                        child: Image.asset(
                          "lib/icons/heart.png",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.abyssinicaSil(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushNamed(CommonRoutes.collegeIdLogin);
                  },
                  child: Text(
                    "Sign In.",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
