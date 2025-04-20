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
  final _userNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _userNameController.addListener(() => setState(() {}));
    _fullNameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _phoneNumberController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

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
                  width: 130,
                  height: 130,
                  child: Stack(
                    children: [
                      //Image.asset("assets/images/img_profile_placeholder.png"),
                      CircleAvatar(
                        radius: 65,
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 5,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.all(3),
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
                isPrimaryColor: _userNameController.text.toString().trim().isNotEmpty,
                controller: _userNameController,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Full Name",
                inputType: TextInputType.name,
                isPrimaryColor: _fullNameController.text.toString().trim().isNotEmpty,
                controller: _fullNameController,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Email",
                inputType: TextInputType.name,
                isPrimaryColor:
                    _emailController.text.toString().trim().isNotEmpty,
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Phone Number",
                inputType: TextInputType.name,
                isPrimaryColor: _phoneNumberController.text.toString().trim().isNotEmpty,
                controller: _phoneNumberController,
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
