

import 'package:assets_dialogbottomsheet_navgator/pages/contact_page.dart';
import 'package:assets_dialogbottomsheet_navgator/pages/gallery_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF211134),
      child: ListView(children: [
        DrawerHeader(
            child: Center(
                child: Text(
          'Name App',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ))),
        ListTile(
          leading: Icon(Icons.image),
          title: Text('Gallery'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GalleryPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_page),
          title: Text('Contact'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ContactPage()));
          },
        )
      ]),
    );
  }
}
