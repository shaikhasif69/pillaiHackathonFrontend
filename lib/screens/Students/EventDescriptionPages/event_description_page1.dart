import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';

class EventDescPage1 extends StatefulWidget {
  const EventDescPage1({super.key});

  @override
  State<EventDescPage1> createState() => _EventDescPage1State();
}

class _EventDescPage1State extends State<EventDescPage1> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.eventDescBackground,
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.34,
              child: Stack(
                children: [
                  // Image.asset("assets/theDots.png"),
                   Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/theDots.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
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
                              )),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    print("like");
                                  },
                                  child: const Icon(
                                    Icons.heart_broken,
                                    size: 40,
                                  )),
                              const SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                Icons.more_vert_rounded,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Chess event",
                                style: GoogleFonts.agdasima(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "Chess event",
                                style: GoogleFonts.agdasima(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(88),
                              child: Image.asset('assets/img_event_1.png',
                                  fit: BoxFit.cover),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              child: Container(
                color: MyColors.ourBackground,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Chess event",
                              style: GoogleFonts.agdasima(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              "Chess event",
                              style: GoogleFonts.agdasima(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(68),
                            child: Image.asset('assets/img_event_1.png',
                                fit: BoxFit.cover),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Location : Pillai College of engineering",
                          style: GoogleFonts.agdasima(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Location : Pillai College of engineering",
                          style: GoogleFonts.agdasima(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Location : Pillai College of engineering",
                          style: GoogleFonts.agdasima(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 30, top: 20, right: 30, bottom: 20),
                      height: screenHeight * 0.13,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text("many many text here!"),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: MyColors.ourPrimary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Done ",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
