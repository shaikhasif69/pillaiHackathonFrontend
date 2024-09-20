import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/model/StudentFourm.dart';
import 'dart:developer' as developer;

import 'package:pillai_hackcelestial/screens/StudentFourm/studentFourm.dart';

class StudentFourmproviderNotifier
    extends StateNotifier<List<StudentFourmModel>?> {
  StudentFourmproviderNotifier() : super(null);
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
    state = await StudentServices.getStudentFourmchat();
  }

  void updateChats(StudentFourmModel d) {
    print(state!.length.toString());
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
      print(state!.length.toString());
      setState();

      print("updated chtas");
    }
  }
}

void refInitInSocket() {}

final StudentForumDiscussionProvider = StateNotifierProvider<
    StudentFourmproviderNotifier, List<StudentFourmModel>?>((ref) {
  return StudentFourmproviderNotifier();
});
