import 'package:flutter/material.dart';

class ShowLanguageBottomSheet extends StatefulWidget {
  const ShowLanguageBottomSheet({super.key});

  @override
  State<ShowLanguageBottomSheet> createState() =>
      _ShowLanguageBottomSheetState();
}

class _ShowLanguageBottomSheetState extends State<ShowLanguageBottomSheet> {
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
            child: selectedLanguage('English',
              false),
          ),
          const SizedBox(
            height: 2,
          ),
          InkWell(
            onTap: () {
              // provider.changeAppLanguage('ar');
              Navigator.pop(context);
            },
            child: selectedLanguage('Arabic', false),
          )
        ],
      ),
    );
  }

  Widget selectedLanguage(String text, bool select) {
    if (select) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ).copyWith(color: Colors.blueGrey[600]),
          ),
          Icon(
            Icons.check,
            size: 25,
            color: Colors.blueGrey[600],
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
            size: 22,
          ),
        ],
      );
    }
  }
}
