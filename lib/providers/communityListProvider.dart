import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class CommunityListNotifier extends StateNotifier<List<Communites>?> {
  CommunityListNotifier() : super(null);

  getCommutityList() async {
    List<Communites>? data;

    data = await StudentServices.getCommunityList();
    print("got good");
    state = data;
  }

  updateCommunityList() async {
    List<Communites>? data;

    List<Communites>? data1 = state;
    data = await StudentServices.getCommunityList();

    if (data != null) {
      data.forEach((e) {
        state!.add(e);
      });
    }
  }
}

class MyCommunityListNotifier extends StateNotifier<List<Communites>?> {
  MyCommunityListNotifier() : super(null);
  bool createdCommunity = true;
  // bool joinedCommunity = true;
  getCommutityList() async {
    state = null;

    state = await StudentServices.getMyCommunities();
  }

  getJoinerCommunityList() async {
    state = null;

    state = await StudentServices.getMyCommunitiesJoined();
  }
}

final MycommunityListProvider =
    StateNotifierProvider<MyCommunityListNotifier, List<Communites>?>(
        (ref) => MyCommunityListNotifier());

final communityListProvider =
    StateNotifierProvider<CommunityListNotifier, List<Communites>?>(
        (ref) => CommunityListNotifier());
