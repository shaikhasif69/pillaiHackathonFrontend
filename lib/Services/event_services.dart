import 'dart:convert';

import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Event.dart';

class EventServices {
  final String baseUrl = urlAddress;

  static Future<List<Event>> fetchOngoingEvents() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.223.46:3000/build/getongoing'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<Event> events = (data['events'] as List)
            .map((event) => Event.fromJson(event))
            .toList();

        return events;
      } else {
        throw Exception('Failed to load ongoing events');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Error occurred while fetching ongoing events');
    }
  }
}
