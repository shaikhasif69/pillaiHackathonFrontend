import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/Member.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class MemberListNotifier extends StateNotifier<List<Member1>?> {
  MemberListNotifier() : super(null);

  getEventOfSpecificCommunity(String id) async {
    List<Member1>? data;

    data = await StudentServices.getSpecificCommunityAllMemeber(id);
    state = data;
  }
}

final memberListProvider =
    StateNotifierProvider<MemberListNotifier, List<Member1>?>(
        (ref) => MemberListNotifier());
