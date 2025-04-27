import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/utils/reusable.dart';
import 'package:transparent_image/transparent_image.dart';

class UserCreatedNewsWidget extends StatefulWidget {
  const UserCreatedNewsWidget({super.key});

  @override
  State<UserCreatedNewsWidget> createState() => _UserCreatedNewsWidgetState();
}

class _UserCreatedNewsWidgetState extends State<UserCreatedNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300, width: 1),
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
                          "https://media.gettyimages.com/id/79003654/photo/san-francisco-apple-ceo-and-co-founder-steve-jobs-delivers-the-keynote-speech-to-kick-off-the.jpg?s=612x612&w=0&k=20&c=FyCszFf9YdzHEyLU_EGr1hS96LpTwixMUOqeTXAX9SU=",
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
                        Icon(
                          Icons.chat_outlined,
                          size: 18,
                          color: primaryColor,
                        ),
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
                        Icon(Icons.bookmark_border, color: primaryColor),
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
}
