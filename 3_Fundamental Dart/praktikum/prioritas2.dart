//Variabel untuk Soal prioritas 2
String namaDepan = "Al";
String namaTengah = "Akbar";
String namaBelakang = "Baihaqi";
double phi = 3.14;

void main(List<String> args) {
  print("Soal prioritas 2");
  print("Nama saya adalah $namaDepan $namaTengah $namaBelakang");
  volumeTabung(2.43,6.7);
}

void volumeTabung(double rTabung, double hTabung) {
  double volumeTabungSil = phi * rTabung * rTabung * hTabung;

  print("Volume dari tabung adlaah $volumeTabungSil");
}
