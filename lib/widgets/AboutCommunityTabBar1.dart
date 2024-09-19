import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pillai_hackcelestial/providers/PostListProvider.dart';

class Aboutcommunitytabbar1 extends ConsumerStatefulWidget {
  final String id;
  Aboutcommunitytabbar1({required this.id});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AboutCommunityTabBar1();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _AboutCommunityTabBar1 extends ConsumerState<Aboutcommunitytabbar1> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(PostListProvider.notifier)
          .getPostOfSpecificCommunity(widget.id);
    });
  }

  Widget build(context) {
    var data = ref.watch(PostListProvider);
    return Container(
      // color: Colors.amber,
      child: data == null
          ? Center(child: CircularProgressIndicator())
          : data.isEmpty
              ? Center(
                  child: Text("No Post"),
                )
              : ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (cont, index) {
                    // Parse the string to DateTime
                    DateTime dateTime = DateTime.parse(data[index].createdAt!);

                    // Format the date to dd/mm/yyyy
                    String formattedDate =
                        '${dateTime.day.toString().padLeft(2, '0')}/'
                        '${dateTime.month.toString().padLeft(2, '0')}/'
                        '${dateTime.year}';
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          height: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: data[index].imageUrl == null ||
                                                data[index].imageUrl == ""
                                            ? AssetImage(
                                                "assets/images/image.png")
                                            : NetworkImage(
                                                data[index].imageUrl!))),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        data[index].author!.username!,
                                        style: GoogleFonts.mulish(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_border)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.share)),
                                  ],
                                ),
                              ),
                              SizedBox(),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 16, 16, 12),
                                child: Container(
                                  height: 50,
                                  // color: Colors.amber,
                                  child: Text(
                                    data[index].content!,
                                    style: GoogleFonts.mulish(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 124, 124, 124)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  "Created By",
                                  style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                          255, 124, 124, 124)),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      data[index].author!.username!,
                                      style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 124, 124, 124)),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "Created at: " + formattedDate,
                                      style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 124, 124, 124)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
    );
    ;
  }
}
