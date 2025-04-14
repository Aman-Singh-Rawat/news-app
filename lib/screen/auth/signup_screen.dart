import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/main.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/widgets/CustomButton.dart';
import 'package:news_app/widgets/social_media_button.dart';

import '../../widgets/edit_text_with_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSignUp = false;
  bool _isRemember = false;
  bool _isTextEmpty = true;

  @override
  void initState() {
    _emailController.addListener(_isOurTextFieldEmpty);
    _passwordController.addListener(_isOurTextFieldEmpty);

    super.initState();
  }

  void _isOurTextFieldEmpty() {
    setState(() {
      _isTextEmpty =
          _emailController.text.trim().toString().isEmpty ||
          _passwordController.text.trim().toString().isEmpty;
    });
  }

  void _onSignUpPressed() {
    if (!_isTextEmpty) {}
  }

  void _onScreenChange() {
    _isSignUp = !_isSignUp;
    setState(() {});
  }

  void _onRememberMeChanged(bool? value) {
    setState(() {
      _isRemember = value ?? false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  "assets/images/img_app_logo.png",
                  width: 210,
                ),
              ),
              Center(
                child: Text(
                  _isSignUp ? "Create an Account" : "Let's Sign You In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              EditTextWithTitle(
                textTitle: "Email",
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              EditTextWithTitle(
                textTitle: "Password",
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: _isRemember,
                    onChanged: _onRememberMeChanged,
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              customButton(
                buttonName: _isSignUp ? "Sign Up" : "Sign in",
                color: _isTextEmpty ? lightRose : primaryColor,
                onClick: _onSignUpPressed,
              ),
              _isSignUp
                  ? SizedBox.shrink()
                  : Center(
                child: InkWell(
                  child: Text(
                    "Forgot the password?",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              SizedBox(height: _isSignUp ? 10 : 25),
              Center(
                child: Text(
                  "or continue with",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: SocialMediaButton(
                      buttonName: "Facebook",
                      buttonIcon: "assets/images/ic_facebook.svg",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SocialMediaButton(
                      buttonName: "Google",
                      buttonIcon: "assets/images/ic_google.svg",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isSignUp
                        ? "Already have an account?"
                        : "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: _onScreenChange,
                    child: Text(
                      _isSignUp ? "Sign in" : "Sign up",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
