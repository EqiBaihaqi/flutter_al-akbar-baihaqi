import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:form/const/date_format_constant.dart';
import 'package:form/login_page.dart';
import 'package:form/model/list_contact_model.dart';
import 'package:form/utils/shared_pref.dart';
import 'package:form/widget/color_picker_widget.dart';
import 'package:form/widget/file_picker_widget.dart';

import 'package:form/widget/select_date_widget.dart';
import 'package:form/widget/text_form_custom.dart';

class Textform extends StatefulWidget {
  const Textform({super.key});

  @override
  State<Textform> createState() => _TextformState();
}

class _TextformState extends State<Textform> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  String? _errorName = '';
  String? _errorNomor = '';
  List<ListContact> daftarKontak = [];
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

  //Variable untuk memanggil Username Shared Pref
  String? username;

  //Membuat function untuk memanggil usernam shared pref
  void getUSername() async {
    username = await SharedPrefLogin.getUsername();
    setState(() {});
  }

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
  void initState() {
    getUSername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Halo $username !'), actions: [
          IconButton(
              onPressed: () {
                SharedPrefLogin.removeAllKey();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout))
        ]),
        body: SingleChildScrollView(
          child: Center(
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
                    prefix: isPrefixActive ? '+62' : '',
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
                  SelectDateWidget(
                      pilihDate: pilihDate,
                      dateAwal: dateAwal,
                      dateAkhir: dateAkhir,
                      onchanged: (newDate) {
                        pilihDate = newDate;
                        setState(() {});
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(DateFormatConstant.getDayDateHours(pilihDate)),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ColorPickerWidget(
                          currentColor: currentColor,
                          pickColor: pickColor,
                          onchanged: (newColor) {
                            pickColor = newColor;
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FilePickerWidget(
                        pickedFile: pickFile,
                        onchanged: (newFile) {
                          pickFile = newFile;
                          setState(() {});
                        },
                      ),
                    ],
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
                        onPressed: textFormCheck()
                            ? () {
                                if (isUpdateContact == true) {
                                  //Perintah update
                                  daftarKontak[_index] = ListContact(
                                      nameController.text,
                                      nomorController.text,
                                      pilihDate,
                                      pickColor,
                                      pickFile!);
                                  setState(() {});
                                  nameController.clear();
                                  nomorController.clear();
                                  pilihDate = DateTime.now();
                                } else {
                                  daftarKontak.add(ListContact(
                                      nameController.text,
                                      nomorController.text,
                                      pilihDate,
                                      pickColor,
                                      pickFile!));
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
                                        Text(
                                          DateFormatConstant.getDayDateHours(
                                              daftarKontak[index].tanggal),
                                          maxLines: 1,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          width: 60,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: daftarKontak[index].warna),
                                        ),
                                        Text(
                                          daftarKontak[index]
                                                  .fileDipilih
                                                  ?.name ??
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
          ),
        ));
  }
}
