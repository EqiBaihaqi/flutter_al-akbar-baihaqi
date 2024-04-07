import 'package:assets_dialogbottomsheet_navgator/contact/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ColorPick extends StatelessWidget {
  const ColorPick({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Consumer<ContactProvider>(
                      builder: (context, provider, child) {
                        return AlertDialog(
                          title: Text('Select Color'),
                          content: BlockPicker(
                              pickerColor: Colors.black,
                              onColorChanged: (value) {
                                provider.changeColor(value);
                              }),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  provider.insertColor();
                                  Navigator.pop(context);
                                },
                                child: Text('Select'))
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Text('Pick a Color')),
          SizedBox(
            height: 15,
          ),
          Consumer<ContactProvider>(
            builder: (context, provider, child) {
              return Container(
                  width: double.infinity,
                  height: 15,
                  decoration: BoxDecoration(
                      color: provider.pickedColor ?? Colors.black));
            },
          )
        ],
      ),
    );
  }
}
