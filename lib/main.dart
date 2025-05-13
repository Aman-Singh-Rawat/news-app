import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screen/mynews/create_news.dart';
import 'package:news_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const NewsApp());
}


class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade200,

        ),
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: primaryColor, width: 2),
        ),
        primaryColor: primaryColor,
        textTheme: GoogleFonts.merriweatherTextTheme(),
        colorScheme: ColorScheme.light(primary: primaryColor),
      ),
      home: CreateNews(),
    );
  }
}
