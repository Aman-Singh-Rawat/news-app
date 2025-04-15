import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class EditTextWithTitle extends StatefulWidget {
  const EditTextWithTitle({
    super.key,
    required this.title,
    required this.inputType,
    this.isPrimaryColor = true,
    required this.controller,
    this.isRequired = true,
    this.obscureText = false,
  });

  final bool isPrimaryColor;
  final String title;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool isRequired; // Indicate if the field is required
  final bool obscureText;

  @override
  State<EditTextWithTitle> createState() => _EditTextWithTitleState();
}

class _EditTextWithTitleState extends State<EditTextWithTitle> {
  bool _isPasswordVisible = false;
  late final OutlineInputBorder _outlineInputBorder;

  @override
  void initState() {
    super.initState();

    _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 0.5),
      borderRadius: BorderRadius.circular(30),
    );
    _isPasswordVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleRow(),
        const SizedBox(height: 10),
        _buildTextFormField(),
      ],
    );
  }

  Widget _buildTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            if (widget.isRequired)
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
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: _isPasswordVisible,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible
                ? CupertinoIcons.eye_fill
                : CupertinoIcons.eye_slash_fill,
            color: Colors.black54,
          ),
        )
            : null,
        hintText: widget.title,
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
        focusedBorder: _outlineInputBorder.copyWith(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        enabledBorder: _outlineInputBorder.copyWith(
          borderSide: BorderSide(
            color: widget.isPrimaryColor ? primaryColor : Colors.grey.shade300,
            width: widget.isPrimaryColor ? 2 : 0.5,
          ),
        ),
      ),
    );
  }
}