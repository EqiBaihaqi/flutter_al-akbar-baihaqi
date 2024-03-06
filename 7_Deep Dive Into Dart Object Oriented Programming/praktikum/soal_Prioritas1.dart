void main(List<String> args) {
  //Membuat object Balok
  var balok1 = Balok(3, 4, 2);
  print(balok1.volume());
  //Membuat object Kubus
  var kubus1 = Kubus(5);
  print(kubus1.volume());
}

//Membuat upper-class BangunRuang
class BangunRuang {
  int panjang = 0;
  int tinggi = 0;
  int lebar = 0;
  BangunRuang(this.panjang, this.lebar, this.tinggi);
  //membuat method menghitung volume
  volume() {
    int hasil = panjang * lebar * tinggi;
    return hasil;
  }
}

//Membuat class Balok
class Balok extends BangunRuang {
  Balok(super.panjang, super.lebar, super.tinggi);

  //Override method yang ada pada BangunRuang
  @override
  volume() {
    int hasil = panjang * lebar * tinggi;
    return hasil;
  }
}

//Membuat class kubus
class Kubus extends BangunRuang {
  int sisi;
  //Menambah constructor untuk mengisi sisi
  Kubus(this.sisi) : super(sisi, sisi, sisi);
  //Mengubah method dari override sesuai dengan rumus volume kubus
  @override
  volume() {
    int hasil = sisi * sisi * sisi;
    return hasil;
  }
}
