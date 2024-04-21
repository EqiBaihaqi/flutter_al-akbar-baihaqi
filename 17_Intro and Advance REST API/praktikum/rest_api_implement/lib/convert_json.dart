import 'dart:convert';

import 'package:flutter/material.dart';

class ConvertJson extends StatefulWidget {
  const ConvertJson({super.key});

  @override
  State<ConvertJson> createState() => _ConvertJsonState();
}

class _ConvertJsonState extends State<ConvertJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion JSON'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var jsonData =
                '{"id": 2, "name": "Jhon Thor","phone": "0857676565688"}';
            print('Sebelum Convert $jsonData');

            var convertedJson = jsonDecode(jsonData);
            print('Sesudah Convert $convertedJson');
          },
          child: const Text('Show API'),
        ),
      ),
    );
  }
}
