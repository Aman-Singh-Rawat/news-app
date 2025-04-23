import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../widgets/section_header.dart';

// friday morning
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: Column(children: [topScreenPart]),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  width: double.maxFinite,
                  height: 240,
                  placeholder: MemoryImage(kTransparentImage),
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 400),
                  image: NetworkImage(
                    "https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2025%2F0411%2Fr1477135_1296x729_16%2D9.jpg&w=1140&cquality=40&format=jpg",
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 240,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withAlpha(10),
                        Colors.black.withAlpha(70),
                        Colors.black.withAlpha(95),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        "Cristiano Ronaldo has been excluded from Al-Nassr's matchday that will face Damac on Tuesday in a Saudi Pro League clash.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 16,
                          ),
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
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
                      const SizedBox(height: 10),
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
