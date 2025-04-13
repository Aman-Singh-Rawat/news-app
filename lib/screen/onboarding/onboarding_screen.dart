import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

import '../../widgets/CustomButton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  int _onboardingIndex = 0;
  PageController _pageController = PageController();
  final List<Map<String, String>> _onboardingList = [
    {
      "imageUrl":
      "https://i.pinimg.com/474x/ad/96/93/ad969326e47ed9ac0d6449b4648b920e.jpg",
      "noColorText": "Get the latest news \nfrom ",
      "colorText": "reliable sources",
    },
    {
      "imageUrl":
      "https://i.pinimg.com/474x/61/25/3a/61253af0ca402575bf970be7d20336be.jpg",
      "noColorText": "Get actual news from\n",
      "colorText": "around the world",
    },
    {
      "imageUrl":
      "https://i.pinimg.com/474x/d4/f2/a6/d4f2a60376a0160cd2245f1881e7c7a8.jpg",
      "noColorText": "Get the latest news \nfrom ",
      "colorText": "Sport, politics \nhealthy, & anything",
    },
  ];

  void _navigateToAccountType() {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => AccountType()),
    // );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(

              controller: _pageController,

              itemCount: _onboardingList.length,
              onPageChanged: (index) {
                _onboardingIndex = index;
                setState(() {});
              },
              itemBuilder:
                  (context, index) {
                final item = _onboardingList[index];
                return Stack(
                  children: [
                    Image.network(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      item["imageUrl"]!,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: MediaQuery
                            .sizeOf(context)
                            .height / 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12.withAlpha(7),
                              Colors.black87,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            RichText(
                              maxLines: 2,
                              softWrap: true,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    item["noColorText"]!,
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      height: 1.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: item["colorText"]!,
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400,
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 165),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      _onboardingList.length,
                          (index) =>
                          AnimatedContainer(
                            width: _onboardingIndex == index ? 15 : 5,
                            height: 5,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                              _onboardingIndex == index
                                  ? primaryColor
                                  : Colors.white,
                            ),
                            duration: const Duration(milliseconds: 300),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: _navigateToAccountType,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                customButton(
                  color: primaryColor,
                  margin: 20,
                  onClick: () {
                    if (_onboardingIndex == _onboardingList.length - 1) {
                      _navigateToAccountType();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
