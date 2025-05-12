import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/data/models/NetworkNews.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screen/home/featured_news.dart';
import 'package:news_app/screen/home/notification_screen.dart';
import 'package:news_app/screen/news_detail/news_detail_screen.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/widgets/network_news_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import '../../utils/reusable.dart';
import '../../widgets/user_created_news_widget.dart';
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
      'Trending': 'top-headlines?country=us',
      'Latest': 'everything?q=india&sortBy=popularity&language=en',
      'Politics': 'everything?q=politics&sortBy=popularity&language=en',
      'Health': 'top-headlines?category=health&language=en',
      'Technology': 'top-headlines?category=technology&language=en=6',
      'Business': 'top-headlines?category=business&language=en',
      'Entertainment': 'top-headlines?category=entertainment&language=en',
      'Sports': 'top-headlines?category=sports&language=en',
      'Science': 'top-headlines?category=science&language=en',
    };

    final endpoint =
        params[_selectedCategoryName] ??
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
                  ),
                ),
                actions: [
                  appBarAction(
                    context: context,
                    icon: CupertinoIcons.bell_fill,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    },
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
          child: sectionHeader(headerText: "News", onClick: () {}),
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
          searchView(),

          sectionHeader(
            headerText: "Featured",
            onClick: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => FeaturedNews()));
            },
          ),
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(article: featuredArticle!,),
                            ),
                          );
                        },
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
