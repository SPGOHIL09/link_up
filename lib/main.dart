import 'package:link_up/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1828),
        primaryColor: const Color(0xFF375FFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF152033),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFFF7F7FC),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFFF7F7FC)),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFFF7F7FC),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFFF7F7FC),
            fontSize: 14,
          ),
           bodyMedium: TextStyle(
            color: Color(0xFFF7F7FC),
            fontSize: 12,
          ),
        ),
        cardTheme: const CardTheme(
          color: Color(0xFF152033),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF375FFF),
          size: 40,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
