import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

Widget imageErrorBuilderWidget(context, error, stackTrace, size) {
  return Container(
    color: Colors.grey,
    child: Center(
      child: Icon(Icons.broken_image, size: size, color: Colors.white),
    ),
  );
}

Widget appBarAction({
  required BuildContext context,
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(icon),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor.withAlpha(30),),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
