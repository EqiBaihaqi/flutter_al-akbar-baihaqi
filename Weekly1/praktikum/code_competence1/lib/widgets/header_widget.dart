import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Image.asset(
              'assets/images/image_header.png',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            left: 38,
            top: 70,
            child: Column(
              children: [
                Text(
                  'NO APP',
                  style: TextStyle(
                      color: Color(0xFFDDDDDD),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'There is no need description for not even an app',
                  style: TextStyle(color: Color(0xFFDDDDDD), fontSize: 15),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200,
            left: 50,
            child: SizedBox(
              width: 315,
              height: 140,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Image.asset(
                      'assets/images/image_welcome.png',
                    ),
                  )),
            ),
          ),
          const Positioned(
            left: 68,
            top: 250,
            child: Text('Welcome Someone!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(5, 5))
                    ])),
          )
        ],
      ),
    );
  }
}
