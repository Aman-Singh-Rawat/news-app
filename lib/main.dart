import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screen/auth/signup_screen.dart';
import 'package:news_app/screen/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const NewsApp());
}

const primaryColor = Color(0XFFFF7670);

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: primaryColor, width: 2),
        ),
        useMaterial3: true,
        primaryColor: primaryColor,
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.light(primary: primaryColor),
      ),
      home: SignupScreen(),
    );
  }
}
