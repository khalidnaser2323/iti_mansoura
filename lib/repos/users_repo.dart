import 'dart:convert';

import 'package:my_app/handlers/http_handler.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/utils/constants.dart';

class UsersRepo {
  String endPoint = Constants.BASE_URL + 'users';
  Future<List<User>> getUsers() async {
    String responseBody = await HttpHandler().getMethod(endPoint);
    Map responseJson = jsonDecode(responseBody);
    Iterable usersListJson = responseJson['data'];
    List<User> usersList =
        usersListJson.map((item) => User.fromJson(item)).toList();
    return usersList;
  }
}
