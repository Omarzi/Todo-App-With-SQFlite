// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController textEditingController;
  bool validate;
  String hintText;
  String label;
  String text;
  CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.validate,
    required this.hintText,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: label,
        errorText: validate ? text : null,
      ),
    );
  }
}
