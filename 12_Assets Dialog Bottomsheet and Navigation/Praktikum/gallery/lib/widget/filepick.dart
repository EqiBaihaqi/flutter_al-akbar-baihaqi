import 'package:assets_dialogbottomsheet_navgator/contact/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilePick extends StatelessWidget {
  const FilePick({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                provider.pickFile();
              },
              child: Text('Pick a File'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(provider.pickedFile?.name ?? 'File Not Selected'),
          ],
        );
      },
    );
  }
}
