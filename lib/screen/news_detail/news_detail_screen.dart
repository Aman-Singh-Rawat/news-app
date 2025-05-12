import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/models/NetworkNews.dart';
import 'package:news_app/screen/profile/fill_profile.dart';
import 'package:news_app/screen/profile/my_profile.dart';
import 'package:news_app/screen/publisher_profile/publisher_profile_screen.dart';
import 'package:news_app/widgets/section_header.dart';
import 'package:news_app/widgets/user_created_news_widget.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../main.dart';
import '../../utils/reusable.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({super.key, required this.article});

  final Article article;

  final List<String> _dummyTagList = [
    "#political",
    "#usa",
    "#joebiden",
    "#news",
    "#america",
    "#uk",
    "#bbc",
    "#new",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          appBarAction(context: context, icon: Icons.share, onPressed: () {}),
          const SizedBox(width: 10),
          appBarAction(
            context: context,
            icon: Icons.bookmark_border,
            onPressed: () {},
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    width: double.maxFinite,
                    height: 240,
                    imageErrorBuilder:
                        (context, error, stackTrace) => imageErrorBuilderWidget(
                          context,
                          error,
                          stackTrace,
                          20,
                        ),
                    placeholder: MemoryImage(kTransparentImage),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 400),
                    image: NetworkImage(article.urlToImage!),
                  ),
                ),
              ),
              //Reusable
              const SizedBox(height: 20),
              Text(
                article.title ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor, width: 1.5),
                    ),
                    child: Text(
                      "Politics",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.remove_red_eye, color: primaryColor),
                  const SizedBox(width: 3),
                  Text("0", style: TextStyle(fontSize: 17)),
                  const SizedBox(width: 20),
                  Icon(Icons.thumb_up_alt, color: primaryColor),
                  const SizedBox(width: 3),
                  Text("0", style: TextStyle(fontSize: 17)),
                  const SizedBox(width: 20),
                  Icon(Icons.textsms_rounded, color: primaryColor),
                  const SizedBox(width: 3),
                  Text("0", style: TextStyle(fontSize: 17)),
                ],
              ),

              //News Creator Details
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PublisherProfileScreen()),
                        );
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            child: Text(
                              article.source?.name?.substring(0, 1) ?? "U",
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.source?.name ?? "Unknown",
                                  maxLines: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "5 days ago",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    label: Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                article.description ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                children:
                    _dummyTagList
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: primaryColor, width: 2),
                            ),
                            child: Text(
                              e,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "Is this news helpful?",
                    style: TextStyle(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),

                  TextButton.icon(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        const EdgeInsets.only(right: 2),
                      ),
                    ),
                    label: Text(
                      "100",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up_off_alt, color: primaryColor),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(const EdgeInsets.all(0)),
                    ),
                    label: Text(
                      "100",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_down_off_alt_rounded,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  top: 5,
                ),
                child: Column(
                  children: [
                    getCommentsHeader(
                      onIconClick: () {
                        _showModelBottomSheet(context);
                      },
                    ),
                    const SizedBox(height: 5),
                    Divider(),
                    const SizedBox(height: 10),
                    addAComment,
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Divider(),
              sectionHeader(headerText: "Related", onClick: () {}),
              userCreatedNewsWidget(onSavedClick: () {}),
              userCreatedNewsWidget(onSavedClick: () {}),
              userCreatedNewsWidget(onSavedClick: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCommentsHeader({Icon? icon, required VoidCallback onIconClick}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Comments",
          style: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          "170.5k",
          style: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: onIconClick,
          icon:
              icon ??
              SvgPicture.asset(
                "assets/images/top_to_bottom_arrow.svg",
                width: 24,
                height: 24,
              ),
        ),
      ],
    );
  }

  void _showModelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: 55,
                height: 4,
                margin: const EdgeInsets.only(top: 6, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              getCommentsHeader(
                onIconClick: () {},
                icon: Icon(Icons.clear, color: primaryColor),
              ),
              const SizedBox(height: 10),
              Divider(),
              const SizedBox(height: 20),
              addAComment,
              const SizedBox(height: 20),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int index) => Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            ListTile(
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
                                icon: Icon(
                                  Icons.more_vert,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  Divider(),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quam nibh, interdum eget turpis id, vehicula ultrices mauris",
                                    style: TextStyle(fontSize: 11, height: 1.8),
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(),
                                  Row(
                                    children: [
                                      TextButton.icon(
                                        style: ButtonStyle(
                                          padding: WidgetStatePropertyAll(
                                            const EdgeInsets.only(right: 2),
                                          ),
                                        ),
                                        label: Text(
                                          "100",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.poppins()
                                                    .fontFamily,
                                          ),
                                        ),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_up_off_alt,
                                          color: primaryColor,
                                        ),
                                      ),
                                      TextButton.icon(
                                        style: ButtonStyle(
                                          padding: WidgetStatePropertyAll(
                                            const EdgeInsets.all(0),
                                          ),
                                        ),
                                        label: Text(
                                          "100",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.poppins()
                                                    .fontFamily,
                                          ),
                                        ),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_down_off_alt_rounded,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get addAComment {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2022/12/02/03/31/girl-7630188_1280.jpg",
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: TextFormField(
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: "Add a comment...",
              hintStyle: TextStyle(
                color: Colors.grey.shade300,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: primaryColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
