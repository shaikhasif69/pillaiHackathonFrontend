import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/Post.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class PostListProviderNotifier extends StateNotifier<List<Post1>?> {
  PostListProviderNotifier() : super(null);

  getPostOfSpecificCommunity(String id) async {
    List<Post1>? data;

    data = await StudentServices.getSpecificCommunityAllPost(id);
    state = data;
  }
}

final PostListProvider =
    StateNotifierProvider<PostListProviderNotifier, List<Post1>?>(
        (ref) => PostListProviderNotifier());
