import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class on_board1 extends StatelessWidget {
  const on_board1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.9,
          child: LottieBuilder.asset(
            'assets/Lotty/createProfileAnimatino.json',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "CREATE YOUR PROFILE",
            style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 37, 37, 37)),
          ),
        )
      ]),
    );
  }
}
