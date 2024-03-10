import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //menghilagkan debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Halo Alterra'),
        ),
        body: const Center(
          child: Text(
            'Nama saya adalah Al Akbar Baihaqi',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
