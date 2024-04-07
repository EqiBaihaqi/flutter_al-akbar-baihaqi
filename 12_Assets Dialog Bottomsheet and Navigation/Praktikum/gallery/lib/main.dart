import 'package:assets_dialogbottomsheet_navgator/contact/contact.dart';
import 'package:assets_dialogbottomsheet_navgator/contact/contact_provider.dart';
import 'package:assets_dialogbottomsheet_navgator/gallery_page.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactProvider>(
            create: (context) => ContactProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData(brightness: Brightness.light),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: GalleryPage()),
    );
  }
}
