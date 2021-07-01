import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_news/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indian News',
      theme: ThemeData(
          textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme)),
      home: HomePage(),
    );
  }
}
