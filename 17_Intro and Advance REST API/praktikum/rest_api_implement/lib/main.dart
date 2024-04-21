import 'package:flutter/material.dart';
import 'package:rest_api_implement/convert_json.dart';
import 'package:rest_api_implement/post_page.dart';
import 'package:rest_api_implement/put_page.dart';
import 'package:rest_api_implement/show_image_api.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ShowImageApi());
  }
}
