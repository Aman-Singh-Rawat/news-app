import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class ForgotPassOtp extends StatefulWidget {
  const ForgotPassOtp({super.key});

  @override
  State<ForgotPassOtp> createState() => _ForgotPassOtpState();
}

class _ForgotPassOtpState extends State<ForgotPassOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Code has been sent send to your email"),
            SizedBox(height: 20),
            OtpPinField(
              onSubmit: (text) {},
              otpPinFieldDecoration: OtpPinFieldDecoration.custom,
              fieldWidth: 80,
              fieldHeight: 65,
              cursorColor: primaryColor,
              otpPinFieldStyle: OtpPinFieldStyle(
                activeFieldBackgroundColor: Colors.white,
                activeFieldBorderColor: primaryColor,
                fieldBorderRadius: 18,
                fieldPadding: 14,
                activeFieldBorderGradient: LinearGradient(colors: [
                  lightRose,
                  primaryColor,
                ]),
                defaultFieldBorderColor: Colors.grey.shade200
              ),
              onChange: (text) {},
            ),
          ],
        ),
      ),
    );
  }
}
