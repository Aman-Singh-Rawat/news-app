import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/data/models/NetworkNews.dart';
import 'package:news_app/main.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/widgets/network_news_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import '../../utils/reusable.dart';
import '../../widgets/news_category_widget.dart';
import '../../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategoryName = "Trending";
  late Future<NetworkNews> _newsFuture;
  Article? featuredArticle;

  @override
  void initState() {
    _newsFuture = getNewsFromNetwork();
    super.initState();
  }

  String sortNews() {
    final apiKey = dotenv.env['API_KEY'] ?? '';
    debugPrint('API Key being used: $apiKey');

    final baseUrl = 'https://newsapi.org/v2/';
    final params = {
      'Trending': 'top-headlines?country=us&pageSize=6',
      'Latest': 'everything?q=india&sortBy=popularity&language=en',
      'Politics': 'everything?q=politics&sortBy=popularity&language=en&pageSize=6',
      'Health': 'top-headlines?category=health&language=en&pageSize=6',
      'Technology': 'top-headlines?category=technology&language=en&pageSize=6',
      'Business': 'top-headlines?category=business&language=en&pageSize=6',
      'Entertainment': 'top-headlines?category=entertainment&language=en&pageSize=6',
      'Sports': 'top-headlines?category=sports&language=en&pageSize=6',
      'Science': 'top-headlines?category=science&language=en&pageSize=6',
    };

    final endpoint = params[_selectedCategoryName] ??
        'top-headlines?category=general&language=en&pageSize=10';

    return '$baseUrl$endpoint&apiKey=$apiKey';
  }

  Future<NetworkNews> getNewsFromNetwork() async {


    try {
      final response = await http.get(Uri.parse(sortNews()));
      if (response.statusCode == 200) {
        NetworkNews networkNews = NetworkNews.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
        if (_selectedCategoryName == "Trending") {
          setState(() {
            featuredArticle = networkNews.articles.firstWhere(
                  (element) => element.urlToImage != null,
            );
          });
        }
        return networkNews;
      } else {
        debugPrint('Response status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        throw Exception("Failed to load news");
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      debugPrint('Detailed error: $e');
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (featuredArticle == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor.withAlpha(30),
                    ),
                    child: Icon(CupertinoIcons.bell_fill, color: primaryColor),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(children: [topScreenPart, bottomScreenPart]),
          ),
        ),
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

        FutureBuilder(
          future: _newsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
              return Text("No Articles available");
            }
            return Column(
              children: snapshot.data!.articles
                  .map((article) => NetworkNewsWidget(article: article))
                  .toList()
                  .sublist(0, 5),
            );
          },
        ),
        const SizedBox(height: 20),
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
          setState(() {
            _selectedCategoryName = categoryName;
            _newsFuture = getNewsFromNetwork();
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
                    imageErrorBuilder:
                        (context, error, stackTrace) => imageErrorBuilderWidget(
                          context,
                          error,
                          stackTrace,
                          20,
                        ),
                    placeholder: MemoryImage(kTransparentImage),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 400),
                    image: NetworkImage(featuredArticle?.urlToImage ?? ""),
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
                        featuredArticle?.title ?? "",
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
