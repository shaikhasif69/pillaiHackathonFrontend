import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pillai_hackcelestial/providers/EventListProvider.dart';
import 'package:pillai_hackcelestial/providers/PostListProvider.dart';

class Aboutcommunitytabbar2 extends ConsumerStatefulWidget {
  final String id;
  Aboutcommunitytabbar2({required this.id});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AboutCommunityTabBar2();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _AboutCommunityTabBar2 extends ConsumerState<Aboutcommunitytabbar2> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(EventListProvider.notifier)
          .getEventOfSpecificCommunity(widget.id);
    });
  }

  Widget build(context) {
    var data = ref.watch(EventListProvider);
    return data == null
        ? Center(child: CircularProgressIndicator())
        : data!.isEmpty
            ? Center(
                child: Text("No Events"),
              )
            : Container(
                // color: Colors.amber,
                child: data == null
                    ? Center(child: CircularProgressIndicator())
                    : data.isEmpty
                        ? Center(
                            child: Text("No Event"),
                          )
                        : ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (cont, index) {
                              return Text(data[index].sId!);
                            }),
              );
    ;
  }
}
