// ignore_for_file: non_constant_identifier_names

import 'package:todo_app_with_bloc/todo_app/db_helper/repository.dart';
import 'package:todo_app_with_bloc/todo_app/models/user.dart';

class UserService
{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  //Save User
  SaveUser(User user) async{
    return await _repository.insertData('users', user.userMap());
  }
  //Read All Users
  readAllUsers() async{
    return await _repository.readData('users');
  }
  //Edit User
  UpdateUser(User user) async{
    return await _repository.updateData('users', user.userMap());
  }

  //Delete User
  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }

}