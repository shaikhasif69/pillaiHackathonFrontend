import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/widgets/TextBarFaculty.dart';

class CreateCommunity extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _JoinCommunities();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _JoinCommunities extends ConsumerState<CreateCommunity> {
  TextEditingController facultyName = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  String v = "sports";
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Future getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Widget build(context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 248, 241),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 248, 241),
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(Icons.group),
              onPressed: () {},
            ),
          ),
          actions: [
            Card(
                child: IconButton(
                    iconSize: 30, onPressed: () {}, icon: Icon(Icons.add))),
            Card(
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined)))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 250, 248, 241)),
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
                                  color: Color.fromARGB(255, 161, 239, 186)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: _image == null
                                ? Color.fromARGB(7, 0, 0, 0).withOpacity(0.3)
                                : null,
                            elevation: 5,
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    colorFilter: _image == null
                                        ? new ColorFilter.mode(
                                            const Color.fromARGB(7, 0, 0, 0)
                                                .withOpacity(0.66),
                                            BlendMode.dstATop)
                                        : null,
                                    image: _image != null
                                        ? FileImage(File(_image!.path))
                                        : AssetImage("assets/images/image.png"),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(size: 40, Icons.add_a_photo_sharp),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    "Let's Get Started",
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
                                      "Fill in all the details to bring your dream committee to life. ",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 15, color: Colors.black)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text("Tittle"),
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
                                          borderRadius: BorderRadius.all(
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
                                          borderRadius: BorderRadius.all(
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
                                child: Text("Category"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: DropdownButtonFormField(
                                  style: GoogleFonts.mulish(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 169, 137, 250)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 169, 137, 250)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  isExpanded: true,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  value: v,
                                  onChanged: (value) {
                                    setState(() {
                                      v = value!;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Sports"),
                                      value: "sports",
                                    ),
                                    DropdownMenuItem(
                                        child: Text("technology"),
                                        value: "technology"),
                                    DropdownMenuItem(
                                        child: Text("coding"), value: "coding"),
                                    DropdownMenuItem(
                                        child: Text("music"), value: "music")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text("Tittle"),
                              ),
                              TextBarFaculty(
                                facultyName: facultyName,
                              ),
                              Center(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      String? msg;
                                      if (title.text == "") {
                                        msg = "Enter Title";
                                      } else if (description.text == "") {
                                        msg = "Enter Discription";
                                      } else if (facultyName.text == "") {
                                        msg = "FacultyName missing";
                                      } else if (_image == null) {
                                        msg = "Upload image";
                                      }
                                      if (msg != null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(msg.toString())));
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
                                            .createCommunity({
                                          "name": title.text,
                                          "description": description.text,
                                          "image": _image!.path,
                                          "category": v,
                                          "facultyEmail": facultyName.text
                                        });
                                        Navigator.of(context).pop();
                                        print(res);
                                        if (res['status'] == "done") {
                                          print("dd");
                                          GoRouter.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Commnuity created Successfull")));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      res['msg'].toString())));
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
        ));
  }
}
