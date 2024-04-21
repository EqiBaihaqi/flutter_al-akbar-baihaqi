import 'package:assets_dialogbottomsheet_navgator/const/date_format_constant.dart';
import 'package:assets_dialogbottomsheet_navgator/contact/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePage extends StatelessWidget {
  const DatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date'),
            Consumer<ContactProvider>(
              builder: (context, provider, child) {
                return TextButton(
                    onPressed: () async {
                      DateTime? pilihDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now());
                      provider.getDate(pilihDate);
                    },
                    child: Text(
                      'Select',
                      style: TextStyle(color: Colors.blue),
                    ));
              },
            ),
          ],
        ),
        Consumer<ContactProvider>(
          builder: (context, provider, child) {
            return provider.pilihDate == null
                ? Text('')
                : Text(DateFormatConstant.getDayDateHours(provider.pilihDate!));
          },
        )
      ],
    );
  }
}
