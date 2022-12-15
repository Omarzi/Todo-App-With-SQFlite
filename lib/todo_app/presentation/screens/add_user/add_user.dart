// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/todo_app/models/user.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/widgets/custom_app_bar.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/widgets/custom_text_form_field.dart';
import 'package:todo_app_with_bloc/todo_app/services/user_services.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _userNameController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  final _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: 'Add User'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New User',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                textEditingController: _userNameController,
                validate: _validateName,
                hintText: 'Enter Name',
                label: 'Name',
                text: 'Name Value Can\'t Be Empty',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                textEditingController: _userContactController,
                validate: _validateContact,
                hintText: 'Enter Contact',
                label: 'Contact',
                text: 'Contact Value Can\'t Be Empty',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                textEditingController: _userDescriptionController,
                validate: _validateDescription,
                hintText: 'Enter Description',
                label: 'Description',
                text: 'Description Value Can\'t Be Empty',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _userDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;
                        });
                        if (_validateName == false &&
                            _validateContact == false &&
                            _validateDescription == false) {
                          // print("Good Data Can Save");
                          // ignore: no_leading_underscores_for_local_identifiers
                          var _user = User();
                          _user.name = _userNameController.text;
                          _user.contact = _userContactController.text;
                          _user.description = _userDescriptionController.text;
                          var result = await _userService.SaveUser(_user);
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userNameController.text = '';
                        _userContactController.text = '';
                        _userDescriptionController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
