import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

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
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
              ),
              suffixIcon: Icon(CupertinoIcons.search, color: Colors.grey,),
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

          sectionHeader(headerText: "Featured")
        ],
      ),
    );
  }
}
