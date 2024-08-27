import 'dart:convert';
import 'package:flutter_mvvm_example/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserViewModel {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      users = userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
