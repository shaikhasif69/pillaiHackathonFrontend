import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';
import 'package:pillai_hackcelestial/model/Member.dart';
import 'package:pillai_hackcelestial/model/Post.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'dart:developer' as dev;

import 'package:pillai_hackcelestial/model/user.dart';

class StudentServices {
  static String myId = "66e6816f5992469e25bf5663";
  static Map<String, String> header = {
    'Authorization':
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hYWRhcnNoMjNjb21wQHN0dWRlbnQubWVzLmFjLmluIiwiaWQiOiI2NmU2OTI2MzM2NDU1MDcwZTcyZTRiY2IiLCJpYXQiOjE3MjY2NDYyNTcsImV4cCI6MTcyOTIzODI1N30.GVoAuF2PgiEnUfg1jOecZDVVnkrQkNr0Qj7en7PBMCc"
  };
  static Future<User?> getUserData() async {
    try {
      var res = await http.get(Uri.parse(urlAddress + "/users/profile"),
          headers: header);
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        // dev.log(data.toString());
        // dev.log(data['facultyDetails'].toString());
        return User(
            username: data['username'],
            email: data['email'],
            imageUrl: data['imageUrl'],
            posts: Post.maptoJson(data['posts']),
            communitiesCreated: data['communitiesCreated'],
            communitiesJoined:
                CommunitiesJoined.MapToJson(data['communitiesJoined']),
            events: data['events']);
      }
    } catch (e) {
      dev.log(e.toString());
      dev.log("in user fetch");
      return null;
    }
  }

  static Future<List<Faculty>?> getFacultyList() async {
    try {
      var res = await http.get(Uri.parse(urlAddress + "/faculty"));

      if (res.statusCode == 200) {
        List<Faculty> data = [];
        json.decode(res.body).forEach((e) {
          data.add(Faculty.fromJson(e));
        });
        return data;
      }
      return null;
    } catch (e) {
      dev.log(e.toString());
      dev.log("get faculty");
      return null;
    }
  }

  static Future<List<Communites>?> getCommunityList() async {
    try {
      var res =
          await http.get(Uri.parse(urlAddress + "/build/list-communities"));

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        List<Communites> daa = [];
        data['communities'].forEach((e) {
          daa.add(Communites.fromJson(e));
        });
        return daa;
      }
      return null;
    } catch (e) {
      dev.log(e.toString());
      dev.log("get Community");
      return null;
    }
  }

  static Future<List<Post1>?> getSpecificCommunityAllPost(String id) async {
    try {
      var res =
          await http.get(Uri.parse(urlAddress + "/build/communityPost/" + id));

      var data = json.decode(res.body);

      if (res.statusCode == 200) {
        List<Post1> p = [];
        data.forEach((e) {
          p.add(Post1.fromJson(e));
        });
        dev.log(data.toString());
        return p;
      } else if (res.statusCode == 404 &&
          data['message'] == "No posts found for this community") {
        return [];
      }
      dev.log("getSpecipicCommunityPost");
      return null;
    } catch (e) {
      dev.log("getSpecipicCommunityPost");
      dev.log(e.toString());
      return null;
    }
  }

  static Future<List<Event>?> getSpecificCommunityAllEvent(String id) async {
    try {
      var res = await http
          .get(Uri.parse(urlAddress + "/build/getCommunityEvents/" + id));

      var data = json.decode(res.body);

      if (res.statusCode == 200) {
        List<Event> p = [];
        data.forEach((e) {
          p.add(Event.fromJson(e));
        });
        return p;
      } else if (res.statusCode == 404 &&
          data['message'] == "No events found for this community.") {
        dev.log(data.toString());
        return [];
      }
      dev.log("getSpecipicCommunityPost");
      return null;
    } catch (e) {
      dev.log("getSpecipicCommunityPost");
      dev.log(e.toString());
      return null;
    }
  }

  static Future<List<Member1>?> getSpecificCommunityAllMemeber(
      String id) async {
    try {
      var res = await http
          .get(Uri.parse(urlAddress + "/build/getCommunityMembers/" + id));

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        // dev.log(data.toString());
        List<Member1> p = [];
        data['communities']['members'].forEach((e) {
          p.add(Member1.fromJson(e['userId']));
        });
        dev.log(data.toString());
        return p;
      } else if (res.statusCode == 404) {
        return [];
      }
      dev.log("getSpecificCommunityMembers");
      return null;
    } catch (e) {
      dev.log("getSpecipicCommunityPost");
      dev.log(e.toString());
      return null;
    }
  }

  static Future<List<Faculty>?> getFacultyListProvider() async {
    try {
      var res = await http.get(Uri.parse(urlAddress + "/faculty"));

      var data = json.decode(res.body);

      if (res.statusCode == 200) {
        List<Faculty> p = [];
        data.forEach((e) {
          p.add(Faculty.fromJson(e));
        });
        return p;
      } else if (res.statusCode == 404 &&
          data['message'] == "No events found for this community.") {
        dev.log(data.toString());
        return [];
      }
      dev.log("getFacultyList");
      return null;
    } catch (e) {
      dev.log("getFacultyList");
      dev.log(e.toString());
      return null;
    }
  }

  static Future<Map<String, String>> createCommunity(
      Map<String, dynamic> data) async {
    try {
      var req = http.MultipartRequest(
        "POST",
        Uri.parse(urlAddress + "/build/create-community"),
      );
      req.headers.addAll(header);
      req.fields['name'] = data['name'];
      req.fields['description'] = data['description'];
      req.fields['facultyEmail'] = data['facultyEmail'];
      req.fields['category'] = data['category'];
      req.files.add(await http.MultipartFile.fromPath('image', data['image']));
      var res = await req.send();
      print(res.statusCode);
      if (res.statusCode == 201) {
        return {"status": "done"};
      } else {
        dev.log("Create Community");
        String resss = await res.stream.bytesToString();
        dev.log(resss);
        return {"status": "fail", "msg": json.decode(resss)['message']};
      }
    } catch (e) {
      dev.log(e.toString());
      dev.log("Create Community");
      return {"status": "fail"};
    }
  }

  static Future<Map<String, String>> joinCommunity(String id) async {
    try {
      print({"communityId": id});
      var res = await http.post(
        Uri.parse(urlAddress + "/build/join-community/" + id),
        headers: header,
      );
      print(urlAddress + "/build/join-community/" + id);
      print(res.statusCode);
      if (res.statusCode == 200) {
        return {"status": "done"};
      } else {
        dev.log(res.body);
        return {"status": "fail"};
      }
    } catch (e) {
      dev.log(e.toString());
      dev.log("join community");
      return {"status": "fail"};
    }
  }

  static Future<List<Communites>?> getMyCommunities() async {
    try {
      var res = await http.get(Uri.parse(urlAddress + "/build/get-community"),
          headers: header);
      if (res.statusCode == 200) {
        List<Communites> p = [];
        var data = json.decode(res.body);
        data.forEach((e) {
          p.add(Communites.fromJson(e));
        });
        return p;
      } else {
        dev.log(res.body);
        dev.log("GetMyCommunity");
        return null;
      }
    } catch (e) {
      dev.log(e.toString());
      dev.log("GetMyCommunity");
      return null;
    }
  }

  static Future<List<Discussion>?> getDiscussionById(
      {required String commnunityId}) async {
    try {
      var res = await http.get(
          Uri.parse(urlAddress + "/build/get-prevMessage/" + commnunityId));
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        List<Discussion> p = [];
        data.forEach((e) {
          p.add(Discussion.fromJson(e));
        });
        return p;
      }
      dev.log(res.body);
      dev.log("getDisscuiionFormID");
      return null;
      ;
    } catch (e) {
      dev.log(e.toString());
      dev.log("getDisscuiionFormID");
      return null;
    }
  }
}
