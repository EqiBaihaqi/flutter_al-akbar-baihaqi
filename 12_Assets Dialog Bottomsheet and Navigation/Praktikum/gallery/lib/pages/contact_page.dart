

import 'package:assets_dialogbottomsheet_navgator/widget/button_contact.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/colorpick.dart';

import 'package:assets_dialogbottomsheet_navgator/widget/date.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/filepick.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/form_nomor.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/form_username.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/drawer_widget.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/list_contact.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Icon(
                Icons.contacts_outlined,
                size: 30,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Create New Contact',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Pada page ini kita bisa nemambahkan sekaligus mengedit dan menghapus kontak yang ada',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              FormUsername(),
              SizedBox(
                height: 15,
              ),
              FormNomor(),
              DatePage(),
              SizedBox(
                height: 15,
              ),
              ColorPick(),
              SizedBox(
                height: 15,
              ),
              FilePick(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonContact(),
                ],
              ),
              ListContact()
            ],
          ),
        ),
      ),
    );
  }
}
