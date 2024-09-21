import 'dart:convert';

import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/user.dart';
import 'package:http/http.dart' as http;

import 'package:pillai_hackcelestial/services/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FacultyServices {
  static Future<User?> getUserData() async {
    print("object1");
    try {
      await StudentServices.myShredPrefs();
      var header = await StudentServices.getHeaders();
      // dev.log(myId);
      print("Headers : $header");
      var res = await http.get(Uri.parse(urlAddress + "/users/profile"),
          headers: header);
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        // dev.log(data.toString());
        // dev.log(data['facultyDetails'].toString());
        // Store fetched data in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('Faculty_username', data['username']);
        await prefs.setString('Faculty_email', data['email']);
        await prefs.setString('Faculty_image', data['imageUrl']);
        await prefs.setString('Faculty_department',
            data['facultyDetails']['department'].toString());

        await prefs.setString('Faculty_experience', data['experience']);
        return User(
            username: data['username'],
            email: data['email'],
            imageUrl: data['imageUrl'],
            posts: [],
            communitiesCreated: [],
            communitiesJoined: [],
            events: []);
      }
    } catch (e) {
      // dev.log(e.toString());
      // dev.log("in user fetch");
      return null;
    }
  }
}
