import 'package:club_house_ui/constants.dart';
import 'package:club_house_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kBackGround,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackGround,
        ),
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: kButtonColor,
        ),
        iconTheme: const IconThemeData(color: kIconColor),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
