import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screen/publisher_profile/follow_screen.dart';
import 'package:news_app/widgets/user_created_news_widget.dart';

class PublisherProfileScreen extends StatelessWidget {
  PublisherProfileScreen({super.key});

  final profileStats = {
    "News": "872.4K",
    "Followers": "6.5M",
    "Following": "127",
  };

  _navigateToAnotherScreen(int index, BuildContext context) {
    if (index != 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => FollowScreen(
                titleName: index == 1 ? "Followers" : "Following",
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share, color: primaryColor),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2022/08/22/15/38/woman-7403940_1280.jpg",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Minakshi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "@minakshi18",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                    ),
                    onPressed: () {},
                    label: Text(
                      "Follow",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      CupertinoIcons.person_add_solid,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 18),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      profileStats.entries.toList().asMap().entries.map((
                        entry,
                      ) {
                        final index = entry.key;
                        final e = entry.value;
                        final isLast = index == profileStats.length - 1;

                        return Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  _navigateToAnotherScreen(index, context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.value,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        fontFamily: GoogleFonts.roboto().fontFamily,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      e.key,
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        fontFamily: GoogleFonts.poppins().fontFamily,),
                                    ),
                                  ],
                                ),
                              ),
                              if (!isLast) VerticalDivider(),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
              const SizedBox(height: 15),
              Divider(),

              TabBar(
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                dividerHeight: 3.5,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: primaryColor, width: 3.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                dividerColor: Colors.grey.shade200,
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                tabs: [Tab(text: "Top News"), Tab(text: "Recent")],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => userCreatedNewsWidget(),
                    ),
                    Text("data 2"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
