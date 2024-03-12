import 'package:flutter/material.dart';

class Eksplorasi extends StatelessWidget {
  const Eksplorasi({super.key});
  // Membuat variable bertipe Color
  final Color primaryColor = const Color(0xFF6200EE);
  final Color secondaryColor = const Color(0xFF03DAC5);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true, // Meletakkan judul di tengah
          title: const Text(
            'My Flutter App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.all(15),
                child: const Icon(
                  Icons.search,
                  size: 27,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text('Learn Flutter'),
            ),
            Divider(), // Berfungsi sebagai garis pemisah
            ListTile(
              title: Text('Learn ReactJS'),
            ),
            ListTile(
              title: Text('Learn VueJS'),
            ),
            Divider(),
            ListTile(
              title: Text('Learn Tailwind CSS'),
            ),
            Divider(),
            ListTile(
              title: Text('Learn UI/UX'),
            ),
            Divider(),
            ListTile(
              title: Text('Learn Figma'),
            ),
            Divider(),
            ListTile(
              title: Text('Learn Digital Marketing'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_device_information_sharp),
              label: 'Information')
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: secondaryColor,
          shape: const CircleBorder(), // Merubah bentuk floating button menjadi lingkaran
          child: const Icon(Icons.add),
        ),
      ),
    ));
  }
}
