import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';

class FacultyListProviderNotifier extends StateNotifier<List<Faculty>?> {
  FacultyListProviderNotifier() : super(null);

  getEventOfSpecificCommunity(String id) async {
    List<Faculty>? data;
    data = await StudentServices.getFacultyList();
    state = data;
  }
}

final EventListProvider =
    StateNotifierProvider<FacultyListProviderNotifier, List<Faculty>?>(
        (ref) => FacultyListProviderNotifier());
