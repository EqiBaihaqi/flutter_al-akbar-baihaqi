import 'package:flutter/material.dart';
import 'package:plaform_widget/cupertino.dart';
import 'package:plaform_widget/eksplorasi/eksplorasi.dart';

void main() {
  runApp(const Eksplorasi());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap MaterialApp menggunakan safearea agar terhindar dari overlay pada tampilan
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Menghilangkan icon debug
        theme: ThemeData.dark(), // Membuat dark mode
        home: Scaffold(
          appBar: AppBar(
            backgroundColor:
                Colors.black38, // Memberikan background color pada appbar
            title: const Text('Material App',
                style: TextStyle(
                    color: Colors
                        .white)), // Memberi judul pada app bar dan merubah warna text
          ),
          //Membuat Drawer
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                ListTile(
                  title: Text('Home'),
                ),
                ListTile(
                  title: Text('Setting'),
                )
              ],
            ),
          ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        7), // Wrap dengan container agar bisa memberikan padding
                child: const ListTile(
                  leading: Icon(Icons.person_3_outlined),
                  title: Text('Baihaqi'),
                  subtitle: Text('+62 8723-8237-231'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting')
          ]),
        ),
      ),
    );
  }
}
