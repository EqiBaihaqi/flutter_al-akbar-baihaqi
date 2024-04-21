import 'package:flutter/material.dart';
import 'package:rest_api_implement/service/put_service.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Put Page'),
        ),
        body: ElevatedButton(
            onPressed: () {
              PutData.putData();
            },
            child: const Text('PUT')));
  }
}
