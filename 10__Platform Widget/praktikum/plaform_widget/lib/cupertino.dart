import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino extends StatelessWidget {
  const Cupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData.raw(Brightness.dark, null, null, null, null,
          null, null), // Memasang dark theme
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('CupertinoApp'),
          ),
          child: Center(
            child: Text('This is Cupertino'),
          )),
    ));
  }
}
