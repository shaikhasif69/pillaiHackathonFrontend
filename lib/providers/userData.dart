import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Services/student.dart';
import 'package:pillai_hackcelestial/constant.dart';
import 'package:pillai_hackcelestial/model/user.dart';

class UserDataNotifier extends StateNotifier<User?> {
  UserDataNotifier() : super(null);

  Future<User?> getUserData() async {
    late User? data;
    if (constUserData == null) {
      data = await StudentServices.getUserData();
      state = data;
      return data;
    }
    return constUserData;
  }

  Future<User?> updateUserData() async {
    User? data;
    state = null;
    data = await StudentServices.getUserData();
    constUserData = data;
    state = data;
    return constUserData;
  }
}

final userDataprovider =
    StateNotifierProvider<UserDataNotifier, User?>((ref) => UserDataNotifier());
