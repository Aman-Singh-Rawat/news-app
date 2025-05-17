import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/data/models/NetworkNews.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import '../../utils/colors.dart';
import '../../utils/reusable.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({super.key});

  Future<NetworkNews> getFeaturedNews() async {
    String apiKey = dotenv.env["API_KEY"] as String;
    try {
      final response = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
        ),
      );
      return NetworkNews.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Featured News",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryColor.withAlpha(30),
            ),
            child: const Icon(Icons.more_vert, color: primaryColor),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: FutureBuilder(
        future: getFeaturedNews(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading news'));
          }

          if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
            return const Center(child: Text('No news available'));
          }
          final articleList = snapshot.data!.articles;
          return ListView.builder(
            itemCount: articleList.length > 5 ? 4 : articleList.length,
            itemBuilder: (context, index) {
              final newsItem = articleList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
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
                          fadeInDuration: const Duration(milliseconds: 400),
                          image: NetworkImage(newsItem.urlToImage ?? ""),
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
                            gradient: const LinearGradient(
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
                              newsItem.title ?? "",
                              style: const TextStyle(
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
                              child: const Text(
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
              );
            },
          );
        },
      )
    );
  }
}
