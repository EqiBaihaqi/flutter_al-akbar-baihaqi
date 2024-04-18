import 'dart:ui';

import 'package:file_picker/file_picker.dart';

class ListContact {
  final String name;
  final String nomor;
  final DateTime tanggal;
  final Color warna;
  final PlatformFile? fileDipilih;

  ListContact(
    this.name,
    this.nomor,
    this.tanggal,
    this.warna,
    this.fileDipilih,
  );
}
