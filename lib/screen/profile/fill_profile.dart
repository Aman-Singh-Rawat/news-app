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
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();


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
                  height: 120,
                  child: Stack(
                    children: [
                      Image.asset("assets/images/img_profile_placeholder.png"),
                      // CircleAvatar(
                      //   radius: 60,
                      //   backgroundImage: NetworkImage(
                      //     "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                      //   ),
                      // ),
                      Positioned(
                        right: 0,
                        bottom: 10,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
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
