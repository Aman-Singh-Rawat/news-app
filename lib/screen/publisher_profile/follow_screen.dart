import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key, required this.titleName});

  final String titleName;

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titleName)),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder:
            (context, index) => ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2016/09/26/10/26/cute-cartoon-characters-1695612_1280.png",
                ),
              ),
              title: Text(
                "Jenny Wilson",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "3 days ago",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: primaryColor),
              ),
            ),
      ),
    );
  }
}
