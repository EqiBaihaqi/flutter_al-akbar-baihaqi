import 'package:code_competence1/widgets/header_widget.dart';
import 'package:code_competence1/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(
              height: 8,
            ),
            TextFormWidget(
                controller: usernameController,
                inputType: TextInputType.text,
                label: 'Username'),
            const SizedBox(
              height: 6,
            ),
            TextFormWidget(
                controller: emailController,
                inputType: TextInputType.emailAddress,
                label: 'Email'),
            const SizedBox(
              height: 6,
            ),
            TextFormWidget(
                controller: messageController,
                inputType: TextInputType.multiline,
                label: 'Message'),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Back'))
                          ],
                          title: const Text('Data Berhasil Dimasukkan!!'),
                          alignment: Alignment.center,
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Username : ${usernameController.text}'),
                                Text('Email : ${emailController.text}'),
                                Text('Message : ${messageController.text}')
                              ],
                            ),
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: const Color(0xFFC67C4E)),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
