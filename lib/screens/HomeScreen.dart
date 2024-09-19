import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/widgets/EventsCrad.dart';
import 'package:pillai_hackcelestial/widgets/StudentCard.dart';
import 'package:pillai_hackcelestial/widgets/UserProfileHomePage.dart';
import 'package:pillai_hackcelestial/widgets/getCommuityListPorvider.dart';
import 'package:pillai_hackcelestial/widgets/getFaclutyListProvider.dart';
import 'package:pillai_hackcelestial/widgets/mentorCards.dart';

class Homescreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
    throw UnimplementedError();
  }
}

class _HomeScreen extends ConsumerState<Homescreen> {
  Widget build(context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 400,
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(StudentsRoutes.community);
                },
                child: Text("Communities"))
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: SizedBox(
                height: 30,
                width: 40,
                child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/Google Alerts.png",
                )),
          ),
          InkWell(
            onTap: () {
              mySocketConnect.socket.emit("reciveMessage", {
                "userId": "66e6926336455070e72e4bcb",
                "roomId": "room1",
                "content": "ddd"
              });
            },
            child: SizedBox(
              height: 35,
              width: 40,
              child: Image.asset(
                fit: BoxFit.cover,
                "assets/images/Male User.png",
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHomePage(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                "Let's Build some Connections",
                style: GoogleFonts.abyssinicaSil(fontSize: 16),
              ),
            ),
            GetFalcultyList(),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let’s Catch up",
                      style: GoogleFonts.abyssinicaSil(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 302,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext con, int index) {
                            return StudentCard();
                          }),
                    ),
                  ],
                )),
            CommunityList()
          ],
        ),
      ),
    );
  }
}
