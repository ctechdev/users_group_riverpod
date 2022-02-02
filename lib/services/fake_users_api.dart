import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:list_users_riverpod/models/user.dart';

class UsersApi {
  Future<List<User>> getUsers() async {
    var jsonText = await rootBundle.loadString('assets/users.json');
    final users = <User>[
    //Utenti suggeriti 
    User(id: 21, name: 'Mario Tozzi', username: '@tozzimario'),
    User(id: 22, name: 'Franco Franchi', username: '@francofranchi'),
    User(id: 23, name: 'Alfio Stanco', username: '@alfiostanco'),
    User(id: 24, name: 'Gino Spada', username: '@ginospada'),
    User(id: 25, name: 'Cesare Bocca', username: '@cesarebocca'),
    ];
  
    final data = json.decode(jsonText) as List<dynamic>?;
    if (data == null) return [];
    for (final user in data) {
      users.add(User.fromJson(user as Map<String, dynamic>));
    }
    return users;
  }
}