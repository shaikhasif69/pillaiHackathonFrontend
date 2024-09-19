import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class StudentListNotifier extends StateNotifier<List<Faculty>?> {
  StudentListNotifier() : super(null);

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
}

final StudentListProvider =
    StateNotifierProvider<StudentListNotifier, List<Faculty>?>(
        (ref) => StudentListNotifier());
