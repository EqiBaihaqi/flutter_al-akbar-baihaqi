import 'package:flutter/material.dart';
import 'package:form/model/daftar_kontak.dart';
import 'package:form/picker.dart';
import 'package:form/text_form.dart';
import 'package:form/widget/text_form_custom.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Pickers());
  }
}
