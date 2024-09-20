import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/Post.dart';
import 'package:pillai_hackcelestial/model/user.dart';
import 'package:pillai_hackcelestial/models/UserChatList.dart';
import 'package:pillai_hackcelestial/screens/Chatin/chatList.dart';

class chatBotProviderNotifier extends StateNotifier<List<String>?> {
  chatBotProviderNotifier() : super(null);
  bool isLoading = false;
  List<Map<String, String>> data = [];
  getResponse() async {
    List<UserChatList>? data;

    // data = await StudentServices.getUSerListForChat();
    // state = data;
  }
}

getPreviousChat() async {}

final chatBotProvider =
    StateNotifierProvider<chatBotProviderNotifier, List<String>?>(
        (ref) => chatBotProviderNotifier());
