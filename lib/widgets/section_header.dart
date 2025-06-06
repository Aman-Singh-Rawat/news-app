import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget sectionHeader({required String headerText, required VoidCallback onClick}) {
  return Column(
    children: [
      const SizedBox(height: 25),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: onClick,
            child: const Text(
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
