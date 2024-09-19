import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/widgets/tabItem.dart';

class createCommitteForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _createCommitteForm();
    throw UnimplementedError();
  }
}

class _createCommitteForm extends ConsumerState<createCommitteForm>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                pinned: true,
                // backgroundColor: Color.fromARGB(255, 227, 107, 149),
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "C O M M I T T E ",
                    style: GoogleFonts.agdasima(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  centerTitle: true,
                  background: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true, viewportFraction: 1, height: 500),
                    items: [
                      Image.asset(
                        "assets/images/29.jpg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/5064484.jpg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/5441752.jpg",
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverPersistentHeaderDelegate(
                      maxHeight: 50,
                      minHeight: 50,
                      child: Container(
                        child: PreferredSize(
                          preferredSize: const Size.fromHeight(1),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0)),
                            child: Container(
                              // height: 40,
                              // margin:
                              //     const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: const Color.fromARGB(255, 169, 137, 250),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TabBar(
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  dividerColor: Colors.transparent,
                                  indicator: const BoxDecoration(
                                    color: Color.fromARGB(255, 3, 255, 11),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  labelColor: Colors.white,
                                  labelStyle: TextStyle(fontSize: 18),
                                  unselectedLabelColor: Colors.black54,
                                  tabs: [
                                    TabItem(
                                        title: 'ART',
                                        type:
                                            "assets/images/art-and-design.png"),
                                    TabItem(
                                        title: 'Cultural',
                                        type: "assets/images/mandala.png"),
                                    TabItem(
                                        title: 'Tech',
                                        type:
                                            "assets/images/project-management.png"),
                                    TabItem(
                                        title: 'Council',
                                        type: "assets/images/council.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))),

              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.all(20),
              //     child: Container(
              //         height: MediaQuery.of(context).size.height,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: Colors.red)),
              //   ),
              // )
            ];
          },
          body: TabBarView(
            children: [
              Text(""),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red)),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red)),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  // MySliverPersistentHeaderDelegate({})
  final Widget child;
  final double minHeight;
  final double maxHeight;
  MySliverPersistentHeaderDelegate(
      {required this.child, required this.minHeight, required this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
