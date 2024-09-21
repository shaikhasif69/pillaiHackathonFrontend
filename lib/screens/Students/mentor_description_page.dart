import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/components/constant.dart';

class MentorDescriptionPage extends StatefulWidget {
  const MentorDescriptionPage({super.key});

  @override
  State<MentorDescriptionPage> createState() => _MentorDescriptionPageState();
}

class _MentorDescriptionPageState extends State<MentorDescriptionPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.ourBackground,
      body: TheInsidesTab(screenHeight, screenWidth),
    );
  }

  Stack TheInsidesTab(double screenHeight, double screenWidth) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 30),
                    child: Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 30),
                        child: Icon(
                          Icons.add_box,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 30),
                        child: Icon(
                          Icons.notification_add_sharp,
                          size: 35,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Mentorship",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("It’s a great day to learn something new!"),
                  ),
                ],
              )

            ],
          )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.12,),
                          Text("Name here", style: TextStyle(fontSize: 18),), 
                          Text("Department", style: TextStyle(fontSize: 14),)

                        ],
                      ),
                ),
              ))
        ],
      ),
      Positioned(
          top: screenHeight * 0.22,
          right: screenWidth * 0.33,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              size: Size.fromRadius(68), // Image radius
              child: Image.asset("assets/img_event_1.png", fit: BoxFit.cover),
            ),
          )),
    ]);
  }
}
