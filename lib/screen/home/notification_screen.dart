import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final bool _isNotificationEmpty = false;
  final _notificationMap = [
    {
      "date": "Today, December 25 2022",
      "notification": {
        "image":
            "https://cdn.pixabay.com/photo/2023/11/02/11/32/woman-8360359_1280.jpg",
        "title": "Yung is now following you",
        "time": "5 minutes ago",
        "type": "follow",
      },
    },

    {
      "date": "Today, December 25 2022",
      "notification": {
        "image":
            "https://cdn.pixabay.com/photo/2023/11/02/11/32/woman-8360359_1280.jpg",
        "title": "Yung is now following you",
        "time": "5 minutes ago",
        "newsImage":
            "https://cdn.pixabay.com/photo/2023/10/21/18/51/woman-8332162_1280.jpg",
      },
    },
  ];

  Widget _followNotificationContainer({
    required Map<String, dynamic> map,
    required bool isFollowingContainer,
  }) {
    String title = map["title"] as String;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(map["image"])),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    children: [
                      TextSpan(
                        text: title.split(' ')[0],
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: title.substring(title.indexOf(' '), title.length),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          height: 1.4,
                          letterSpacing: 0.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  map["time"],
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          isFollowingContainer
              ? TextButton.icon(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                iconAlignment: IconAlignment.start,
                onPressed: () {},
                icon: Icon(Icons.add, color: Colors.white),
                label: Center(
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 60,
                  height: 55,
                  child: Image.network(map["newsImage"], fit: BoxFit.cover,),
                ),
              ),
        ],
      ),
    );
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
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryColor.withAlpha(30),
            ),
            child: Icon(Icons.more_vert, color: primaryColor),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body:
          _isNotificationEmpty
              ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/ic_notification_bell.png",
                      color: primaryColor,
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You have no notifications",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
              : Column(
                children:
                    _notificationMap.asMap().entries.map((data) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              data.value["date"] as String,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _followNotificationContainer(
                              map:
                                  data.value["notification"]
                                      as Map<String, dynamic>,
                              isFollowingContainer: data.key == 0,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
    );
  }
}
