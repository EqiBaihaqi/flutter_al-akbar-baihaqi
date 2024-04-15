import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// ignore: must_be_immutable
class ColorPickerWidget extends StatefulWidget {
  Color currentColor;
  Color pickColor;
  ValueChanged onchanged;
  ColorPickerWidget(
      {super.key,
      required this.currentColor,
      required this.pickColor,
      required this.onchanged});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Select Color'),
                content: BlockPicker(
                    pickerColor: widget.currentColor,
                    onColorChanged: (value) {
                      widget.pickColor = value;
                    }),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        widget.currentColor = widget.pickColor;
                        Navigator.pop(context);
                        setState(() {
                          widget.onchanged(widget.currentColor);
                        });
                      },
                      child: const Text('Save'))
                ],
              );
            });
      },
      style: ElevatedButton.styleFrom(backgroundColor: widget.currentColor),
      child: const Text(
        'Pick Color',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
