import 'dart:async';

void main(List<String> args) async {
//SOAL NOMOR 1
//MEMBUAT LIST DI DALAM LIST
  dynamic lists = [
    ['Absen', 3],
    ['Nama', 'Eqi'],
    ['Umur', 21]
  ];
//MEMBUAT MAP DARI LIST DI ATAS
  Map<String, dynamic> resultMap = ConvertToMap(lists);
  print(resultMap);

//MEMANGGIL FUNCTION UNTUK MENCARI BILANGAN FAKTORIAL (SOAL NOMOR 3)
  int angka = 5;
  PencariFaktorial(angka);

// SOAL NOMOR 2
//MEMBUAT LIST UNTUK DIHITUNG RATA-RATA
  var banyakAngka = [7, 5, 3, 5, 2, 1];
//MEMANGGIL FUNCTION MENGHITUNG RATA-RATA
  print(RataRata(banyakAngka));
}

//MEMBUAT FUNGSI UNTUK CONVERT LIST KE MAP (SOAL NOMOR 1)
Map<String, dynamic> ConvertToMap(List<List<dynamic>> sebuahList) {
  Map<String, dynamic> mapBaru = {};

  for (var element in sebuahList) {
    if (element.length == 2 && element[0] is String) {
      mapBaru[element[0]] = element[1];
    }
  }
  return mapBaru;
}

//MEMBUAT FUNGSI UNTUK MENGHITUNG RATA-RATA (SOAL NOMOR 2)
int RataRata(List<int> sebuahList) {
  int total =
      sebuahList.fold(0, (previousValue, element) => previousValue + element);

  double rataRa = total / sebuahList.length;

  //MEMBULATKAN HASIL RATA-RATA (SOAL NOMOR 2)
  int pembulatan = rataRa.round();
  return pembulatan;
}

//MEMBUAT FUNGSI ASYNC MENCARI BILANGAKN FAKTORIAL (SOAL NOMOR 3)
Future<void> PencariFaktorial(int angka) async {
  await Future.delayed(Duration(seconds: 3));
  int hasilfaktorial = 1;
  for (var i = 1; i <= angka; i++) {
    hasilfaktorial *= i;
  }
  print('Faktorial dari $angka adalah :');
  print(hasilfaktorial);
}
