import 'package:flutter/material.dart';

class ShowThemeBottomSheet extends StatefulWidget {
  const ShowThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShowThemeBottomSheet> createState() => _ShowThemeBottomSheetState();
}

class _ShowThemeBottomSheetState extends State<ShowThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: selectedLanguage(
              'Light Mode',
              false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: selectedLanguage(
              "Dark Mode",
              true,
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedLanguage(String text, bool selected) {
    if (selected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            // style: TextStyle(fontSize: 25, color: MyThemeData.standardColor),
          ),
          Icon(Icons.check, size: 30, 
          // color: MyThemeData.standardColor,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
          const Icon(
            Icons.check,
            size: 30,
          ),
        ],
      );
    }
  }
}
