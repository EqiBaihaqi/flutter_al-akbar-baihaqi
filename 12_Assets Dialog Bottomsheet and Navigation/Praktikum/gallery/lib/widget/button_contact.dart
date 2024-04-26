
import 'package:assets_dialogbottomsheet_navgator/utils/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonContact extends StatelessWidget {
  const ButtonContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        return ElevatedButton(
            style: provider.validationForm()
                ? ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6750A4))
                : ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                
            onPressed: provider.validationForm()
                ? () {
                    provider.addToList();
                  }
                : null,
            child: Text(
              'Submit',
            ));
      },
    );
  }
}
