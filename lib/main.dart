import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islameet/presentation/welcome_page/welcome_page.dart';
import 'package:islameet/presentation/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.montserratTextTheme(),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
