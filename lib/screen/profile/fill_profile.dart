import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _image;
  final picker = ImagePicker();

  final _userNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isAllTextFill = false;

  @override
  void initState() {
    _userNameController.addListener(_rebuildUi);
    _fullNameController.addListener(_rebuildUi);
    _emailController.addListener(_rebuildUi);
    _phoneNumberController.addListener(_rebuildUi);

    super.initState();
  }

  void _rebuildUi() {
    _isAllTextFill =
        _userNameController.text.trim().isNotEmpty &&
        _fullNameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _phoneNumberController.text.trim().isNotEmpty;

    setState(() {});
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _openSelectingImageType() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 20,
              child: Column(
                children: [
                  Divider(color: Colors.grey.shade100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          "Camera",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(Icons.camera),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          "Gallery",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          title: Text(
            "Choose Image",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }

  Future _selectImage(bool isCamera) async {
    final pickedFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 130,
                  height: 130,
                  child: Stack(
                    children: [
                      _image == null
                          ? Image.asset(
                            "assets/images/img_profile_placeholder.png",
                          )
                          : CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: FileImage(_image!),
                          ),
                      Positioned(
                        right: 0,
                        bottom: 5,
                        child: InkWell(
                          onTap: _openSelectingImageType,
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
                isPrimaryColor:
                    _userNameController.text.toString().trim().isNotEmpty,
                controller: _userNameController,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Full Name",
                inputType: TextInputType.name,
                isPrimaryColor:
                    _fullNameController.text.toString().trim().isNotEmpty,
                controller: _fullNameController,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Email",
                inputType: TextInputType.name,
                suffixIcon: Icons.email_rounded,
                isPrimaryColor:
                    _emailController.text.toString().trim().isNotEmpty,
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Phone Number",
                inputType: TextInputType.name,
                suffixIcon: CupertinoIcons.phone,
                isPrimaryColor:
                    _phoneNumberController.text.toString().trim().isNotEmpty,
                controller: _phoneNumberController,
              ),
              const SizedBox(height: 20),
              customButton(
                color: _isAllTextFill ? primaryColor : lightRose,
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
