import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/utils/reusable.dart';
import 'package:news_app/widgets/CustomButton.dart';
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
  late final HtmlEditorController _htmlEditorController;
  late final TextEditingController _addTagController;

  final _dummyChip = [
  ];

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
  void initState() {
    super.initState();
    _htmlEditorController = HtmlEditorController();
    _addTagController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create New News")),
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
                        radius: const Radius.circular(20),
                        strokeCap: StrokeCap.round,
                        dashPattern: const [10, 10],
                        borderType: BorderType.RRect,
                        strokeWidth: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFf5f6fa),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  CupertinoIcons.add,
                                  color: primaryColor,
                                  size: 30,
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Add Cover Photos",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
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
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          onTap: () {
                            openSelectingImageTypeDialog(
                              selectImage: _selectImage,
                              context: context,
                            );
                          },
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 25),
              Text(
                "News Details",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Select Category",
                        style: TextStyle(
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
                  elevation: const WidgetStatePropertyAll(0),
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
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w900,
                ),
                trailingIcon: const Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.black54,
                ),
                selectedTrailingIcon: const Icon(
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
              HtmlEditor(
                controller: _htmlEditorController, //required
                otherOptions: OtherOptions(
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                htmlEditorOptions: const HtmlEditorOptions(
                  spellCheck: true,
                  hint: "Type News/Article Here...",
                ),

                htmlToolbarOptions: const HtmlToolbarOptions(
                  textStyle: TextStyle(fontSize: 24),
                  toolbarType: ToolbarType.nativeScrollable,
                  renderSeparatorWidget: false,
                  buttonBorderWidth: 0,
                  renderBorder: false,
                  defaultToolbarButtons: [
                    ListButtons(ol: true, ul: true, listStyles: false),
                    InsertButtons(
                      link: true,
                      audio: false,
                      hr: false,
                      otherFile: false,
                      picture: false,
                      table: false,
                      video: false,
                    ),
                    FontButtons(
                      bold: true,
                      italic: true,
                      underline: true,
                      clearAll: false,
                      strikethrough: false,
                      subscript: false,
                      superscript: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              EditTextWithTitle(
                title: "Add Tag",
                onFieldSubmitted: (userEnterdText) {
                  setState(() {
                    _dummyChip.add(userEnterdText);
                    _addTagController.clear();
                  });
                },
                inputType: TextInputType.text,
                controller: _addTagController,
              ),
              const SizedBox(height: 20),
              Wrap(
                children: _dummyChip.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Chip(
                      label: Text(
                        entry.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      deleteIcon: SvgPicture.asset(
                        "assets/images/ic_circle_cross.svg",
                      ),
                      chipAnimationStyle: ChipAnimationStyle(
                        enableAnimation: AnimationStyle(
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                      onDeleted: () {
                        setState(() {
                          _dummyChip.removeAt(entry.key);
                        });
                      },
                      color: const WidgetStatePropertyAll(primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: primaryColor),
                      ),
                    ),
                  );
                },).toList()
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border.all(color: Colors.grey.shade200),
        ),

        child: Row(
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 68,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0XFFfef0ef),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/ic_save.svg",
                    colorFilter: const ColorFilter.mode(
                      lightRose,
                      BlendMode.srcIn,
                    ),
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 68,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0XFFfef0ef),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Center(
                  child: Icon(Icons.calendar_month, color: lightRose),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: customButton(
                color: lightRose,
                buttonName: "Publish Now",
                onClick: () {},
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
