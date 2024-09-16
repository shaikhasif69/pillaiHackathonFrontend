import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.0.108:3000';

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
