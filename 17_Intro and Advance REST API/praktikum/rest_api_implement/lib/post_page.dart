import 'package:flutter/material.dart';
import 'package:rest_api_implement/service/contact_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Contact'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(hintText: 'Phone'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ContactService.postContact(
                    name: nameController.text, phone: phoneController.text);
                setState(() {});
              },
              child: const Text('POST')),
        ],
      ),
    );
  }
}
