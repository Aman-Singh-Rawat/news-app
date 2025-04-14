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
  bool _isRemember = false;
  bool _isTextEmpty = true;

  final GlobalKey _formKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isTextEmpty =
        _emailController.text.trim().toString().isEmpty ||
        _passwordController.text.trim().toString().isEmpty;

    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.minHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/img_app_logo.png",
                            width: 230,
                          ),
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
                              onChanged: (value) {
                                _isRemember = value ?? false;
                                setState(() {});
                              },
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
                          buttonName: "Sign Up",
                          color: _isTextEmpty ? lightRose : primaryColor,
                          onClick: () {},
                        ),
                        Center(
                          child: Text(
                            "or continue with",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: SocialMediaButton(
                                buttonName: "Facebook",
                                buttonIcon: "assets/images/ic_facebook.svg",
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: SocialMediaButton(
                                buttonName: "Google",
                                buttonIcon: "assets/images/ic_google.svg",
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Positioned(
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
