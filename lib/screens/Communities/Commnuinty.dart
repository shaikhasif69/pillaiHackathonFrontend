import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitteform.dart';
import 'package:pillai_hackcelestial/widgets/communityTab1.dart';
import 'package:pillai_hackcelestial/widgets/communityTab2.dart';

class CommnuintyPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CommnuintyPage();
    throw UnimplementedError();
  }
}

class _CommnuintyPage extends ConsumerState<CommnuintyPage> {
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 248, 241),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: Color.fromARGB(255, 250, 248, 241),
                leading: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Icon(Icons.group),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(StudentsRoutes.StudentFourm);
                    },
                  ),
                ),
                actions: [
                  Card(
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () {
                            GoRouter.of(context)
                                .pushNamed(StudentsRoutes.createCommunity);
                          },
                          icon: Icon(Icons.add))),
                  Card(
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () {
                            GoRouter.of(context)
                                .pushNamed(StudentsRoutes.chattingList);
                          },
                          icon: Icon(Icons.notifications_outlined)))
                ],
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverPersistentHeaderDelegate(
                      child: Container(
                        color: Color.fromARGB(255, 250, 248, 241),
                        height: 166,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: SizedBox(
                            height: 166,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Communites",
                                    style: GoogleFonts.mulish(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                Text("Get  advice, ask questions",
                                    style: GoogleFonts.mulish(
                                      color: Color.fromARGB(255, 124, 124, 124),
                                      fontSize: 16,
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                TabBar(
                                  tabAlignment: TabAlignment.start,
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  dividerColor: Colors.transparent,
                                  indicator: const BoxDecoration(
                                    color: Color.fromARGB(255, 57, 121, 25),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  labelColor: Colors.white,
                                  labelStyle: GoogleFonts.mulish(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  unselectedLabelColor: Colors.black54,
                                  tabs: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          "🚀 Explore",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "☝️ My Community",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      minHeight: 166,
                      maxHeight: 166))
            ];
          },
          body: TabBarView(
            children: [CommunityTab1(), Communitytab2()],
          ),
        ),
      ),
    );
  }
}
