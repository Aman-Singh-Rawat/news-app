import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _selectedCategoryName = "Trending";

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        leading: IconButton(
          color: primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
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
                fillColor: Colors.grey.shade100,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TabBar(
              indicatorWeight: 5,
              dividerHeight: 2,
              dividerColor: Colors.grey.shade300,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.5, color: primaryColor),
              ),
              tabs: [
                Tab(text: "News"),
                Tab(text: "People"),
                Tab(text: "Hashtag"),
              ],
              controller: _tabController,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: newsCategories.map((e) => categoryCard(e)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search Results",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "3,269 founds",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/img_no_result_found.png",
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        "No result found",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Please try another keyword",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Text("first 2"),
                  Text("first 3"),
                ],
              ),
            ),
          ),
        ],
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
