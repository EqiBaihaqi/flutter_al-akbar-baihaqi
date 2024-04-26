import 'package:flutter/material.dart';
import 'package:form/text_form.dart';
import 'package:form/utils/shared_pref.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obsecureText = true;

  void _togleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_4_sharp,
              size: 135,
            ),
            const Text(
              'Helo New User !!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              key: const Key('username_field'),
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(borderSide: BorderSide()),
                filled: true,
                fillColor: Color(0xFFE7E0EC),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              key: const Key('password_field'),
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: const OutlineInputBorder(borderSide: BorderSide()),
                  filled: true,
                  fillColor: const Color(0xFFE7E0EC),
                  suffixIcon: GestureDetector(
                    onTap: _togleObscured,
                    child: Icon(_obsecureText ? Icons.lock : Icons.lock_open),
                  )),
              obscureText: _obsecureText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    SharedPrefLogin.saveUsername(
                        username: usernameController.text);
                    SharedPrefLogin.savePassword(
                        password: passwordController.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Textform()),
                        (route) => false);
                  },
                  child: const Text('Login'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
