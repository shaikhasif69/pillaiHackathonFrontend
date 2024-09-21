import 'dart:convert';

import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/enroledEventModel.dart';
import 'package:pillai_hackcelestial/model/event_model.dart';
import 'package:pillai_hackcelestial/model/onGoingEventMode.dart';
import 'package:pillai_hackcelestial/model/upComingEventModel.dart';
import 'package:rive/rive.dart';
import 'package:socket_io_client/socket_io_client.dart';

class EventServices {
  final String baseUrl = urlAddress;

  static Future<List<OnGoingEventModel>> fetchOngoingEvents() async {
    final String url = 'http://192.168.218.46:3000/build/getongoing';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> eventsData = data['events'];

        List<OnGoingEventModel> events = eventsData
            .map((eventJson) => OnGoingEventModel.fromJson(eventJson))
            .toList();
        print("Events : $events");
        return events;
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      throw Exception('Error fetching events: $e');
    }
  }

  static Future<List<UpcomingEvent>> fetchUpcomingEvents() async {
    final String url = 'http://192.168.218.46:3000/build/getupcoming';

    try {
      print("Fetching upcoming events from $url...");

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("Response Body: ${response.body}");

        final Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> eventsData = data['events'];

        if (eventsData.isNotEmpty) {
          print(
              "Fetched Upcoming Events: ${eventsData.map((event) => event['title']).toList()}");
        } else {
          print("No upcoming events found.");
        }

        List<UpcomingEvent> events = eventsData
            .map((eventJson) => UpcomingEvent.fromJson(eventJson))
            .toList();

        return events;
      } else {
        print("Failed to load events. Status Code: ${response.statusCode}");
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print("Error fetching events: $e");
      throw Exception('Error fetching events: $e');
    }
  }

  static Future<List<EnrolledEventModel>?> fetchEnrolledEvents(
      String authToken) async {
    final String url = 'http://192.168.218.46:3000/build/enrolled-event';

    try {
      var header = await StudentServices.getHeaders();
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        print("Response Body for enrolled: ${response.body}");

        List<dynamic> data = json.decode(response.body);
        List<EnrolledEventModel> events = data
            .map((eventJson) => EnrolledEventModel.fromJson(eventJson))
            .toList();

        // Log the fetched events for debugging
        print(
            "Fetched Enrolled Events: ${events.map((e) => e.title).toList()}");

        return events;
      } else if (response.statusCode == 404) {
        return null;
      } else {
        print(
            "Failed to load enroled events . Status Code: ${response.statusCode}");
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print("Error fetching events: $e");
      throw Exception('Error fetching events: $e');
    }
  }
}
