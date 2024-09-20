import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/models/faculty.dart';
import 'package:pillai_hackcelestial/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
<<<<<<< HEAD
  final String baseUrl = urlAddress;
=======
  final String baseUrl = 'http://192.168.0.102:3000';
>>>>>>> c2ea0c4c66b876a240a004729841066914031368

  Future<Map<String, dynamic>> signup(
      String email, String username, String password) async {
    print("hello ?? ");
    print("content : " + email + " " + password);
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print("hurray!");
        return {
          'success': true,
          'message': jsonDecode(response.body)['message'],
        };
      } else {
        print("no hurray!");

        return {
          'success': false,
          'message': jsonDecode(response.body)['message'],
        };
      }
    } catch (error) {
      return {
        'success': false,
        'message': 'An error occurred. Please try again.',
      };
    }
  }

  // sign in functino here !

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    // try {
    print("getting data here: " + email + " " + password);
    var temail = email.trim();
    var tpassword = password.toString();
    final response = await http.post(
      Uri.parse('$baseUrl/users/signin'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': temail,
        'password': tpassword,
      }),
    );

    if (response.statusCode == 201) {
      print("got and succesfful?");
      final body = jsonDecode(response.body);
      final user = body['user'];
      final userId = body['user']['_id'];
      final token = body['token'];

      // Save token to SharedPreferences
      ;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);
      await prefs.setString("_id", userId);

      // Save user data to Hive
      if (email.contains('@student')) {
        var studentBox = await Hive.openBox<Student>('studentsBox');
        studentBox.put(
          'student',
          Student(
            id: user['_id'],
            username: user['username'],
            name: "",
            email: user['email'],
            department: "",
            year: "",
            address: "",
            handicapped: false,
          ),
        );
      } else {
        var facultyBox = await Hive.openBox<Faculty>('facultyBox');
        facultyBox.put(
          'faculty',
          Faculty(
            id: user['_id'],
            username: user['username'],
            name: user['name'],
            email: user['email'],
            department: user['department'],
            subjects: List<String>.from(user['subjects']),
            experience: user['experience'],
            gender: user['gender'],
          ),
        );
      }

      return {'success': true, 'user': user, 'token': token};
    } else {
      print("what is the issue???");
      return {
        'success': false,
        'message': jsonDecode(response.body)['message'],
      };
    }
    // } catch (error) {
    //   return {'success': false, 'message': 'An error occurred.'};
    // }
  }

  Future<Map<String, dynamic>> verifyOTP(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/verify-otp'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'otp': otp,
        }),
      );

      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        return {
          'success': true,
          'user': body['user'],
          'token': body['token'],
          'message': 'OTP verified successfully.',
        };
      } else {
        final body = jsonDecode(response.body);
        return {
          'success': false,
          'message': body['message'] ?? 'OTP verification failed.',
        };
      }
    } catch (error) {
      return {
        'success': false,
        'message': 'An error occurred. Please try again.',
      };
    }
  }

  Future<Map<String, dynamic>> submitUserForm(
    String userId,
    String academicStream,
    String yearOfStudy,
    List<String> academicInterests,
    List<String> extracurricularInterests,
    String activityPreference,
    String timeCommitment,
    String communityEngagement,
    String communityType,
    String leadershipPreference,
    String longTermGoal,
    String collaborationPreference,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/user-form'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userId': userId,
          'academicStream': academicStream,
          'yearOfStudy': yearOfStudy,
          'academicInterests': academicInterests,
          'extracurricularInterests': extracurricularInterests,
          'activityPreference': activityPreference,
          'timeCommitment': timeCommitment,
          'communityEngagement': communityEngagement,
          'communityType': communityType,
          'leadershipPreference': leadershipPreference,
          'longTermGoal': longTermGoal,
          'collaborationPreference': collaborationPreference,
        }),
      );

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': jsonDecode(response.body)['message'],
        };
      } else {
        return {
          'success': false,
          'message': jsonDecode(response.body)['message'],
        };
      }
    } catch (error) {
      return {
        'success': false,
        'message': 'An error occurred. Please try again.',
      };
    }
  }
}
