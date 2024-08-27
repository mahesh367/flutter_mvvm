import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/views/user_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListView(),
    );
  }
}
