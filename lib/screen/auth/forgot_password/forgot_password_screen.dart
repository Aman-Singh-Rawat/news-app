import 'package:flutter/material.dart';
import 'package:news_app/widgets/CustomButton.dart';
import 'package:news_app/widgets/edit_text_with_title.dart';

import '../../../utils/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailEmpty = true;

  @override
  void initState() {
    _emailController.addListener(_isOurTextFieldEmpty);
    super.initState();
  }

  void _isOurTextFieldEmpty() {
    setState(() {
      _isEmailEmpty = _emailController.text.trim().toString().isEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/img-forgot-password.png",
                  width: 300,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Select which contact details should we use to reset your password",
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              const SizedBox(height: 32),
              EditTextWithTitle(
                title: "Email",
                inputType: TextInputType.emailAddress,
                isPrimaryColor: true,
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              customButton(
                color: _isEmailEmpty ? lightRose : primaryColor,
                buttonName: "Continue",
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
