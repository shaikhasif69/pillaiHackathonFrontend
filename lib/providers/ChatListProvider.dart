import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/Post.dart';
import 'package:pillai_hackcelestial/model/user.dart';
import 'package:pillai_hackcelestial/models/UserChatList.dart';
import 'package:pillai_hackcelestial/screens/Chatin/chatList.dart';

class UserChatListProviderNotifier extends StateNotifier<List<UserChatList>?> {
  UserChatListProviderNotifier() : super(null);

  getUSerChatList() async {
    List<UserChatList>? data;

    data = await StudentServices.getUSerListForChat();
    state = data;
  }
}

final UserChatListProvider =
    StateNotifierProvider<UserChatListProviderNotifier, List<UserChatList>?>(
        (ref) => UserChatListProviderNotifier());
