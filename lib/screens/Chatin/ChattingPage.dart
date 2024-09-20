import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/models/UserChatList.dart';
import 'package:pillai_hackcelestial/models/chattingModel.dart';
import 'package:pillai_hackcelestial/providers/ChattingProvider.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';

class ChattingPage extends ConsumerStatefulWidget {
  UserChatList user;
  ChattingPage({required this.user});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ChattingPage();
    throw UnimplementedError();
  }
}

class _ChattingPage extends ConsumerState<ChattingPage> {
  TextEditingController msg = TextEditingController();
  ScrollController scr = ScrollController();
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    mySocketConnect.getChatinit(ref);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ChattingProvider.notifier).getPreviousChats(
            set: update,
            userId: StudentServices.myId,
            tragetId: widget.user.sId!,
            conn: scr,
          );
      // scr.jumpTo(value)
    });

    // TODO: implement initState
    mySocketConnect.socket.emit("1v1chat", {
      "userId": StudentServices.myId,
      "targetUserId": widget.user.sId,
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = ref.watch(ChattingProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.user.imageUrl == null ||
                                widget.user.imageUrl == ""
                            ? AssetImage("assets/images/mandala.png")
                            : NetworkImage(widget.user.imageUrl!))),
              ),
              SizedBox(
                width: 10,
              ),
              Text(widget.user.username!)
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 248, 241),
      body: Column(
        children: [
          Expanded(
            flex: 85, // 95% of the available height
            child: data == null
                ? Center(child: CircularProgressIndicator())
                : data.isEmpty
                    ? Center(
                        child: Text("No chatds"),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            controller: scr,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final reversedIndex = index;

                              if (StudentServices.myId ==
                                  data[reversedIndex].userId) {
                                return SenderChatBUbble(
                                    context, data[reversedIndex]);
                              } else {
                                return ReciverChatBUbble(
                                    context, data[reversedIndex]);
                              }
                            }),
                      ),
          ),
          Expanded(
            flex: 15, // 5% of the available height
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Focus(
                      onFocusChange: (b) {},
                      child: TextFormField(
                        onTap: () {},
                        controller: msg,
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 250, 248, 241),
                            hintText: "Save Cat",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 169, 137, 250)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 169, 137, 250)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)))),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print(widget.user.sId.toString() +
                            "_" +
                            StudentServices.myId.toString());
                        mySocketConnect.socket.emit("message", {
                          "roomId": widget.user.sId.toString() +
                              "_" +
                              StudentServices.myId,

                          // Room ID based on the two users
                          "userId": widget.user.sId, // Your user ID
                          "content": msg.text, // Message content
                          "discussion":
                              false, // Set this to false for 1v1 messages
                        });
                        if (msg.text != "") {
                          setState(() {
                            msg.text = "";
                          });
                        }
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}

Widget SenderChatBUbble(BuildContext context, ChattingModel data) {
  return Container(
    // color: Colors.amber,
    width: MediaQuery.of(context).size.width,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            foregroundImage: data.imageUrl == null || data.imageUrl == ""
                ? AssetImage("assets/images/mandala.png")
                : NetworkImage(data.imageUrl!)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.3),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: SizedBox(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(data.content!)),
              ))),
        )
      ],
    ),
  );
}

Widget ReciverChatBUbble(BuildContext context, ChattingModel data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      // color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.3),
                    borderRadius: BorderRadius.only(
                        // topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 900, // Maximum height constraint
                      maxWidth: 300, // Maximum width constraint (optional)
                    ),
                    child: Container(
                      // color: Colors.lightBlueAccent, // For visibility
                      child: Text(
                        data.content! + "",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.start, // Center the text
                      ),
                    ),
                  ),
                ),
              )),
          CircleAvatar(
              foregroundImage: data.imageUrl == null || data.imageUrl == ""
                  ? AssetImage("assets/images/mandala.png")
                  : NetworkImage(data.imageUrl!)),
        ],
      ),
    ),
  );
}
