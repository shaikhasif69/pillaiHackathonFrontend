import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pillai_hackcelestial/providers/EventListProvider.dart';
import 'package:pillai_hackcelestial/providers/PostListProvider.dart';
import 'package:pillai_hackcelestial/providers/memberListProvider.dart';

class Aboutcommunitytabbar3 extends ConsumerStatefulWidget {
  final String id;
  Aboutcommunitytabbar3({required this.id});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AboutCommunityTabBar2();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _AboutCommunityTabBar2 extends ConsumerState<Aboutcommunitytabbar3> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(memberListProvider.notifier)
          .getEventOfSpecificCommunity(widget.id);
    });
  }

  Widget build(context) {
    var data = ref.watch(memberListProvider);
    return data == null
        ? Center(child: CircularProgressIndicator())
        : data!.isEmpty
            ? Center(
                child: Text("No members"),
              )
            : ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (con, index) {
                  return Container(
                    height: 100,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(data[index].username == null
                              ? "null"
                              : data[index].username!),
                          leading: Container(
                            width: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: data[index].imageUrl == null ||
                                            data[index].imageUrl == ""
                                        ? AssetImage(
                                            "assets/images/Male User.png")
                                        : NetworkImage(data[index].imageUrl!))),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  );
                });
  }
}
