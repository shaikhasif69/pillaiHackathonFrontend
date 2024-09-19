import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/Post.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class EventListProviderNotifier extends StateNotifier<List<Event>?> {
  EventListProviderNotifier() : super(null);

  getEventOfSpecificCommunity(String id) async {
    List<Event>? data;

    data = await StudentServices.getSpecificCommunityAllEvent(id);
    state = data;
  }
}

final EventListProvider =
    StateNotifierProvider<EventListProviderNotifier, List<Event>?>(
        (ref) => EventListProviderNotifier());
