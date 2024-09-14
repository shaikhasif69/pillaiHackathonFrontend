import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class on_board4 extends StatelessWidget {
  const on_board4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.9,
          child: LottieBuilder.asset(
            'assets/Lotty/finalConnect.json',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "LEAR, CONNECT & SHARE",
           style: GoogleFonts.agdasima(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
          ),
        )
      ]),
    );
  }
}
