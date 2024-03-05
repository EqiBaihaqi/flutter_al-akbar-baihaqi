void main(List<String> args) {
  var m1 = Mobil();
  m1.kapasitas = 50;
  m1.muatan = [10, 20, 10];
  m1.berat = 10;
  print(m1.tambahMuatan());
}

//Membuat sebuah class Hewan yang memiliki property Berat
class Hewan {
  int? berat;

  Hewan() {
    berat = 0;
  }
}

//Membuat class Mobil yang berisi property dan method dan extend class Hewan agar bisa mengakses
//variabel berat pada class Hewan
class Mobil extends Hewan {
  int? kapasitas;
  List? muatan;
//constuctor dari Mobil
  Mobil() {
    kapasitas = 0;
    muatan = [];
  }

  tambahMuatan() {
    //Membuat kondisi diamana jika kapasitas lebih dari total muatan, maka
    //data Hewan akan ditambahklan ke dalam list muatan
    if (kapasitas! >
        muatan!.fold(0, (previousValue, element) => previousValue + element)) {
      muatan?.add(berat);
    //Melakuakn return pada list muatan yang telah ditambahkan data baru
      return muatan;
    //Melakukan return muatan tanpa adanya penambahan data baru  
    } else {
      return muatan;
    }
  }
}
