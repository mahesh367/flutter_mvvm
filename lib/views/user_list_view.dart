// lib/views/user_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/viewmodels/user_view_model.dart';
import 'package:flutter_mvvm_example/models/user_model.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    super.initState();
    userViewModel.fetchUsers().then((_) {
      setState(() {}); // Refresh the UI after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM User List'),
      ),
      body: userViewModel.users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: userViewModel.users.length,
        itemBuilder: (context, index) {
          User user = userViewModel.users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
