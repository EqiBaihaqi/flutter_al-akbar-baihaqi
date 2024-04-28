import 'package:flutter/material.dart';
import 'package:open_api_implement/model/recomendation.dart';

class ResultPage extends StatefulWidget {
  final GptData gptData;
  const ResultPage({super.key, required this.gptData});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(child: Text(widget.gptData.choices?[0].message?.content ?? "-"),),
    );
  }
}