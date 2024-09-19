import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class UFalcultyListNotifier extends StateNotifier<List<Faculty>?> {
  UFalcultyListNotifier() : super(null);
  List<Faculty> filteredData = [];
  getfaclutyList() async {
    List<Faculty>? data;
    if (consFacultyList == null) {
      data = await StudentServices.getFacultyList();
      state = data;
    }
  }

  getUpdatedFacultyList() async {
    List<Faculty>? data;
    data = await StudentServices.getFacultyList();
    state = data;
  }

  List<Faculty> filterFaculty(String text) {
    filteredData = [];
    getfaclutyList();
    state!.forEach((e) {
      if (e.username!.contains(text)) {
        filteredData.add(e);
      }
    });
    return filteredData;
  }
}

final FacultyListProvider =
    StateNotifierProvider<UFalcultyListNotifier, List<Faculty>?>(
        (ref) => UFalcultyListNotifier());
