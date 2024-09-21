import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/model/event_model.dart';
import 'package:pillai_hackcelestial/model/onGoingEventMode.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class EventDescPage3 extends StatefulWidget {
  final OnGoingEventModel data;
  const EventDescPage3({required this.data, super.key});

  @override
  State<EventDescPage3> createState() => _EventDescPage3State();
}

class _EventDescPage3State extends State<EventDescPage3> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  child: Container(
                    height: screenHeight * 0.50, // 50% height
                    color: MyColors.eventDescBackground,
                    child: Stack(
                      children: [
                        // Background Image
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/theDots.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("go back");
                                  },
                                  child: Icon(
                                    Icons.arrow_left_outlined,
                                    size: 50,
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print("like");
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    const Icon(
                                      Icons.more_vert_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 30),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.data.title,
                                      style: GoogleFonts.agdasima(
                                        fontSize: 38,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "124 Active Members",
                                      style: GoogleFonts.agdasima(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(90),
                                    child: widget.data.imageUrl == ""
                                        ? Image.asset('assets/img_event_1.png',
                                            fit: BoxFit.cover)
                                        : Image.network(widget.data.imageUrl),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenHeight * 0.32,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: LottieBuilder.asset(
                'assets/Lotty/done.json',
                frameRate: FrameRate.max,
                width: 50,
              ),
            ),
            Positioned(
                top: screenHeight * 0.62,
                // left: screenWidth * 0.05,
                right: screenWidth * 0.10,
                child: Column(
                  children: [
                    Text(
                      "Congratulations!!!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      "You have Successfully Enrolled for the event!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )
                  ],
                )),
            Positioned(
              top: screenHeight * 0.74,
              left: screenWidth * 0.25,
              right: screenWidth * 0.25,
              child: ElevatedButton(
                onPressed: () {
                  if (5 == 5) {
                    GoRouter.of(context).pushNamed(StudentsRoutes.eventPage5,
                        extra: widget.data);
                    // GoRouter.of(context).pushNamed(name)
                  }
                  // Add continue button functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.ourPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Event Ticket',
                    style: GoogleFonts.agdasima(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
