import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class EventDescPage2 extends StatefulWidget {
  const EventDescPage2({super.key});

  @override
  State<EventDescPage2> createState() => _EventDescPage2State();
}

class _EventDescPage2State extends State<EventDescPage2> {
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
                                      "Chess Tale",
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
                                    child: Image.asset('assets/img_event_1.png',
                                        fit: BoxFit.cover),
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
              top: screenHeight * 0.38,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Method of Payment',
                      style: GoogleFonts.agdasima(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Payment Options
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'UPI',
                              groupValue: 'paymentMethod',
                              onChanged: (value) {
                                setState(() {
                                  print("something will happen if UPI");
                                  // Update selected value
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Image.asset(
                                "assets/upi.png",
                                width: screenWidth * 0.12,
                              ),
                            ),
                            Text(
                              'UPI',
                              style: GoogleFonts.agdasima(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'QR',
                              groupValue: 'paymentMethod',
                              onChanged: (value) {
                                setState(() {
                                  print("something will happen if UPI");
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                "assets/QR.png",
                                width: screenWidth * 0.12,
                              ),
                            ),
                            Text(
                              'QR',
                              style: GoogleFonts.agdasima(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (bool? value) {
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: Text(
                            'I hereby accept all the rules and regulations for the event and follow the responsibilities as per mentioned above for the role I selected.',
                            style: GoogleFonts.agdasima(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.74,
              left: screenWidth * 0.25,
              right: screenWidth * 0.25,
              child: ElevatedButton(
                onPressed: () {
                  if (5 == 5) {
                    GoRouter.of(context).pushNamed(StudentsRoutes.eventPage3);
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
                    'Continue',
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
