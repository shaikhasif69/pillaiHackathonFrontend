import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitteform.dart';
import 'package:pillai_hackcelestial/widgets/TextBarFaculty.dart';

class AddPost extends ConsumerStatefulWidget {
  Communites data;
  AddPost({required this.data});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _JoinCommunities();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _JoinCommunities extends ConsumerState<AddPost> {
  TextEditingController tag = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Future getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  // TextEditingController txtDate = TextEditingController();

  DateTime selectedDateTime = DateTime.now();
  Widget build(context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 182, 90, 207),
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 250, 248, 241),
        //   leading: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: IconButton(
        //       icon: Icon(Icons.group),
        //       onPressed: () {},
        //     ),
        //   ),
        //   actions: [
        //     Card(
        //         child: IconButton(
        //             iconSize: 30, onPressed: () {}, icon: Icon(Icons.add))),
        //     Card(
        //         child: IconButton(
        //             iconSize: 30,
        //             onPressed: () {},
        //             icon: Icon(Icons.notifications_outlined)))
        //   ],
        // ),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              // snap: true,
              title: Text(
                "A D D - P O S T",
                style: GoogleFonts.mulish(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              pinned: false,
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromARGB(255, 182, 90, 207),
              expandedHeight: 200,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                    Text(
                                      "Created By- " +
                                          widget.data.creator!.username!,
                                      style: GoogleFonts.mulish(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ))),
                            Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 140,
                                  width: 140,
                                  child: widget.data.imageUrl == "" ||
                                          widget.data.imageUrl == null
                                      ? Image.asset(
                                          "assets/images/lgbtq-community-attractive-queer-man-with-flitter-face-waving-pride-rainbow-flag-looking-c-modified 1.png")
                                      : Image.network(
                                          widget.data.imageUrl!,
                                        ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
                minHeight: 1000,
                maxHeight: 1000,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color.fromARGB(0, 250, 248, 241)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            // color: Colors.amber,
                            height: MediaQuery.of(context).size.height * 0.29,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment(-1, 20),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                    child: Container(
                                      height: 260,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20)),
                                        color:
                                            Color.fromARGB(255, 182, 90, 207),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    color: _image == null
                                        ? Color.fromARGB(7, 0, 0, 0)
                                            .withOpacity(0.3)
                                        : null,
                                    elevation: 5,
                                    child: Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                            colorFilter: _image == null
                                                ? new ColorFilter.mode(
                                                    const Color.fromARGB(
                                                            7, 0, 0, 0)
                                                        .withOpacity(0.66),
                                                    BlendMode.dstATop)
                                                : null,
                                            image: _image != null
                                                ? FileImage(File(_image!.path))
                                                : AssetImage(
                                                    "assets/images/image.png"),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          icon: Icon(
                                              size: 40,
                                              Icons.add_a_photo_sharp),
                                          onPressed: () async {
                                            await getImageFromGallery();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              elevation: 5,
                              child: Container(
                                // height: 400,
                                width: double.infinity,
                                child: Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            "Let's  Post!",
                                            style: GoogleFonts.aBeeZee(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                              "Fill in all the details to bring your dream Event to life. ",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text(""),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16),
                                        child: TextFormField(
                                          controller: title,
                                          decoration: InputDecoration(
                                              hintText: "Save Cat",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 169, 137, 250)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 169, 137, 250)),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text("Discription"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16),
                                        child: TextFormField(
                                          controller: description,
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 169, 137, 250)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 169, 137, 250)),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text("Tag"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16),
                                        child: TextFormField(
                                          controller: tag,
                                          decoration: InputDecoration(
                                              hintText: "Save Cat",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 169, 137, 250)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 169, 137, 250)),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)))),
                                        ),
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              String? msg;
                                              if (title.text == "") {
                                                msg = "Enter Title";
                                              } else if (description.text ==
                                                  "") {
                                                msg = "Enter Discription";
                                              } else if (tag.text ==
                                                  ""
                                                      "") {
                                                msg = "tag missing";
                                              } else if (_image == null) {
                                                msg = "Upload image";
                                              }
                                              if (msg != null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            msg.toString())));
                                              } else {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        content: Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                      );
                                                    });
                                                var res = await StudentServices
                                                    .addCommunityPost({
                                                  "title": title.text,
                                                  "description":
                                                      description.text,
                                                  "image": _image!.path,
                                                  "communityId":
                                                      widget.data.sId,
                                                  "tag": tag.text
                                                });
                                                Navigator.of(context).pop();
                                                print(res);
                                                if (res['status'] == "done") {
                                                  print("dd");
                                                  GoRouter.of(context).pop();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Post created Successfull")));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(res[
                                                                  'msg']
                                                              .toString())));
                                                }
                                              }
                                            },
                                            child: Text("Create")),
                                      )
                                    ],
                                  ),
                                ),
                                // child: ,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          )
        ]));
  }
}
