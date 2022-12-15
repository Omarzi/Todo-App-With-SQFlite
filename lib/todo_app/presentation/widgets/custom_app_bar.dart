import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/screens/setting/settings_screen.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/screens/support/support_screen.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      title: Text(title),
      backgroundColor: Colors.blueGrey[600],
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: PopupMenuButton(
            color: Colors.blueGrey[600],
            itemBuilder: (context) => [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.settings),
                      SizedBox(width: 10),
                      Text(
                        'Setting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupportScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.support_agent),
                      SizedBox(width: 10),
                      Text(
                        'Support',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
