import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screen/home/home_screen.dart';
import 'package:news_app/screen/main/main_screen.dart';
import 'package:news_app/screen/profile/fill_profile.dart';

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
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: primaryColor, width: 2),
        ),
        primaryColor: primaryColor,
        textTheme: GoogleFonts.merriweatherTextTheme(),
        colorScheme: ColorScheme.light(primary: primaryColor),
      ),
      home: MainScreen(),
    );
  }
}
