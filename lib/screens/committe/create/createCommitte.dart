// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

// class createCommitte extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() {
//     return _createCommitte();
//     throw UnimplementedError();
//   }
// }

// const colorizeColors1 = [
//   Colors.purple,
//   Colors.blue,
//   Colors.yellow,
//   Colors.red,
// ];
// const colorizeColors = [
//   Color.fromARGB(255, 143, 6, 255),
//   Color.fromARGB(255, 68, 188, 3),
//   Color.fromARGB(255, 2, 245, 67),
//   Color.fromARGB(255, 128, 227, 8),
// ];

// class _createCommitte extends ConsumerState<createCommitte> {
//   Widget build(context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 80,
//             ),
//             SizedBox(
//                 child: AnimatedTextKit(
//                     pause: Duration(milliseconds: 10),
//                     repeatForever: true,
//                     animatedTexts: [
//                   ColorizeAnimatedText(
//                     "Your Committee Awaits ",
//                     textStyle: GoogleFonts.agdasima(
//                         fontSize: 48,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black),
//                     colors: colorizeColors,
//                   )
//                 ])),
//             SizedBox(
//               child: AnimatedTextKit(animatedTexts: [
//                 ColorizeAnimatedText(
//                   "Spark the Magic: Build Your Crew, Shape the Campus ",
//                   textStyle: GoogleFonts.agdasima(
//                       fontSize: 21,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black),
//                   colors: colorizeColors1,
//                 )
//               ]),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               decoration: BoxDecoration(shape: BoxShape.circle),
//               child: LottieBuilder.asset(
//                 "assets/Lotty/createCommite1.json",
//                 repeat: false,
//               ),
//             ),
//             Text(
//               "SUQAD UP:",
//               style: GoogleFonts.agdasima(
//                   fontSize: 48,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black),
//             ),
//             SizedBox(
//               height: 35,
//               child: AnimatedTextKit(
//                 repeatForever: true,
//                 animatedTexts: [
//                   RotateAnimatedText('Craft Your Ultimate Committee Today',
//                       textStyle: GoogleFonts.agdasima(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black)),
//                   RotateAnimatedText('Create Your Crew and Rule the Campus!',
//                       textStyle: GoogleFonts.agdasima(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black)),
//                   RotateAnimatedText('Build Your Dream Team',
//                       textStyle: GoogleFonts.agdasima(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   GoRouter.of(context)
//                       .pushNamed(StudentsRoutes.createCommitteForm);
//                 },
//                 child: Text("Build Your Committe")),
//             Spacer()
//           ],
//         ),
//       ),
//     );
//   }
// }
