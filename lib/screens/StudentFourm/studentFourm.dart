import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitteform.dart';
import 'package:pillai_hackcelestial/widgets/AboutCommunityTabBar1.dart';
import 'package:pillai_hackcelestial/widgets/AboutCommunityTabBar2.dart';
import 'package:pillai_hackcelestial/widgets/AboutCommunityTabBar3.dart';
import 'package:pillai_hackcelestial/widgets/DiscussionChatList.dart';
import 'package:pillai_hackcelestial/widgets/StudentFourmDisscussionList.dart';

class StudentForum extends ConsumerStatefulWidget {
  // final Communites data;
  StudentForum();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyCommunity();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _MyCommunity extends ConsumerState<StudentForum>
    with SingleTickerProviderStateMixin {
  String _id = "66ec6bdcc5d98d852110ac6e";
  late ScrollController dicCon;
  late ScrollController nested;
  late TextEditingController msg;
  @override
  void initState() {
    super.initState();
    msg = TextEditingController();
    nested = ScrollController();
    dicCon = ScrollController()..addListener(listCon);
    mySocketConnect.getFourmInit(ref);
    mySocketConnect.socket.emit("joinstudentGroup", {
      "groupId": _id,
      "userId": StudentServices.myId,
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // dicCon.jumpTo(value)NestedScrollView.scrollTo(0, 0);
    });
  }

  void sendMessage(String message) {
    print("msg sent studentForm");
    if (message.isNotEmpty) {
      mySocketConnect.socket.emit('sendMessage', {
        'groupId': _id,
        'userId': StudentServices.myId,
        'content': message,
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nested.dispose();
    dicCon.dispose();
    // mySocketConnect.socket.destroy();
    msg.dispose();
  }

  void listCon() {
    if (dicCon.position.pixels == dicCon.position.maxScrollExtent) {
      print("reached Top");
      //  nested.;
      // nested
      //   ..animateTo(
      //     nested.position.minScrollExtent,
      //     duration: Duration(seconds: 1),
      //     curve: Curves.easeOut,
      //   );
    }
  }

  Widget build(context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 182, 90, 207),
      // ),
      backgroundColor: Color.fromARGB(255, 250, 248, 241),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            controller: nested,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(
                    "S T U D E N T   F O R U M",
                    style: GoogleFonts.mulish(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromARGB(255, 154, 160, 154),
                  centerTitle: true,
                ),
                // SliverAppBar(
                //   // forceElevated: innerBoxIsScrolled,
                //   // pinned: true,

                //   backgroundColor: Color.fromARGB(255, 182, 90, 207),
                //   leading: Card(
                //       color: const Color.fromARGB(255, 81, 169, 84),
                //       child: Icon(color: Colors.white, Icons.arrow_back)),
                //   actions: [
                //     Card(
                //         color: const Color.fromARGB(255, 81, 169, 84),
                //         child: SizedBox(
                //             height: 50,
                //             width: 50,
                //             child: Icon(
                //                 size: 24,
                //                 color: Colors.white,
                //                 Icons.favorite_border))),
                //     Card(
                //         color: const Color.fromARGB(255, 81, 169, 84),
                //         child: SizedBox(
                //             height: 50,
                //             width: 50,
                //             child: Icon(
                //                 size: 24,
                //                 color: Colors.white,
                //                 Icons.settings))),
                //   ],
                // ),
                SliverAppBar(
                  // pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromARGB(255, 154, 160, 154),
                  expandedHeight: 300,
                  bottom: PreferredSize(
                    preferredSize: Size(double.infinity, 300),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/council (1).png"))),
                      // color: Colors.amber,
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Spacer(),
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    ),
                              )
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 250, 248, 241),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 16, 20, 12),
                              child: Container(
                                // color: Colors.amber,
                                child: SingleChildScrollView(
                                  child: Text(
                                    "The PCE Student Forum is an exclusive online platform designed to foster collaboration, knowledge-sharing, and interaction among students of Pillai College of Engineering (PCE). This forum serves as a hub where students from different branches and years can come together to exchange ideas, solve academic challenges, and build lasting connections.",
                                    textAlign: TextAlign.start,
                                    // overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.mulish(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 124, 124, 124)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                      // floating: true,
                      pinned: true,
                      delegate: MySliverPersistentHeaderDelegate(
                        child: TabBar(
                            indicatorWeight: 6,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor:
                                const Color.fromARGB(255, 206, 110, 89),
                            labelPadding: EdgeInsets.symmetric(vertical: 8),
                            labelStyle: GoogleFonts.mulish(
                                color: Color.fromARGB(255, 206, 110, 89),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                            unselectedLabelStyle: GoogleFonts.mulish(
                                color: Color.fromARGB(255, 124, 124, 124),
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                            tabs: [
                              Text(
                                "Discussion",
                              ),
                              Text("Polls"),
                              Text(
                                "Members",
                              ),
                            ]),
                        minHeight: 60,
                        maxHeight: 60,
                      )),
                ),
                // SliverPersistentHeader(
                //   pinned: true,
                //   delegate: MySliverPersistentHeaderDelegate(
                //       child: ,
                //       minHeight: MediaQuery.of(context).size.height * 0.85,
                //       maxHeight: MediaQuery.of(context).size.height * 0.85),
                // ),
              ];
            },
            body: TabBarView(
              // physics: NeverScrollableScrollPhysics(),
              children: [
                StudentFourmDiscussionchatlist(
                  nest: nested,
                  communityId: _id,
                  desCo: dicCon,
                  sendMessage: sendMessage,
                ),
                Text("Polll"),
                Column(
                  children: [
                    SizedBox(height: 80),
                    Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/council (1).png"),
                          radius: 30,
                        ),
                        title: Text("Hari OM"),
                        subtitle: Text("G-sec"),
                      );
                    })),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget senderCard({required Discussion d}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: const Color.fromARGB(109, 124, 124, 124), width: 0.3),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
            topRight: Radius.circular(60)),
      ),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: d.imgUrl == null || d.imgUrl == ""
                                ? AssetImage("assets/images/speaker.png")
                                : NetworkImage(d.imgUrl!))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        d.username!,
                        style: GoogleFonts.mulish(
                            color: Color.fromARGB(255, 182, 90, 207),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        datePrase(d.createdAt!),
                        style: GoogleFonts.mulish(
                            color: Color.fromARGB(255, 124, 124, 124),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.bookmark)),
                ],
              ),
            ),
            SizedBox(),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Container(
                  // color: Colors.blue,
                  child: Text(
                d.content!,
                style: GoogleFonts.mulish(
                    fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 211, 151, 151),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(d.downvotes.toString() + " response"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 227, 193),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(d.upvotes.toString() + " response"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

String datePrase(String d) {
  DateTime dateTime = DateTime.parse(d);

  // Format the date to dd/mm/yyyy
  String formattedDate = '${dateTime.day.toString().padLeft(2, '0')}/'
      '${dateTime.month.toString().padLeft(2, '0')}/'
      '${dateTime.year}';
  return formattedDate;
}

Widget reciver({required Discussion d}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color.fromARGB(109, 124, 124, 124), width: 0.3),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
      ),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.bookmark)),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        d.username!,
                        style: GoogleFonts.mulish(
                            color: Color.fromARGB(255, 182, 90, 207),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        datePrase(d.createdAt!),
                        style: GoogleFonts.mulish(
                            color: Color.fromARGB(255, 124, 124, 124),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: d.imgUrl == null || d.imgUrl == ""
                                ? AssetImage("assets/images/speaker.png")
                                : NetworkImage(d.imgUrl!))),
                  ),
                ],
              ),
            ),
            SizedBox(),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Container(
                  // color: Colors.blue,
                  child: Text(
                d.content!,
                style: GoogleFonts.mulish(
                    fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 211, 151, 151),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(d.downvotes.toString() + " response"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 227, 193),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(d.upvotes.toString() + " response"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
