import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/providers/communityListProvider.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class Communitytab2 extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _Communitytab2();
    throw UnimplementedError();
  }
}

class _Communitytab2 extends ConsumerState<Communitytab2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(MycommunityListProvider.notifier).createdCommunity) {
        ref.watch(MycommunityListProvider.notifier).getCommutityList();
      } else {
        ref.watch(MycommunityListProvider.notifier).getJoinerCommunityList();
      }
    });
  }

  Widget build(context) {
    var data = ref.watch(MycommunityListProvider);
    return Container(
      // color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: const Color.fromARGB(107, 124, 124, 124),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ref
                                  .read(MycommunityListProvider.notifier)
                                  .createdCommunity
                              ? Colors.green
                              : null),
                      onPressed: () {
                        ref
                            .read(MycommunityListProvider.notifier)
                            .createdCommunity = true;
                        ref
                            .read(MycommunityListProvider.notifier)
                            .getCommutityList();
                      },
                      child: SizedBox(
                          height: 60,
                          child: Center(child: Text("Created\n Communities")))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: !ref
                                  .read(MycommunityListProvider.notifier)
                                  .createdCommunity
                              ? Colors.green
                              : null),
                      onPressed: () {
                        ref
                            .read(MycommunityListProvider.notifier)
                            .createdCommunity = false;
                        ref
                            .read(MycommunityListProvider.notifier)
                            .getJoinerCommunityList();
                      },
                      child: SizedBox(
                          height: 60,
                          child: Center(child: Text("Joined \n Communities"))))
                ],
              ),
            ),
            data == null
                ? Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : data.isEmpty
                    ? Center(
                        child: Text(!ref
                                .read(MycommunityListProvider.notifier)
                                .createdCommunity
                            ? " :/ Join Communities"
                            : ":/ create Communities"),
                      )
                    : SingleChildScrollView(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (cont, index) {
                              var commu = data[index];
                              return InkWell(
                                onTap: () {
                                  !ref
                                          .read(
                                              MycommunityListProvider.notifier)
                                          .createdCommunity
                                      ? GoRouter.of(context).pushNamed(
                                          StudentsRoutes.MyCommunity,
                                          extra: data[index])
                                      : GoRouter.of(context).pushNamed(
                                          StudentsRoutes.myCreatedCommunity,
                                          extra: data[index]);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16.0, 4, 16, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40))),
                                    elevation: 10,
                                    child: Container(
                                      height: 220,
                                      // color: Colors.pink,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          commu.name!,
                                                          style: GoogleFonts
                                                              .mulish(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Image.asset(
                                                          "assets/images/Vector.png")
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      "with " +
                                                          commu.creator!
                                                              .username!,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 20,
                                                    child: Text(
                                                      commu.description!,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 12),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    244,
                                                                    255,
                                                                    246,
                                                                    212),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Text("4.8",
                                                                  style: GoogleFonts.mulish(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          207,
                                                                          154,
                                                                          23))),
                                                              Icon(
                                                                  size: 15,
                                                                  Icons.star,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          207,
                                                                          154,
                                                                          23))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    244,
                                                                    255,
                                                                    245,
                                                                    243),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "124 ",
                                                                style: GoogleFonts.mulish(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            207,
                                                                            111,
                                                                            90)),
                                                              ),
                                                              Icon(
                                                                size: 15,
                                                                Icons.star,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        207,
                                                                        111,
                                                                        90),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Spacer(),
                                            Spacer(),
                                            Spacer(),
                                            Spacer(),
                                            Expanded(
                                              flex: 40,
                                              child: Card(
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
                                                          image: commu.imageUrl ==
                                                                  null
                                                              ? AssetImage(
                                                                  "assets/images/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded-modified 3.png")
                                                              : NetworkImage(commu
                                                                  .imageUrl!))),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
          ],
        ),
      ),
    );
  }
}
