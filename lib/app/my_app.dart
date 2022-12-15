import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TODO',
      home: HomePage(),
    );
  }
}
