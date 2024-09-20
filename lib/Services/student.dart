import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/Disscussion.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';
import 'package:pillai_hackcelestial/model/Member.dart';
import 'package:pillai_hackcelestial/model/Post.dart';
import 'package:pillai_hackcelestial/model/StudentFourm.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'dart:developer' as dev;

import 'package:pillai_hackcelestial/model/user.dart';
import 'package:pillai_hackcelestial/models/UserChatList.dart';
import 'package:pillai_hackcelestial/models/chattingModel.dart';
import 'package:pillai_hackcelestial/screens/Chatin/chatList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentServices {
  static late String myId;
  static late SharedPreferences pref;
  static late String token;
  static Future<void> myShredPrefs() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString("authToken")!;
    myId = pref.getString("_id")!;

    return null;
  }

  static Map<String, String> header = {'Authorization': "Bearer " + token};
  static Future<User?> getUserData() async {
    try {
      await StudentServices.myShredPrefs();
      dev.log(token);
      dev.log(myId);
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

  static Future<List<UserChatList>?> getUSerListForChat() async {
    try {
      var res = await http.get(Uri.parse(urlAddress + "/admin/getAllUsers"));

      if (res.statusCode == 200) {
        List<UserChatList> data = [];
        json.decode(res.body)['users'].forEach((e) {
          data.add(UserChatList.fromJson(e));
        });
        return data;
      }
      return null;
    } catch (e) {
      dev.log(e.toString());
      dev.log("get UserChatList");
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

  static Future<Map<String, String>> createEvent(
      Map<String, dynamic> data) async {
    try {
      var req = http.MultipartRequest(
        "POST",
        Uri.parse(urlAddress + "/build/events"),
      );
      req.headers.addAll(header);
      req.fields['title'] = data['title'];
      req.fields['description'] = data['description'];
      req.fields['date'] = data['date'];
      req.fields['communityId'] = data['communityId'];
      req.files.add(await http.MultipartFile.fromPath('image', data['image']));
      var res = await req.send();
      print(res.statusCode);
      if (res.statusCode == 201) {
        return {"status": "done"};
      } else {
        dev.log("Create event");
        String resss = await res.stream.bytesToString();
        dev.log(resss);
        return {"status": "fail", "msg": json.decode(resss)['message']};
      }
    } catch (e) {
      dev.log(e.toString());
      dev.log("Create event");
      return {"status": "fail"};
    }
  }

  static Future<Map<String, String>> addCommunityPost(
      Map<String, dynamic> data) async {
    try {
      var req = http.MultipartRequest(
        "POST",
        Uri.parse(urlAddress + "/build/createPost"),
      );
      req.headers.addAll(header);
      req.fields['title'] = data['title'];
      req.fields['content'] = data['description'];
      req.fields['tags[]'] = data['tag'];
      req.fields['communityId'] = data['communityId'];
      req.files.add(await http.MultipartFile.fromPath('image', data['image']));
      var res = await req.send();
      print(res.statusCode);
      if (res.statusCode == 200) {
        return {"status": "done"};
      } else {
        dev.log("Create event");
        String resss = await res.stream.bytesToString();
        dev.log(resss);
        return {"status": "fail", "msg": json.decode(resss)['message']};
      }
    } catch (e) {
      dev.log(e.toString());
      dev.log("Create event");
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
      print(res.statusCode);
      if (res.statusCode == 200) {
        List<Communites> p = [];
        var data = json.decode(res.body);
        data.forEach((e) {
          p.add(Communites.fromJson(e));
        });
        return p;
      } else if (res.statusCode == 404 &&
          json.decode(res.body)['message'] ==
              "No communities found for this user") {
        return [];
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

  static Future<List<Communites>?> getMyCommunitiesJoined() async {
    // try {
    var res = await http.get(
        Uri.parse(urlAddress + "/build/getJoined-community"),
        headers: header);

    print(res.statusCode);
    if (res.statusCode == 200) {
      List<Communites> p = [];
      var data = json.decode(res.body);
      data.forEach((e) {
        p.add(Communites.fromJson(e));
      });
      return p;
    } else if (res.statusCode == 404 &&
        json.decode(res.body)['message'] ==
            "No communities found for this user") {
      return [];
    } else {
      dev.log(res.body);
      dev.log("GetMyCommunity");
      return null;
    }
    // } catch (e) {
    //   dev.log(e.toString());
    //   dev.log("GetMyCommunity");
    //   return null;
    // }
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

  static Future<List<StudentFourmModel>?> getStudentFourmchat() async {
    try {
      var res = await http.get(Uri.parse(
          urlAddress + "/users/student-chat?groupId=66ec6bdcc5d98d852110ac6e"));
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        List<StudentFourmModel> p = [];
        data.forEach((e) {
          p.add(StudentFourmModel.fromJson(e));
        });
        return p;
      }
      dev.log(res.body);
      dev.log("getStudentFourm");
      return null;
    } catch (e) {
      dev.log(e.toString());
      dev.log("getStudentFourm");
      return null;
    }
  }

  static Future<List<ChattingModel>?> getMyChat(
      {required userId, required taregetId}) async {
    // try {
    // print()
    var res = await http.get(Uri.parse(urlAddress +
        "/users/user-chat/?userId1=" +
        userId +
        "&userId2=" +
        taregetId));
    dev.log(res.body);
    if (res.statusCode == 200) {
      dev.log(res.body);
      List<ChattingModel> data = [];
      var d = json.decode(res.body);
      d.forEach((e) {
        data.add(ChattingModel.fromJson(e));
      });
      return data;
    } else {
      dev.log(res.body);
      dev.log("Get MY Chat serverErr");
      return null;
    }
    // } catch (e) {
    //   dev.log(e.toString());
    //   dev.log("Get MY Chat");
    //   return null;
    // }
  }
}
