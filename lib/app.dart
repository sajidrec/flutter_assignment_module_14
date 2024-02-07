import 'package:flutter/material.dart';
import 'package:flutter_assignment_module_14/home_page.dart';

class ImageDetailsApp extends StatelessWidget {
  const ImageDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 3),
      ),
      home: const HomePage(),
    );
  }
}
