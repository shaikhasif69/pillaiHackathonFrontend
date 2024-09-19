import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'dart:developer' as developer;

class DiscussionpproviderNotifier extends StateNotifier<List<Discussion>?> {
  DiscussionpproviderNotifier() : super(null);
  late ScrollController con;
  late Function setState;
  int i = 0;
  void getPreviousChats(
      {required String commnunityId,
      required ScrollController conn,
      required Function set}) async {
    setState = set;
    con = conn;
    state = null;
    state = await StudentServices.getDiscussionById(commnunityId: commnunityId);
  }

  void updateChats(Discussion d) {
    if (state != null) {
      setState();
      state!.add(d);
      setState();
      if (con.hasClients) {
        con.animateTo(
          con.position.minScrollExtent,
          duration: Duration(milliseconds: 10),
          curve: Curves.fastOutSlowIn,
        );
      }
      setState();

      print("updated chtas");
    }
  }
}

void refInitInSocket() {}

final DiscussionProvider =
    StateNotifierProvider<DiscussionpproviderNotifier, List<Discussion>?>(
        (ref) {
  return DiscussionpproviderNotifier();
});
