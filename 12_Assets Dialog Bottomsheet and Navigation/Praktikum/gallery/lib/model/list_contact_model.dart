import 'dart:ui';

import 'package:file_picker/file_picker.dart';

class ContactModel {
  final String username;
  final String nomor;
  final DateTime tanggal;
  final Color warna;
  final PlatformFile filePilih;

  ContactModel(
      {required this.username,
      required this.nomor,
      required this.tanggal,
      required this.warna,
      required this.filePilih});
}
