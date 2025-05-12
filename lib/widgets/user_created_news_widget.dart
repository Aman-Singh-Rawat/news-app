import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../main.dart';
import '../utils/reusable.dart';

Widget userCreatedNewsWidget({bool isSaved = false, required VoidCallback onSavedClick}) {
  return AspectRatio(
    aspectRatio: 16 / 8,
    child: Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: FadeInImage(
                      imageErrorBuilder:
                          (context, error, stackTrace) =>
                              imageErrorBuilderWidget(
                                context,
                                error,
                                stackTrace,
                                12,
                              ),
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 400),
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2025/03/16/14/12/cat-9473998_1280.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The Fast Company Impact Council is an invitation-only membership community of leaders, experts, executives, and entrepreneurs who share their insights with our audience. Members pay annual dues for access to peer learning, thought leadership opportunities, events and more.",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/026/829/465/non_2x/beautiful-girl-with-autumn-leaves-photo.jpg",
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "BBC News",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor, width: 1.5),
                        ),
                        child: Text(
                          "Technology",
                          style: TextStyle(
                            fontSize: 9,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //Likes, Comments, Save
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup_fill,
                        size: 18,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "316K",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.chat_outlined, size: 18, color: primaryColor),
                      const SizedBox(width: 5),
                      Text(
                        "110.5K",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: onSavedClick,
                        child: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
