import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectDateWidget extends StatefulWidget {
  DateTime pilihDate;
  final DateTime dateAwal;
  final DateTime dateAkhir;
  final ValueChanged<DateTime> onchanged;

  SelectDateWidget(
      {super.key,
      required this.pilihDate,
      required this.dateAwal,
      required this.dateAkhir,
      required this.onchanged});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Date'),
        TextButton(
            onPressed: () async {
              DateTime? selectDate = await showDatePicker(
                context: context,
                initialDate: widget.pilihDate,
                firstDate: widget.dateAwal,
                lastDate: widget.dateAkhir,
                
              );
              if (selectDate != null) {
                setState(() {
                  widget.onchanged(selectDate);
                });
              }
            },
            child: const Text('Select'))
      ],
    );
  }
}
