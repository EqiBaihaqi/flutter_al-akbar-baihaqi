

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilePickerWidget extends StatefulWidget {
   PlatformFile? pickedFile;
  final ValueChanged onchanged;
   FilePickerWidget(
      {super.key, required this.pickedFile, required this.onchanged});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _pickFile();
          setState( () {});
        },
        child: const Text('Pick File'));
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      widget.pickedFile = result.files.first;
    }
    setState(() {
      widget.onchanged(widget.pickedFile);
    });
  }
}
