import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class EditTextWithTitle extends StatefulWidget {
  const EditTextWithTitle({
    super.key,
    required this.textTitle,
    required this.textInputType,
    required this.textEditingController,
  });

  final String textTitle;
  final TextInputType textInputType;
  final TextEditingController textEditingController;

  @override
  State<EditTextWithTitle> createState() => _EditTextWithTitle();
}

class _EditTextWithTitle extends State<EditTextWithTitle> {
  bool hasText = false;
  bool _isPasswordVisible = true;
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
    borderRadius: BorderRadius.circular(30),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.textTitle,
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
        TextFormField(
          controller: widget.textEditingController,
          onFieldSubmitted: (value) {
            hasText = value.trim().isNotEmpty;
            setState(() {});
          },
          obscureText:
              widget.textTitle != "Email" ? _isPasswordVisible : false,
          keyboardType: widget.textInputType,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
          onTap: () {
            outlineInputBorder = OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(30),
            );
            setState(() {});
          },
          decoration: InputDecoration(
            suffixIcon:
                widget.textTitle != "Email"
                    ? IconButton(
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                        setState(() {});
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                        color: Colors.black54,
                      ),
                    )
                    : null,
            hintText: widget.textTitle,
            hintStyle: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 14,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w900,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 20,
            ),
            focusedBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            enabledBorder: outlineInputBorder,
          ),
        ),
      ],
    );
  }
}
