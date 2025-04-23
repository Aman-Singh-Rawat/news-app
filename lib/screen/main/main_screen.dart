import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _position = 0;

  final _bottomNavigationUnselectedList = [
    Icons.home_outlined,
    CupertinoIcons.search,
    Icons.bookmark_border,
    Icons.format_list_bulleted_outlined,
    CupertinoIcons.person,
  ];

  final _bottomNavigationSelectedList = [
    Icons.home,
    CupertinoIcons.search,
    Icons.bookmark,
    Icons.format_list_bulleted,
    CupertinoIcons.person_fill,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border.all(color: Colors.grey.shade200),
        ),
        height: kBottomNavigationBarHeight + 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          _bottomNavigationUnselectedList.asMap().entries.map((element) {
            bool flag = _position == element.key;
            return InkWell(
              radius: 10,
              onTap: () {
                setState(() {
                  _position = element.key;
                });
              },
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  color: flag ? primaryColor : primaryColor.withAlpha(40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  flag
                      ? _bottomNavigationSelectedList[element.key]
                      : element.value,
                  color: flag ? Colors.white : primaryColor,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
