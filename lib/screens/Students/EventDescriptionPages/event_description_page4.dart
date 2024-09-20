import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/widgets/seperatorLine.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class EventDescPage4 extends StatefulWidget {
  const EventDescPage4({super.key});

  @override
  State<EventDescPage4> createState() => _EventDescPage4State();
}

class _EventDescPage4State extends State<EventDescPage4> {
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
                            SizedBox(height: screenHeight * 0.03),
                            Text(
                              "Here is your Event Ticket!",
                              style: GoogleFonts.agdasima(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenHeight * 0.18,
              left: screenWidth * 0.06,
              bottom: screenHeight * 0.1,
              right: screenWidth * 0.06,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(70),
                        child: Image.asset('assets/img_event_1.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Payment Options
                    Column(
                      children: [
                        Text(
                          "Event Name",
                          style: GoogleFonts.abyssinicaSil(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Location with date, with some other title",
                          style: GoogleFonts.abyssinicaSil(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Name"), Text("Ticket Number")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "The Name",
                              style: GoogleFonts.abyssinicaSil(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "The Number",
                              style: GoogleFonts.abyssinicaSil(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Date"), Text("Time")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "The Name",
                              style: GoogleFonts.abyssinicaSil(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "The Number",
                              style: GoogleFonts.abyssinicaSil(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                 
                    const MySeparator(color: Colors.grey),

                    SizedBox(height: screenHeight * 0.02),

                    Container(
                      height: screenHeight * 0.1,
                      child: SfBarcodeGenerator(
                        value: 'www.syncfusion.com',
                        symbology: Code128(),
                        showValue: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
