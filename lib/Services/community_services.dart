import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/model/faculty_committe.dart';
import 'package:pillai_hackcelestial/services/student.dart';

class CommunityServices {
  static Future<List<Communites>> fetchCommunities() async {
    var header = await StudentServices.getStaffHeaders();

    final response = await http.get(
        Uri.parse(
          urlAddress + '/build/pending-community-approval',
        ),
        headers: header);

    if (response.statusCode == 200) {
      print("working!!");
      List<dynamic> jsonData = jsonDecode(response.body);
      print(response.body);
      print("object");
      return jsonData
          .map((community) => Communites.fromJson(community))
          .toList();
    } else {
      print("hahahah");
      throw Exception('Failed to load communities');
    }
  }

  static Future<void> updateCommunityStatus(
      String communityId, String status) async {
    final url = Uri.parse(urlAddress + '/build/approve-community/$communityId/$status');
    print("Id : " + communityId);
    print("status: " + status);

    try {
      var header = await StudentServices.getHeaders();
      print("header: $header");
      var body = {
        'communityId': communityId,
        'status': status,
      };
      print("Request body: $body");
      final response = await http.post(url,  body: "hello world", headers: header,);

      if (response.statusCode == 200) {
        print('Community $status successfully');
      } else {
        print(
            'Failed to update community status: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<List<Community>> fetchFacultyCommunities() async {
    final url = Uri.parse(urlAddress + '/build/get-faculty-community');

    try {
      var header = await StudentServices.getHeaders();
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((community) => Community.fromJson(community))
            .toList();
      } else {
        throw Exception('Failed to load communities');
      }
    } catch (e) {
      print('Error fetching communities: $e'); // Improved logging
      throw Exception('Error fetching communities: $e');
    }
  }
}
