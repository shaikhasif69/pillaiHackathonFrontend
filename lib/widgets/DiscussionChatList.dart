import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/providers/DiscussionProvider.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';

class Discussionchatlist extends ConsumerStatefulWidget {
  ScrollController desCo;
  Function sendMessage;
  String communityId;
  Discussionchatlist(
      {required this.communityId,
      required this.desCo,
      required this.sendMessage});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _Discussionchatlist();
    throw UnimplementedError();
  }
}

class _Discussionchatlist extends ConsumerState<Discussionchatlist> {
  TextEditingController msg = TextEditingController();
  @override
  void initState() {
    super.initState();
    mySocketConnect.getDissInit(ref);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(DiscussionProvider.notifier).getPreviousChats(
          set: set, commnunityId: widget.communityId, conn: widget.desCo);
    });
  }

  void set() {
    setState(() {});
  }

  Widget build(context) {
    var data = ref.watch(DiscussionProvider);
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
                          final reversedIndex = data.length - 1 - index;

                          print(data[reversedIndex].content! +
                              " myId: " +
                              StudentServices.myId +
                              " msgId: " +
                              data[reversedIndex].userId! +
                              " " +
                              (StudentServices.myId ==
                                      data[reversedIndex].userId)
                                  .toString());

                          if (StudentServices.myId !=
                              data[reversedIndex].userId) {
                            return senderCard(d: data[reversedIndex]);
                          } else {
                            return reciver(d: data[reversedIndex]);
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
                          child: TextFormField(
                            controller: msg,
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 250, 248, 241),
                                hintText: "Save Cat",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 169, 137, 250)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 169, 137, 250)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)))),
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
