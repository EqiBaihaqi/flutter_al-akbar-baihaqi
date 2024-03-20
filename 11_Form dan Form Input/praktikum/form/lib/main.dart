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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  String? _errorName = '';
  String? _errorNomor = '';
  List<ListContact> daftarKontak = [];
  bool isUpdateContact = false;

  bool textFormCheck() {
    return _errorName == null &&
        _errorNomor == null &&
        _nameController.text != '' &&
        _nomorController.text != '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nomorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  controller: _nameController,
                  keyboard: TextInputType.name,
                  labelText: 'Nama',
                  hint: 'Tolong Masukan Nama',
                  onChanged: (value) {
                    _nameController.text = value;
                    if (_nameController.text.isEmpty) {
                      _errorName = 'Nama masih kosong';
                    } else if (_nameController.text.length <= 2) {
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
                  controller: _nomorController,
                  isValidInput: true,
                  keyboard: TextInputType.phone,
                  labelText: 'Nomor',
                  prefix: '+62',
                  onChanged: (value) {
                    _nomorController.text = value;
                    if (_nomorController.text.isEmpty) {
                      _errorNomor = 'Nomor masih kosong';
                    } else if (_nomorController.text.length <= 6) {
                      _errorNomor = 'Nomor HP setidaknya 8 angka';
                    } else {
                      _errorNomor = null;
                    }
                    setState(() {});
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
                                  }
                                  daftarKontak.add(ListContact(
                                      _nameController.text,
                                      _nomorController.text));
                                  setState(() {});
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
                                          isUpdateContact == true;

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
