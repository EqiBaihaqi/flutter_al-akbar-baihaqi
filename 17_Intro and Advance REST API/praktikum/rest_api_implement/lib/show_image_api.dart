import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShowImageApi extends StatefulWidget {
  const ShowImageApi({super.key});

  @override
  State<ShowImageApi> createState() => _ShowImageApiState();
}

class _ShowImageApiState extends State<ShowImageApi> {
  Uint8List? image;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    try {
      var response = await Dio().get('https://api.dicebear.com/8.x/bottts/png',
          options: Options(responseType: ResponseType.bytes));

      image = response.data;
      setState(() {});
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: image != null
              ? Image.memory(
                  image!,
                  width: 100,
                  height: 100,
                )
              : const CircularProgressIndicator()),
    );
  }
}
