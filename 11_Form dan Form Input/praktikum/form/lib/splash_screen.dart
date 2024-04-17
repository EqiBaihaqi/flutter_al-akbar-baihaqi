import 'package:flutter/material.dart';
import 'package:form/login_page.dart';
import 'package:form/text_form.dart';
import 'package:form/utils/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkToken() async {
    final token = await SharedPrefLogin.getUsername();

    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Textform()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          size: 100,
        ),
      ),
    );
  }
}
