import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/widgets/AboutCommunityTabBar1.dart';
import 'package:pillai_hackcelestial/widgets/AboutCommunityTabBar2.dart';
import 'package:pillai_hackcelestial/widgets/AboutCommunityTabBar3.dart';

class CommnunityDetails extends ConsumerStatefulWidget {
  final Communites data;
  const CommnunityDetails({required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CommnunityDetails();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _CommnunityDetails extends ConsumerState<CommnunityDetails> {
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 90, 207),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 182, 90, 207),
        leading: Card(
            color: const Color.fromARGB(255, 81, 169, 84),
            child: Icon(color: Colors.white, Icons.arrow_back)),
        actions: [
          Card(
              color: const Color.fromARGB(255, 81, 169, 84),
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                      size: 24, color: Colors.white, Icons.favorite_border))),
          Card(
              color: const Color.fromARGB(255, 81, 169, 84),
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(size: 24, color: Colors.white, Icons.settings))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        widget.data.name!,
                        style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "124 Active Members",
                        style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  content: Center(
                                      child: CircularProgressIndicator()),
                                );
                              });
                          print(widget.data.id!);
                          var res = await StudentServices.joinCommunity(
                              widget.data.id!);
                          Navigator.of(context).pop();
                          if (res['status'] == 'done') {
                            GoRouter.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Congratulations You are a part of new Community")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Some Internal Error")));
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 81, 169, 84),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                "Join Now",
                                style: GoogleFonts.mulish(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )),
                      ),
                      Spacer()
                    ],
                  ),
                  // Spacer(),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                            image: widget.data.imageUrl == null
                                ? AssetImage(
                                    "assets/images/lgbtq-community-attractive-queer-man-with-flitter-face-waving-pride-rainbow-flag-looking-c-modified 1.png")
                                : NetworkImage(widget.data.imageUrl!))),
                  )
                ],
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "About this Community",
                              style: GoogleFonts.mulish(fontSize: 12),
                            ),
                            Spacer(),
                            Icon(Icons.bookmark)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          child: Text(
                            widget.data.description!,
                            style: GoogleFonts.mulish(fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        TabBar(
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
                                "Post",
                              ),
                              Text(
                                "Events",
                              ),
                              Text(
                                "Members",
                              ),
                            ]),
                        // Divider(),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Aboutcommunitytabbar1(
                                  id: widget.data.id!,
                                ),
                                Aboutcommunitytabbar2(id: widget.data.id!),
                                Aboutcommunitytabbar3(id: widget.data.id!)
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
