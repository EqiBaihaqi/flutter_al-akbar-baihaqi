import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageGenerator extends StatefulWidget {
  const ImageGenerator({super.key});

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  TextEditingController urlImageController = TextEditingController();
  Uint8List? image;
  @override
  void dispose() {
    urlImageController.dispose();
    super.dispose();
  }

  void fetchImage() async {
    String imageUrl = urlImageController.text.trim().toLowerCase();
    if (imageUrl != 'pixel-art' && imageUrl != 'lorelei') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter either "pixel-art" or "lorelei".'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    Dio dio = Dio();

    try {
      Response response = await dio.get(
          'https://api.dicebear.com/8.x/$imageUrl/svg',
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
      appBar: AppBar(
        title: const Text('Image Generator'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
                child: image != null
                    ? SvgPicture.memory(
                        image!,
                        width: 100,
                        height: 100,
                      )
                    : const CircularProgressIndicator()),
            TextFormField(
              controller: urlImageController,
              decoration: const InputDecoration(
                  hintText: 'Enter Image Type (pixel-art or lorelei)'),
            ),
            ElevatedButton(
                onPressed: () {
                  fetchImage();
                },
                child: const Text('Generate')),
          ],
        ),
      ),
    );
  }
}
