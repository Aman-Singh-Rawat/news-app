import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton({
  required Color color,
  double? margin,
  required VoidCallback onClick,
}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      height: 50,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0, vertical: 25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          "Next",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
