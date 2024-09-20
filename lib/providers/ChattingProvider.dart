import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'dart:developer' as developer;

import 'package:pillai_hackcelestial/models/chattingModel.dart';

class ChattingproviderNotifier extends StateNotifier<List<ChattingModel>?> {
  ChattingproviderNotifier() : super(null);
  late ScrollController con;
  late Function setState;
  int i = 0;
  void getPreviousChats(
      {required String userId,
      required String tragetId,
      required ScrollController conn,
      required Function set}) async {
    setState = set;
    con = conn;

    // state = null;
    state =
        await StudentServices.getMyChat(userId: userId, taregetId: tragetId);
  }

  void updateChats(ChattingModel d) {
    if (state != null) {
      setState();
      state!.add(d);
      setState();
      if (con.hasClients) {
        con.animateTo(
          con.position.maxScrollExtent,
          duration: Duration(milliseconds: 10),
          curve: Curves.fastOutSlowIn,
        );
      }
      setState();

      print("updated chtas");
    }
  }
}

final ChattingProvider =
    StateNotifierProvider<ChattingproviderNotifier, List<ChattingModel>?>(
        (ref) {
  return ChattingproviderNotifier();
});
