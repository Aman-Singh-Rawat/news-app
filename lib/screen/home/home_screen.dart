import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/utils/constant.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../widgets/section_header.dart';

// friday morning
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategoryName = "Trending";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 2),
            child: Image.asset("assets/images/img_logo_icon.png"),
          ),
          title: Text(
            "Newsly",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor.withAlpha(30),
              ),
              child: Icon(CupertinoIcons.bell_fill, color: primaryColor),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Column(children: [topScreenPart, bottomScreenPart]),
      ),
    );
  }

  get bottomScreenPart {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: sectionHeader(headerText: "News"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: newsCategories.map((e) => categoryCard(e)).toList(),
          ),
        ),
      ],
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
          _selectedCategoryName = categoryName;
          setState(() {});
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

  get topScreenPart {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
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

          sectionHeader(headerText: "Featured"),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    width: double.maxFinite,
                    height: 240,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    placeholder: MemoryImage(kTransparentImage),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 400),
                    image: NetworkImage(
                      "https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2025%2F0411%2Fr1477135_1296x729_16%2D9.jpg&w=1140&cquality=40&format=jpg",
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(10, 0, 0, 0),
                          Color.fromARGB(20, 0, 0, 0),
                          Color.fromARGB(80, 0, 0, 0),
                          Color.fromARGB(95, 0, 0, 0),
                          Color.fromARGB(100, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        "Cristiano Ronaldo has been excluded from Al-Nassr's matchday that will face Damac on Tuesday in a Saudi Pro League clash.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 16,
                          ),
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Read Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//https://static01.nyt.com/images/2023/11/20/multimedia/20microsoft-openai-lpwt/20microsoft-openai-lpwt-superJumbo.jpg?quality=75&auto=webp
