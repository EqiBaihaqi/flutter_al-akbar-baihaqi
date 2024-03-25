import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form/const/date_format_constant.dart';
import 'package:open_file/open_file.dart';

class Pickers extends StatefulWidget {
  const Pickers({super.key});

  @override
  State<Pickers> createState() => _PickersState();
}

class _PickersState extends State<Pickers> {
  DateTime selectedDate = DateTime.now();
  //membuat variable color yang akan berubah
  Color currentColor = Colors.black;
  Color? pickColor;
  File? _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Interactive Widgets',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date'),
                TextButton(
                    onPressed: () async {
                      DateTime? selectDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now());

                      if (selectDate != null) {
                        setState(() {
                          selectedDate = selectDate;
                        });
                      }
                    },
                    child: const Text('Select'))
              ],
            ),
            Text(DateFormatConstant.getDayDateHours(selectedDate)),
            const SizedBox(
              height: 18,
            ),
            const Text('Color'),
            const SizedBox(
              height: 6,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(color: currentColor),
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Select Color'),
                        content: BlockPicker(
                            pickerColor: currentColor,
                            onColorChanged: (value) {
                              pickColor = value;
                            }),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                currentColor = pickColor!;
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('Save'))
                        ],
                      );
                    });
              },
              style: ElevatedButton.styleFrom(backgroundColor: currentColor),
              child: const Text(
                'Pick Color',
                style: TextStyle(color: Colors.white),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            const Text('Pick File'),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    _pickFile();
                    setState(() {});
                  },
                  child: const Text('Pick and Open File')),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: _image == null
                      ? null
                      : DecorationImage(
                          image: FileImage(_image!), fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      final file = result.files.first;
      _image = File(file.path!);
    }
    setState(() {});
  }

  void _openFile(PlatformFile pickedFile) {
    OpenFile.open(pickedFile.path);
  }
}
