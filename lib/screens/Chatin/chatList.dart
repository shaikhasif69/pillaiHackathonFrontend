import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/providers/ChatListProvider.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class ChatList extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _Chatlist();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _Chatlist extends ConsumerState<ChatList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(UserChatListProvider.notifier).getUSerChatList();
    });
  }

  Widget build(context) {
    var data = ref.watch(UserChatListProvider);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 248, 241),
      appBar: AppBar(
        // pinned: true,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chats",
                style: GoogleFonts.mulish(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Get  advice, ask questions",
                style: GoogleFonts.mulish(
                    color: const Color.fromARGB(255, 124, 124, 124),
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  fillColor: const Color.fromARGB(88, 124, 124, 124),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            data == null
                ? Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                : data.isEmpty
                    ? Center(
                        child: Text("No Chats Yet"),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                        StudentsRoutes.chattingPage,
                                        extra: data[index]);
                                  },
                                  child: ListTile(
                                    leading: Card(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: data[index].imageUrl ==
                                                            null ||
                                                        data[index].imageUrl ==
                                                            ""
                                                    ? AssetImage(
                                                        "assets/images/mandala.png")
                                                    : NetworkImage(data[index]
                                                        .imageUrl!))),
                                      ),
                                    ),
                                    title: Text(data[index].username == null
                                        ? "no name"
                                        : data[index].username!),
                                    subtitle: Text(data[index].role!),
                                    trailing: Icon(Icons.chat),
                                  ),
                                ),
                              );
                            }),
                      )
          ],
        ),
      ),
    );
  }
}
