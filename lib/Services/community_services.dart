import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/services/student.dart';

class CommunityServices {
  static Future<List<Communites>> fetchCommunities() async {
      var header = await StudentServices.getStaffHeaders();

    final response = await http.get(Uri.parse(
        'http://192.168.79.200:3000/build/pending-community-approval',), headers:header );

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

  static Future<void> updateCommunityStatus(String communityId, String status) async {
  final url = Uri.parse('http://192.168.79.200:3000/build/approve-community');
  print("Id : " + communityId);
  print("status: " + status);
  
  try {
      var header = await StudentServices.getHeaders();
    print("header: $header");
    var body = json.encode({
        'communityId': communityId,
        'status': status,
      });
      print("Request body: $body");
    final response = await http.post(
      url,
      headers:header,
      body: body
    );

    if (response.statusCode == 200) {
      print('Community $status successfully');
    } else {
      print('Failed to update community status: ${response.statusCode}, ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
}
