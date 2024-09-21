import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lottie/lottie.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/models/UserChatList.dart';
import 'package:pillai_hackcelestial/models/chattingModel.dart';
import 'package:pillai_hackcelestial/providers/ChatBotProvider.dart';
import 'package:pillai_hackcelestial/providers/ChattingProvider.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';

class ChatBot extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ChattingPage();
    throw UnimplementedError();
  }
}

class _ChattingPage extends ConsumerState<ChatBot> {
  TextEditingController msg = TextEditingController();
  ScrollController scr = ScrollController();
  void update() {
    setState(() {});
  }

  void updated() {
    setState(() {});
  }

  // FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    // flutterTts.setLanguage("en-US");
    // flutterTts.setSpeechRate(0.5);
    // flutterTts.setPitch(1.5);
    // flutterTts.setVoice("en-us-x-sfg#male_1-local");
    mySocketConnect.getChatinit(ref);
    ref.read(chatBotProvider.notifier).setState = updated;
    ref.read(chatBotProvider.notifier).isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // scr.jumpTo(value)
    });

    // TODO: implement initState
    // mySocketConnect.socket.emit("1v1chat", {
    //   "userId": StudentServices.myId,
    //   "targetUserId": widget.user.sId,
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage("assets/images/mandala.png"))),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Pillai Bot")
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 248, 241),
      body: Column(
        children: [
          Expanded(
            flex: 85, // 95% of the available height
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ref.read(chatBotProvider.notifier).data.length == 0
                  ? Center(
                      child: Text("Ask Question"),
                    )
                  : ListView.builder(
                      // reverse: true,
                      controller: scr,
                      itemCount:
                          ref.read(chatBotProvider.notifier).data.length + 1,
                      itemBuilder: (context, index) {
                        final reversedIndex = index;
                        return ref.read(chatBotProvider.notifier).data.length ==
                                index
                            ? ref.read(chatBotProvider.notifier).isLoading
                                ? Row(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        // width: 40,
                                        child: Lottie.asset(
                                            "assets/Lotty/Animation - 1726842498456.json"),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : ref.read(chatBotProvider.notifier).data[index]
                                        ['user'] ==
                                    "sender"
                                ? SenderChatBUbble(
                                    context,
                                    ref
                                        .read(chatBotProvider.notifier)
                                        .data[index]['msg']
                                        .toString())
                                : ReciverChatBUbble(
                                    context,
                                    ref
                                        .read(chatBotProvider.notifier)
                                        .data[index]['msg']
                                        .toString());
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
                      onPressed: () async {
                        if (msg.text != "") {
                          String s = "";
                          // flutterTts.stop();
                          setState(() {
                            ref
                                .read(chatBotProvider.notifier)
                                .data
                                .add({"msg": msg.text, "user": "reciver"});
                            s = msg.text;
                            msg.text = "";
                            ref.read(chatBotProvider.notifier).isLoading = true;
                          });
                          var res = await StudentServices.getChatBot(s, ref);
                          // flutterTts.speak(res);
                          ref.read(chatBotProvider.notifier).isLoading = false;
                          ref
                              .read(chatBotProvider.notifier)
                              .data
                              .add({"msg": res, "user": "sender"});
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

Widget SenderChatBUbble(BuildContext context, String data) {
  return Container(
    // color: Colors.amber,
    width: MediaQuery.of(context).size.width,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CircleAvatar(foregroundImage: AssetImage("assets/images/mandala.png")),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                  padding: const EdgeInsets.all(16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 900, // Maximum height constraint
                      maxWidth: 300, // Maximum width constraint (optional)
                    ),
                    child: Container(
                      // color: Colors.lightBlueAccent, // For visibility
                      child: Text(
                        data,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.start, // Center the text
                      ),
                    ),
                  ),
                ),
              )),
        )
      ],
    ),
  );
}

Widget ReciverChatBUbble(BuildContext context, String data) {
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                        data,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.start, // Center the text
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
