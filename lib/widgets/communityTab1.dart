import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/providers/communityListProvider.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class CommunityTab1 extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CommunityTab1();
    throw UnimplementedError();
  }
}

class _CommunityTab1 extends ConsumerState<CommunityTab1> {
  late ScrollController controller;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(communityListProvider.notifier).getCommutityList();
    });
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        ref.read(communityListProvider.notifier).updateCommunityList();
      });
    }
  }

  Widget build(context) {
    var data = ref.watch(communityListProvider);
    print("its null");
    print(data.toString());
    return data == null
        ? Center(child: CircularProgressIndicator())
        : data.isEmpty
            ? Center(
                child: Text("Empty"),
              )
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 340,
                      // width: 200,
                      child: ListView.builder(
                          // itemExtent: 300,
                          controller: controller,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length + 1,
                          itemBuilder: (context, index) {
                            return (data.length) == index
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: 230,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 40,
                                          child: SizedBox(
                                            height: 300,
                                            width: 230,
                                            child: Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(40))),
                                              // elevation: 5,
                                              child: Container(
                                                height: 200,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 16, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 150,
                                                      ),
                                                      SizedBox(
                                                        height: 38,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Text(
                                                            data[index].name!,
                                                            style: GoogleFonts
                                                                .mulish(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        "124" + " Members",
                                                        style:
                                                            GoogleFonts.mulish(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        124,
                                                                        124,
                                                                        124)),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          GoRouter.of(context)
                                                              .pushNamed(
                                                                  StudentsRoutes
                                                                      .communityDetails,
                                                                  extra: data[
                                                                      index]);
                                                        },
                                                        child: Text(
                                                          "Join Now  ➜",
                                                          style: GoogleFonts
                                                              .mulish(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          209,
                                                                          89,
                                                                          198)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 16,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Container(
                                                height: 200,
                                                width: 180,
                                                decoration: BoxDecoration(
                                                    // color: Colors.black26,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: data[index]
                                                                    .imageUrl ==
                                                                null
                                                            ? AssetImage(
                                                                "assets/images/lgbtq-community-attractive-queer-man-with-flitter-face-waving-pride-rainbow-flag-looking-c-modified 1.png")
                                                            : NetworkImage(data[
                                                                    index]
                                                                .imageUrl!))),
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "upcoming events",
                              style: GoogleFonts.mulish(fontSize: 16),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 30,
                                shrinkWrap: true,
                                itemBuilder: (cont, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 170,
                                      // color: Colors.amber,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text(
                                                  "Portfolio with  AI ",
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("with Darrell Steward",
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Today- 08:00 PM",
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Spacer(),
                                            Spacer(),
                                            Spacer(),
                                            Spacer(),
                                            Card(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    // color: Colors.black26
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/images/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded-modified 3.png"))),
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
  }
}
