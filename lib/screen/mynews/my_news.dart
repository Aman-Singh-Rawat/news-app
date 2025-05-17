import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/mynews/create_news.dart';
import 'package:news_app/utils/reusable.dart';
import 'package:news_app/widgets/user_created_news_widget.dart';

import '../../utils/colors.dart';
import '../../utils/constant.dart';

class MyNews extends StatefulWidget {
  const MyNews({super.key});

  @override
  State<MyNews> createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  String _selectedCategoryName = "Trending";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 2),
          child: Image.asset("assets/images/img_logo_icon.png"),
        ),
        title: const Text(
          "My News",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          appBarAction(
            context: context,
            svgIcon: "assets/images/ic_save.svg",
            onPressed: () {},
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: searchView(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: newsCategories.map((e) => categoryCard(e)).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  userCreatedNewsWidget(onSavedClick: () {}),
                  userCreatedNewsWidget(onSavedClick: () {}),
                  userCreatedNewsWidget(onSavedClick: () {}),
                  userCreatedNewsWidget(onSavedClick: () {}),
                  userCreatedNewsWidget(onSavedClick: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(CupertinoIcons.add, size: 30),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const CreateNews()));
        },
      ),
    );
  }

  Widget categoryCard(String categoryName) {
    bool isSelected = _selectedCategoryName == categoryName;
    return Container(
      margin: EdgeInsets.only(
        left: categoryName == "Trending" ? 20 : 10,
        right: categoryName == "World" ? 20 : 0,
      ),
      child: InkWell(
        radius: 24,
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          setState(() {
            _selectedCategoryName = categoryName;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: primaryColor, width: 2),
            color: isSelected ? primaryColor : Colors.white,
          ),
          child: Text(
            categoryName,
            style: TextStyle(
              color: isSelected ? Colors.white : primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
