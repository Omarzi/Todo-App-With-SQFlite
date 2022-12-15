// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/todo_app/models/user.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/screens/add_user/add_user.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/screens/edit_user/edit_user.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/screens/view_user/view_user.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/widgets/custom_app_bar.dart';
import 'package:todo_app_with_bloc/todo_app/services/user_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<User> _userList = <User>[];
  final _userService = UserService();

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _userList = <User>[];
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.contact = user['contact'];
        userModel.description = user['description'];
        _userList.add(userModel);
      });
    });
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text(
            'Are You Sure to Delete',
            style: TextStyle(color: Colors.teal, fontSize: 20),
          ),
          actions: [
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red),
                onPressed: () async {
                  var result = await _userService.deleteUser(userId);
                  if (result != null) {
                    Navigator.pop(context);
                    getAllUserDetails();
                    setState(() {});
                    _showSuccessSnackBar('User Detail Deleted Success');
                  }
                },
                child: const Text('Delete')),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: "SQLite CRUD"),
      ),
      body: _userList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey[600],
              ),
            )
          : ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 14,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: _userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 12,
                        ),
                        elevation: 10,
                        shadowColor: Colors.blueGrey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewUser(
                                  user: _userList[index],
                                ),
                              ),
                            );
                          },
                          leading: Icon(
                            Icons.person,
                            color: Colors.blueGrey[600],
                          ),
                          title: Text(
                            _userList[index].name ?? '',
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            _userList[index].contact ?? '',
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditUser(
                                        user: _userList[index],
                                      ),
                                    ),
                                  ).then(
                                    (data) {
                                      if (data != null) {
                                        getAllUserDetails();
                                        _showSuccessSnackBar(
                                            'User Detail Updated Success');
                                      }
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.teal,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _deleteFormDialog(
                                      context, _userList[index].id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddUser(),
            ),
          ).then(
            (data) {
              if (data != null) {
                getAllUserDetails();
                _showSuccessSnackBar('User Detail Added Success');
              }
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.blueGrey[600],
        ),
      ),
    );
  }
}
