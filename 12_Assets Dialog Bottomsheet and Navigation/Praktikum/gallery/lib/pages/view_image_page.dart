import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  final String image;
  const ViewImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 550,
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Image Url :\n $image',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
