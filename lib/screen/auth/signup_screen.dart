import 'package:flutter/material.dart';
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
  bool _isSignUp = true;
  bool _isRemember = false;
  bool _isEmailEmpty = true;
  bool _isPasswordEmpty = true;

  @override
  void initState() {
    _emailController.addListener(_isOurTextFieldEmpty);
    _passwordController.addListener(_isOurTextFieldEmpty);

    super.initState();
  }

  void _isOurTextFieldEmpty() {
    setState(() {
      _isEmailEmpty = _emailController.text.trim().toString().isEmpty;
      _isPasswordEmpty = _passwordController.text.trim().toString().isEmpty;
    });
  }

  void _onSignUpPressed() {
    if (_isEmailEmpty || _isPasswordEmpty) {}
  }

  void _onScreenChange() {
    _isSignUp = !_isSignUp;

    _emailController.clear();
    _passwordController.clear();
    FocusScope.of(context).unfocus();
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
    return PopScope(
      canPop: _isSignUp,
      onPopInvokedWithResult: (didPop, result) {
        _isSignUp = !_isSignUp;
        setState(() {});
      },
      child: Scaffold(
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
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                EditTextWithTitle(
                  title: "Email",
                  isPrimaryColor: !_isEmailEmpty,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                EditTextWithTitle(
                  title: "Password",
                  obscureText: true,
                  isPrimaryColor: !_isPasswordEmpty,
                  controller: _passwordController,
                  inputType: TextInputType.visiblePassword,
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
                    const Text(
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
                  color:
                      _isPasswordEmpty || _isEmailEmpty
                          ? lightRose
                          : primaryColor,
                  onClick: _onSignUpPressed,
                ),
                _isSignUp
                    ? const SizedBox.shrink()
                    : const Center(
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
                const Center(
                  child: Text(
                    "or continue with",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Expanded(
                      child: SocialMediaButton(
                        buttonName: "Facebook",
                        buttonIcon: "assets/images/ic_facebook.svg",
                      ),
                    ),
                    SizedBox(width: 20),
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
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: _onScreenChange,
                      child: Text(
                        _isSignUp ? "Sign in" : "Sign up",
                        style: const TextStyle(
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
      ),
    );
  }
}
