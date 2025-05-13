import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/utils/reusable.dart';
import 'package:news_app/widgets/edit_text_with_title.dart';

import '../../utils/colors.dart';

class CreateNews extends StatefulWidget {
  const CreateNews({super.key});

  @override
  State<CreateNews> createState() => _CreateNewsState();
}

class _CreateNewsState extends State<CreateNews> {
  File? _image;
  final picker = ImagePicker();

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
      appBar: AppBar(title: Text("Create New News")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _image == null
                  ? InkWell(
                    onTap: () {
                      openSelectingImageTypeDialog(
                        context: context,
                        selectImage: _selectImage,
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
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
                  )
                  : Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.hardEdge,
                          child: Image.file(_image!, fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Icon(Icons.edit, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 20),
              Divider(),
              const SizedBox(height: 25),
              Text(
                "News Details",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Title",
                inputType: TextInputType.text,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Select Category",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownMenu(
                hintText: "Hello",
                menuStyle: MenuStyle(
                  elevation: WidgetStatePropertyAll(0),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade200, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w900,
                ),
                trailingIcon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.black54,
                ),
                selectedTrailingIcon: Icon(
                  Icons.arrow_drop_up_rounded,
                  color: Colors.black54,
                ),
                width: double.infinity,
                dropdownMenuEntries:
                    ["Kotlin", "Java", "C Language", "Android", "Flutter"].map((
                      e,
                    ) {
                      return DropdownMenuEntry(value: e, label: e);
                    }).toList(),
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                title: "Select Category",
                inputType: TextInputType.multiline,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
