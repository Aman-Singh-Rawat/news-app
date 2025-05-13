import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/reusable.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: searchView(),
          ),
          const SizedBox(height: 20,),
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2019/08/07/04/37/old-woman-4389774_1280.jpg",
                        ),
                      ),
                      title: Text(
                        "Jenny Wilson",
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
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
                      trailing: TextButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(primaryColor),
                        ),
                        icon: Icon(Icons.add, color: Colors.white),
                        label: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
