import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:form/model/daftar_kontak.dart';
import 'package:form/widget/text_form_custom.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  String? _errorName = '';
  String? _errorNomor = '';
  List<ListContact> daftarKontak = [];
  bool isUpdateContact = false;
  bool isPrefixActive =
      true; // Variable untuk membuat prefix hide ketika form diklik
  int _index = -1;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Contact'),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Column(
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
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldCustom(
                  controller: nameController,
                  keyboard: TextInputType.name,
                  labelText: 'Nama',
                  hint: 'Tolong Masukan Nama',
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
                  errorText: _errorName,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldCustom(
                  controller: nomorController,
                  isValidInput: true,
                  keyboard: TextInputType
                      .phone, //otomatis hanya dapat menginputkan nomor
                  labelText: 'Nomor',
                  prefix: isPrefixActive
                      ? '+62'
                      : '', 
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
                  errorText: _errorNomor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          onPressed: textFormCheck()
                              ? () {
                                  if (isUpdateContact == true) {
                                    //Perintah update
                                    daftarKontak[_index] = ListContact(
                                        nameController.text,
                                        nomorController.text);
                                    setState(() {});
                                    nameController.clear();
                                    nomorController.clear();
                                  } else {
                                    daftarKontak.add(ListContact(
                                        nameController.text,
                                        nomorController.text));
                                    setState(() {});

                                    nameController.clear();
                                    nomorController.clear();
                                  }
                                }
                              : null,
                          style: textFormCheck()
                              ? ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6750A4))
                              : ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey),
                          child: Text(
                            isUpdateContact == true ? 'Update' : 'Submit',
                            style: const TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          daftarKontak.length,
                          (index) => ListTile(
                                leading: CircleAvatar(
                                  child: Text(daftarKontak[index].name[0]),
                                ),
                                title: Text(daftarKontak[index].name),
                                subtitle: Text(daftarKontak[index].nomor),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          isUpdateContact = true;
                                          nameController.text =
                                              daftarKontak[index].name;
                                          nomorController.text =
                                              daftarKontak[index].nomor;
                                          _index = index;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          daftarKontak.remove(
                                            daftarKontak[index],
                                          );
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete)),
                                  ],
                                ),
                              ))),
                )
              ],
            ),
          )),
    );
  }
}
