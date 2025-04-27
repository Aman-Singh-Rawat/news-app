import 'package:flutter/cupertino.dart' show BuildContext, CupertinoIcons, Placeholder, Widget;
import 'package:flutter/material.dart';

import '../../main.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 2),
          child: Image.asset("assets/images/img_logo_icon.png"),
        ),
        title: Text(
          "Newsly",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 11,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryColor.withAlpha(30),
            ),
            child: Icon(CupertinoIcons.bell_fill, color: primaryColor),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
