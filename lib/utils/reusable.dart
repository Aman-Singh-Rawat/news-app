import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  IconData? icon,
  String? svgIcon,
  required VoidCallback onPressed,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: svgIcon == null ? Icon(icon) : SvgPicture.asset(svgIcon!, width: 20, height: 24,),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor.withAlpha(30),),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

Widget searchView() {
  return TextFormField(
    style: const TextStyle(
      color: Colors.black,
      fontSize: 13,
      letterSpacing: 0.5,
      fontWeight: FontWeight.bold,
    ),
    decoration: InputDecoration(
      hintText: "Search",
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      suffixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      fillColor: const Color(0xFFf5f6fa),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
