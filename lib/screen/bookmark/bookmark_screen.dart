import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/utils/reusable.dart';
import 'package:news_app/widgets/CustomButton.dart';
import 'package:news_app/widgets/user_created_news_widget.dart';

import '../../utils/colors.dart';
import '../../utils/constant.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final bool _isBookmarkEmpty = false;

  String _selectedCategoryName = "Trending";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 2),
          child: Image.asset("assets/images/img_logo_icon.png"),
        ),
        title: Text(
          "My Bookmark",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: _isBookmarkEmpty ? _emptyBookmarkWidget : _bookMarkView,
    );
  }

  Widget get _emptyBookmarkWidget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          searchView(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/images/ic_bookmark.svg",
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    "You have no bookmarked news",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          customButton(
            color: primaryColor,
            buttonName: "Explore News",
            onClick: () {},
          ),
        ],
      ),
    );
  }

  Widget get _bookMarkView {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: searchView(),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: newsCategories.map((e) => categoryCard(e)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                userCreatedNewsWidget(
                  isSaved: true,
                  onSavedClick: _showDeleteBookmarkBottomSheet,
                ),
                userCreatedNewsWidget(
                  isSaved: true,
                  onSavedClick: _showDeleteBookmarkBottomSheet,
                ),
                userCreatedNewsWidget(
                  isSaved: true,
                  onSavedClick: _showDeleteBookmarkBottomSheet,
                ),
                userCreatedNewsWidget(
                  isSaved: true,
                  onSavedClick: _showDeleteBookmarkBottomSheet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteBookmarkBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 3.5,
                    margin: const EdgeInsets.only(top: 6, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                userCreatedNewsWidget(onSavedClick: () {}, isSaved: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Remove from your bookmark?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 25,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: primaryColor, width: 2, ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: customButton(
                        color: primaryColor,
                        buttonName: "Yes, Remove",
                        onClick: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
