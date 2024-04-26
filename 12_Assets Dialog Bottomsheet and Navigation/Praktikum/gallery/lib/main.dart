import 'package:assets_dialogbottomsheet_navgator/bloc/button_bloc_bloc.dart';
import 'package:assets_dialogbottomsheet_navgator/pages/gallery_page.dart';
import 'package:assets_dialogbottomsheet_navgator/utils/contact_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider<ButtonBlocBloc>(create: (context) => ButtonBlocBloc())
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
