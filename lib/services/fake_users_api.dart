import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:list_users_riverpod/models/user.dart';

class UsersApi {
  Future<List<User>> getUsers() async {
    var jsonText = await rootBundle.loadString('assets/users.json');
    final users = <User>[];
  
    final data = json.decode(jsonText) as List<dynamic>?;
    if (data == null) return [];
    for (final user in data) {
      users.add(User.fromJson(user as Map<String, dynamic>));
    }
    return users;
  }
}