import 'package:todo_app_with_bloc/todo_app/presentation/widgets/show_theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/widgets/custom_app_bar.dart';
import 'package:todo_app_with_bloc/todo_app/presentation/widgets/show_lang_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: 'Setting Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(right: 4, left: 4),
              child: Text(
                'Language',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 4, left: 4, top: 0.4),
              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.blueGrey[600]!),
                  ),
                  child: Text(
                    'English',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.only(right: 4, left: 4, top: 2),
              child: Text(
                'Theme',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 4, left: 4, top: 0.4),
              child: InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.blueGrey[600]!),
                  ),
                  child: Text(
                    'Light Mode',
                    // provider.themeMode == ThemeMode.light
                    //     ? AppLocalizations.of(context)!.light
                    //     : AppLocalizations.of(context)!.dark,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowLanguageBottomSheet();
      },
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ShowThemeBottomSheet();
        });
  }
}
