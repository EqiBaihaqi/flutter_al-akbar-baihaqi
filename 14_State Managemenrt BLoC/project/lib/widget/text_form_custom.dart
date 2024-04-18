import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFormFieldCustom extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String? prefix;
  final String labelText;
  final String? hint;
  final Function(String)? onChanged;
  final TextInputType? keyboard;
  final String? errorText;
  final bool isValidInput;
  TextFormFieldCustom({
    super.key,
    this.controller,
    this.hint,
    required this.labelText,
    this.prefix,
    this.onChanged,
    this.keyboard,
    this.errorText,
    this.isValidInput = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        prefixText: prefix,
        labelText: labelText,
        hintText: hint,
        border: const OutlineInputBorder(borderSide: BorderSide()),
        filled: true,
        fillColor: const Color(0xFFE7E0EC),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
      style: const TextStyle(color: Color(0xFF49454F)),
      onChanged: onChanged,
      inputFormatters: [
        if (isValidInput) ...[FilteringTextInputFormatter.digitsOnly]
      ],
    );
  }
}
