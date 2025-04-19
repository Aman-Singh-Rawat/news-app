import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/widgets/CustomButton.dart';
import 'package:news_app/widgets/edit_text_with_title.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fill Your Profile")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 110,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/img_profile_placeholder.png"),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              EditTextWithTitle(
                title: "Username",
                inputType: TextInputType.name,
                isPrimaryColor: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Full Name",
                inputType: TextInputType.name,
                isPrimaryColor: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Email",
                inputType: TextInputType.name,
                isPrimaryColor: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Phone Number",
                inputType: TextInputType.name,
                isPrimaryColor: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              customButton(
                color: lightRose,
                buttonName: "Continue",
                onClick: () {},
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
