import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class PublisherProfileScreen extends StatelessWidget {
  const PublisherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: primaryColor),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.network(""),
            
          )
        ],
      ),
    );
  }
}
