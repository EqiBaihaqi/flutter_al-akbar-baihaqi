import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form/const/date_format_constant.dart';
import 'package:form/widget/color_picker_widget.dart';
import 'package:form/widget/file_picker_widget.dart';
import 'package:form/widget/select_date_widget.dart';
import 'package:open_file/open_file.dart';

class Pickers extends StatefulWidget {
  const Pickers({super.key});

  @override
  State<Pickers> createState() => _PickersState();
}

class _PickersState extends State<Pickers> {
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime(2000);
  DateTime lastDate = DateTime.now();
  //membuat variable color yang akan berubah
  Color currentColor = Colors.black;
  Color pickColor = Colors.white;
  PlatformFile? pickedFile;

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
            SelectDateWidget(
              pilihDate: selectedDate,
              dateAwal: startDate,
              dateAkhir: lastDate,
              //onchanged digunakan agar value yang dirubah pada SelectDateWidget() date dapat
              //dikembalikan ke Pickers()
              onchanged: (newDate) {
                selectedDate = newDate;
                setState(() {});
              },
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
                child: ColorPickerWidget(
              currentColor: currentColor,
              pickColor: pickColor,
              onchanged: (newColor) {
                currentColor = newColor;
                setState(() {});
              },
            )),
            const SizedBox(
              height: 20,
            ),
            const Text('Pick File'),
            Center(
                child: FilePickerWidget(
              pickedFile: pickedFile,
              onchanged: (newFile) {
                pickedFile = newFile;
                setState(() {});
              },
            )),
            const SizedBox(
              height: 8,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (pickedFile != null) {
                        _openFile(pickedFile!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('File belum dipilih')));
                      }

                      setState(() {});
                    },
                    child: const Text('Open File')))
          ],
        ),
      ),
    );
  }

  void _openFile(PlatformFile pickedFile) {
    OpenFile.open(pickedFile.path);
  }
}
