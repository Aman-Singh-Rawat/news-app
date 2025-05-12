import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class CreateNews extends StatefulWidget {
  const CreateNews({super.key});

  @override
  State<CreateNews> createState() => _CreateNewsState();
}

class _CreateNewsState extends State<CreateNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create New News")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 16 / 8,
              child: DottedBorder(
                color: const Color(0xFFc7c7c9),
                radius: Radius.circular(20),
                strokeCap: StrokeCap.round,
                dashPattern: [10, 10],
                borderType: BorderType.RRect,
                strokeWidth: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFf5f6fa),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.add, color: primaryColor),
                        const SizedBox(height: 10),
                        Text(
                          "Add Cover Photos",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
