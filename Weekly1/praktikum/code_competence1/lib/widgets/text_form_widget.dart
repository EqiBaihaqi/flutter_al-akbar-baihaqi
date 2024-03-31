import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;

  const TextFormWidget(
      {super.key,
      required this.controller,
      required this.inputType,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          label: Text(label),
          filled: true,
          fillColor: const Color(0xFFE7E0EC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
