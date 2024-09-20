import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/model/StudentFourm.dart';
import 'package:pillai_hackcelestial/providers/DiscussionProvider.dart';
import 'package:pillai_hackcelestial/providers/StudenFourmProvider.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';

class StudentFourmDiscussionchatlist extends ConsumerStatefulWidget {
  ScrollController desCo;
  ScrollController nest;
  Function sendMessage;
  String communityId;
  StudentFourmDiscussionchatlist(
      {required this.communityId,
      required this.desCo,
      required this.nest,
      required this.sendMessage});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _Discussionchatlist();
    throw UnimplementedError();
  }
}

class _Discussionchatlist
    extends ConsumerState<StudentFourmDiscussionchatlist> {
  TextEditingController msg = TextEditingController();
  @override
  void initState() {
    super.initState();
    mySocketConnect.getDissInit(ref);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(StudentForumDiscussionProvider.notifier).getPreviousChats(
          set: set, commnunityId: widget.communityId, conn: widget.desCo);
    });
  }

  void set() {
    print(" try to update");
    setState(() {});
  }

  Widget build(context) {
    var data = ref.watch(StudentForumDiscussionProvider);
    data != null ? print(data!.length) : null;
    print("build");
    return data == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            color: Color.fromARGB(255, 250, 248, 241),
            // color: Colors.amber,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                // Text("Discussion"),
                data.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text("No Chats yet"),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                        controller: widget.desCo,
                        reverse: true,
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // Calculate the reversed index

                          if (StudentServices.myId != data[index].userId) {
                            return senderCard1(d: data[index]);
                          } else {
                            return reciver1(d: data[index]);
                          }
                        },
                      )),
                // Spacer(),
                Container(
                  color: Color.fromARGB(0, 254, 200, 4),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Focus(
                            onFocusChange: (b) {},
                            child: TextFormField(
                              onTap: () {
                                widget.nest
                                  ..animateTo(
                                    widget.nest.position.maxScrollExtent,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeOut,
                                  );
                              },
                              controller: msg,
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 250, 248, 241),
                                  hintText: "Save Cat",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 169, 137, 250)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 169, 137, 250)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(60)))),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              widget.sendMessage(msg.text);
                              msg.text = "";
                            },
                            icon: Icon(Icons.send))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}

Widget senderCard1({required StudentFourmModel d}) {
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
                  // Container(
                  //   height: 60,
                  //   width: 40,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: d.imgUrl == null || d.imgUrl == ""
                  //               ? AssetImage("assets/images/speaker.png")
                  //               : NetworkImage(d.imgUrl!))),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        d.userId == null ? "null" : d.username!,
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

Widget reciver1({required StudentFourmModel d}) {
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
                  // Container(
                  //   height: 60,
                  //   width: 40,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: d.imgUrl == null || d.imgUrl == ""
                  //               ? AssetImage("assets/images/speaker.png")
                  //               : NetworkImage(d.imgUrl!))),
                  // ),
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
