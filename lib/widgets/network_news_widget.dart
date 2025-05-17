import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/models/NetworkNews.dart';
import 'package:transparent_image/transparent_image.dart';

import '../utils/reusable.dart';

class NetworkNewsWidget extends StatefulWidget {
  const NetworkNewsWidget({required this.article, super.key});

  final Article article;

  @override
  State<NetworkNewsWidget> createState() => _NetworkNewsWidgetState();
}

class _NetworkNewsWidgetState extends State<NetworkNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.article.title ?? "error",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: GoogleFonts
                          .poppins()
                          .fontFamily,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          widget.article.author ?? "error",
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 2,
                        height: 2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          "May 24 2025",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          widget.article.urlToImage != null ?
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage(
              height: 90,
              width: 125,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) => imageErrorBuilderWidget(context, error, stackTrace, 24,),
              fadeInDuration: const Duration(milliseconds: 400),
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                widget.article.urlToImage ?? "",
              ),
            ),
          ) : Container(
            height: 90,
            width: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red.shade50,
            ),
            child: const Icon(Icons.warning, color: Colors.red, size: 30,)
          ),
        ],
      ),
    );
  }
}
