import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageErrorBuilderWidget(context, error, stackTrace, size) {
  return Container(
    color: Colors.grey,
    child: Center(
      child: Icon(
        Icons.broken_image,
        size: size,
        color: Colors.white,
      ),
    ),
  );
}