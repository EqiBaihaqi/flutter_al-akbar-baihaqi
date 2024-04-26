
import 'package:assets_dialogbottomsheet_navgator/utils/contact_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FormNomor extends StatelessWidget {
  const FormNomor({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        return TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: provider.errorNomor,
            hintText: 'Nomor Telepon',
            hintStyle: TextStyle(color: Color(0xFF49454F)),
            border: const OutlineInputBorder(borderSide: BorderSide()),
            filled: true,
            fillColor: const Color(0xFFE7E0EC),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)),
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            provider.validateNomor(value);
          },
        );
      },
    );
  }
}
