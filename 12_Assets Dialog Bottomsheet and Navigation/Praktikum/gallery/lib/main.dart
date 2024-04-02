import 'package:assets_dialogbottomsheet_navgator/gallery_page.dart';
import 'package:assets_dialogbottomsheet_navgator/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: GalleryPage(),
      ),
    );
  }
}
