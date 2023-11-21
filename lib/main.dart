// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATHAYA BERITA',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        //font
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const MyHomePage(),
    );
  }
}
