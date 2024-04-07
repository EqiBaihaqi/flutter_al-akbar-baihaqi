import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact_provider.dart';

class FormUsername extends StatelessWidget {
  const FormUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        return TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            errorText: provider.errorUsername,
            hintText: 'Nama',
            hintStyle: TextStyle(color: Color(0xFF49454F)),
            border: const OutlineInputBorder(borderSide: BorderSide()),
            filled: true,
            fillColor: const Color(0xFFE7E0EC),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            provider.validateUsername(value);
          },
        );
      },
    );
  }
}
