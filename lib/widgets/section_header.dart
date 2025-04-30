import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

Widget sectionHeader({required String headerText, required VoidCallback onClick}) {
  return Column(
    children: [
      const SizedBox(height: 25),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: onClick,
            child: Text(
              "See all",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
    ],
  );
}
