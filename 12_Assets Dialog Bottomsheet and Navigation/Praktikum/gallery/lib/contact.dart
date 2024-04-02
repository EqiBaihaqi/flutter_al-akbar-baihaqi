import 'package:assets_dialogbottomsheet_navgator/widget/drawer_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  String? _errorName = '';
  String? _errorNomor = '';
  List daftarKontak = [];
  bool isUpdateContact = false;
  bool isPrefixActive =
      true; // Variable untuk membuat prefix hide ketika form diklik
  int _index = -1;
  DateTime pilihDate = DateTime.now();
  DateTime dateAkhir = DateTime.now();
  DateTime dateAwal = DateTime(1999);

  //Variable untuk color picker
  Color currentColor = Colors.green;
  Color pickColor = Colors.white;

  //Vazriable untukl mengambil inputan dari file picker widget
  PlatformFile? pickFile;

  //Membuat function untuk mengedit data
  void onEdit(int index) {
    isUpdateContact = true;
    nameController.text = daftarKontak[index].name;
    nomorController.text = daftarKontak[index].nomor;
    _index = index;
    setState(() {});
  }

  void onDelete(int index) {
    daftarKontak.remove(
      daftarKontak[index],
    );
    setState(() {});
  }

  //Membuat kondisi untuk validation error
  bool textFormCheck() {
    return _errorName == null &&
        _errorNomor == null &&
        nameController.text != '' &&
        nomorController.text != '';
  }

  @override
  void dispose() {
    nameController.dispose();
    nomorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Contact'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Column(
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    nameController.text = value;
                    if (nameController.text.isEmpty) {
                      _errorName = 'Nama masih kosong';
                      //Membuat validasi bahwa isi dari form nama harus hanya berupa huruf dan spacebar
                    } else if (!RegExp(r'^[a-zA-Z\s]+$')
                        .hasMatch(nameController.text)) {
                      _errorName = 'Nama harus berupa huruf saja';
                      // Membuat kondisi jika huruf awal tidak mengandung huruf kapital
                    } else if (!nameController.text
                        .substring(0, 1)
                        .contains(RegExp(r'[A-Z]'))) {
                      _errorName = 'Nama harus diawali huruf kapital';
                    } else if (nameController.text.length <= 2) {
                      _errorName = 'Nama harus lebih dari 2 huruf';
                    } else {
                      _errorName = null;
                    }
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: nomorController,
                  onChanged: (value) {
                    nomorController.text = value;
                    if (nomorController.text.isEmpty) {
                      _errorNomor = 'Nomor masih kosong';
                      // Kondisi jika awal nomor bukan 0
                    } else if (nomorController.text[0] != '0') {
                      _errorNomor = 'Nomor harus diawali dengan angka 0';
                      //Jika length < 8 dan > 15 maka akan memunculkan error
                    } else if (nomorController.text.length < 8 ||
                        nomorController.text.length > 15) {
                      _errorNomor =
                          'Nomor HP setidaknya terdiri dari 8-15 digit';
                    } else {
                      _errorNomor = null;
                    }
                    setState(() {
                      isPrefixActive =
                          false; // Merubah variable menjadi false ketika mengetikan value, sehingga prefix akan hilang
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(pickFile?.name ?? 'No File Selected'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: textFormCheck() ? () {} : null,
                      style: textFormCheck()
                          ? ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6750A4))
                          : ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                      child: Text(
                        isUpdateContact == true ? 'Update' : 'Submit',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: List.generate(
                            daftarKontak.length,
                            (index) => ListTile(
                                  leading: CircleAvatar(
                                    child: Text(daftarKontak[index].name[0]),
                                  ),
                                  title: Text(daftarKontak[index].name),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(daftarKontak[index].nomor),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        width: 60,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: daftarKontak[index].warna),
                                      ),
                                      Text(
                                        daftarKontak[index].fileDipilih?.name ??
                                            'No File Selected',
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                  trailing: Wrap(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            onEdit(index);
                                          },
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {
                                            onDelete(index);
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                  ),
                                ))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}