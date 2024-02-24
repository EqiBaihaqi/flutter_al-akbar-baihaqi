//variable yang diperlukan
double phi = 3.14;
void main(List<String> args) {
  print("Soal Prioritas 1");
  kelPersegi(4);
  luasPersegi(4);
  kelPersegiPanjang(5, 4);
  luasPersegiPanjang(5, 4);
  kelilingLingkaran(5.12);
  luasLingkaran(5.12);
}

void kelPersegi(int sisi) {
  int keliling = 4 * sisi;

  print("Keliling dari persegi adalah $keliling");
}

void kelPersegiPanjang(int panjang, int lebar) {
  int keliling = 2 * panjang + 2 * lebar;

  print("Keliling dari persegi panjang adalah $keliling");
}

void luasPersegi(int sisi) {
  int luas = sisi * sisi;

  print("Luas dari persegi adalah $luas");
}

void luasPersegiPanjang(int panjang, int lebar) {
  int luas = panjang * lebar;

  print("Luas dari persegi panjang adalah $luas");
}

void kelilingLingkaran(double r) {
  double keliling = 2 * phi * r;

  print("Keliling dari lingkaran adalah $keliling");
}

void luasLingkaran(double r) {
  double luas = phi * r * r;

  print("Luas dari lingkaran adalah $luas");
}
