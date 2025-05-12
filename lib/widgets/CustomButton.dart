import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

Widget customButton({
  required Color color,
  double? margin,
  required String buttonName,
  required VoidCallback onClick,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: margin ?? 0, vertical: 25),
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onClick,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 16,
              color: color == primaryColor ? Colors.white : primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
