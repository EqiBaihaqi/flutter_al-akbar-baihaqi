import 'package:assets_dialogbottomsheet_navgator/contact/list_contact.dart';
import 'package:assets_dialogbottomsheet_navgator/model/list_contact_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  String? _username;
  String? get username => _username;

  String? _errorUsername;
  String? get errorUsername => _errorUsername;

  bool _isValidUsername = false;
  bool get isValidUsername => _isValidUsername;

  void validateUsername(
    String value,
  ) {
    if (value.isEmpty) {
      _errorUsername = 'Nama masih kosong';
      //Membuat validasi bahwa isi dari form nama harus hanya berupa huruf dan spacebar
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      _errorUsername = 'Nama harus berupa huruf saja';
      // Membuat kondisi jika huruf awal tidak mengandung huruf kapital
    } else if (!value.substring(0, 1).contains(RegExp(r'[A-Z]'))) {
      _errorUsername = 'Nama harus diawali huruf kapital';
    } else if (value.length <= 2) {
      _errorUsername = 'Nama harus lebih dari 2 huruf';
    } else {
      _errorUsername = null;
      _username = value;
      _isValidUsername = true;
    }
    notifyListeners();
  }

  String? _nomor;
  String? get Nomor => _nomor;

  String? _errorNomor;
  String? get errorNomor => _errorNomor;

  bool _isValidNomor = false;
  bool get isValidNomor => _isValidNomor;

  void validateNomor(
    String value,
  ) {
    if (value.isEmpty) {
      _errorNomor = 'Nomor masih kosong';
      // Kondisi jika awal nomor bukan 0
    } else if (value[0] != '0') {
      _errorNomor = 'Nomor harus diawali dengan angka 0';
      //Jika length < 8 dan > 15 maka akan memunculkan error
    } else if (value.length < 8 || value.length > 15) {
      _errorNomor = 'Nomor HP setidaknya terdiri dari 8-15 digit';
    } else {
      _errorNomor = null;
      _nomor = value;
      _isValidNomor = true;
    }
    notifyListeners();
  }

  bool validationForm() {
    if (_isValidNomor == true && _isValidUsername == true) {
      return true;
    } else
      return false;
    
  }

  Color? _pickColor;
  Color? get pickColor => _pickColor;

  Color? _pickedColor;
  Color? get pickedColor => _pickedColor;

  void changeColor(Color value) {
    _pickColor = value;
    notifyListeners();
  }

  void insertColor() {
    _pickedColor = _pickColor;
    notifyListeners();
  }

  DateTime? _pilihDate;
  DateTime? get pilihDate => _pilihDate;

  void getDate(DateTime? value) {
    if (value != null) {
      _pilihDate = value;
    }
    notifyListeners();
  }

  PlatformFile? _pickedFile;
  PlatformFile? get pickedFile => _pickedFile;

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      _pickedFile = result.files.first;
    }
    notifyListeners();
  }

  void showFileName() {
    _pickedFile?.name ?? 'No File Selected';
    notifyListeners();
  }

  List<ContactModel> _listContact = [];
  List<ContactModel> get listContact => _listContact;

  void addToList() {
    _listContact.add(ContactModel(
        username: _username!,
        nomor: _nomor!,
        tanggal: _pilihDate!,
        warna: _pickedColor!,
        filePilih: _pickedFile!));
    notifyListeners();
  }

  void deleteData(int index) {
    _listContact.remove(_listContact[index]);
    notifyListeners();
  }
}
