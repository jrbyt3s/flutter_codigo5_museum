import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museum/pages/init_page.dart';
import 'package:flutter_codigo5_museum/pages/intro_slider_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      home: IntroSliderPage(),
    );
  }
}
