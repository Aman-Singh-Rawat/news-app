import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/main.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/widgets/CustomButton.dart';
import 'package:news_app/widgets/edit_text_with_title.dart';
import 'package:permission_handler/permission_handler.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  File? _image;
  final picker = ImagePicker();

  late final _userNameController;
  late final _fullNameController;
  late final _emailController;
  late final _phoneNumberController;

  bool _isAllTextFill = false;

  late final List<Map<String, dynamic>> fillProfileEditTextMap;

  // Camera Permission Request
  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      _selectImage(true);
    } else if (status == PermissionStatus.denied) {
      Fluttertoast.showToast(
        msg: "Tum ghar jao",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  // Gallery Permission
  Future<void> requestGalleryPermission() async {
    final status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      _selectImage(false);
    } else if (status == PermissionStatus.denied) {
      Fluttertoast.showToast(
        msg: "Tum ghar jao",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  void _showSuccessDialog() {
    if (_isAllTextFill) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Image.asset("assets/images/img_success.png", height: 180),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Great!\nYour account has been created successfully",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  customButton(
                    color: primaryColor,
                    buttonName: "Go to Home",
                    onClick: () {},
                  ),
                ],
              ),
            ),
      );
    }
  }

  @override
  void initState() {
    _userNameController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();

    fillProfileEditTextMap = [
      {
        'title': 'Username',
        'controller': _userNameController,
        'inputType': TextInputType.name,
      },
      {
        'title': 'Full Name',
        'controller': _fullNameController,
        'inputType': TextInputType.name,
      },
      {
        'title': 'Email',
        'controller': _emailController,
        'inputType': TextInputType.emailAddress,
        'suffixIcon': Icons.email_rounded,
      },
      {
        'title': 'Phone Number',
        'controller': _phoneNumberController,
        'inputType': TextInputType.phone,
        'suffixIcon': CupertinoIcons.phone,
      },
    ];

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
                        onPressed: requestCameraPermission,
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
                        onPressed: requestGalleryPermission,
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
      if (context.mounted) {
        Navigator.of(context).pop();
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
              ...fillProfileEditTextMap.map((fieldData) {
                return Column(
                  children: [
                    EditTextWithTitle(
                      title: fieldData["title"],
                      inputType: fieldData["inputType"],
                      isPrimaryColor:
                      fieldData["controller"].text.trim().isNotEmpty,
                      controller: fieldData["controller"],
                      suffixIcon: fieldData["suffixIcon"],
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },),
              customButton(
                color: _isAllTextFill ? primaryColor : lightRose,
                buttonName: "Continue",
                onClick: _showSuccessDialog,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
