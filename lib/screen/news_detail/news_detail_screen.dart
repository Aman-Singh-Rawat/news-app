import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/models/NetworkNews.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../main.dart';
import '../../utils/reusable.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          appBarAction(context: context, icon: Icons.share, onPressed: () {}),
          const SizedBox(width: 10),
          appBarAction(
            context: context,
            icon: Icons.bookmark_border,
            onPressed: () {},
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                    image: NetworkImage(article.urlToImage!),
                  ),
                ),
              ), //Reusable
              const SizedBox(height: 20),
              Text(
                article.title ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
