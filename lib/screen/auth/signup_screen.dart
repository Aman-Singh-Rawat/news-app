import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/main.dart';

import '../../widgets/edit_text_with_title.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});


  final GlobalKey _formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/img_app_logo.png", width: 230),
            ),
            Center(
              child: Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 30),
            EditTextWithTitle(
              textTitle: "Email",
              textEditingController: TextEditingController(),
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            EditTextWithTitle(
              textTitle: "Password",
              textEditingController: TextEditingController(),
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
