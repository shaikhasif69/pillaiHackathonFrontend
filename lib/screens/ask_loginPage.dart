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
              height: 100,
            ),
            Container(
              height: 320,
              width: double.infinity,
              child: Image.asset(
                "assets/images/ACADEMICVERSE.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(CommonRoutes.collegeIdLogin);
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
                      "Sign in with College Id",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Not a current Student or Faculty? ",
              style: GoogleFonts.abyssinicaSil(fontSize: 16),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Text(
              "Reconnect with the roots that shaped you,",
              style: GoogleFonts.abyssinicaSil(fontSize: 17),
            ),
            Text(
              "and let your journey inspire the next generation.",
              style: GoogleFonts.abyssinicaSil(fontSize: 17),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
