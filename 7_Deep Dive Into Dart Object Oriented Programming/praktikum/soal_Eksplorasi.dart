void main(List<String> args) {
  // Object circle
  var c1 = Circle(5);
  print('Luas dari lingkarang adalah ${c1.luas()}');
  print('Keliling dari lingkaran adalah ${c1.keliling()}');

  //Object Square
  var kotak1 = Square(2);
  print('Luas dari persegi adalah ${kotak1.luas()}');
  print('Keliling dari persegi adalah ${kotak1.keliling()}');

  //Object Rectangle
  var persegiPanjang = Rectangle(5, 7);
  print('Luas persegi panjang adalah ${persegiPanjang.luas()}');
  print('Keliling persegi panjang adalah ${persegiPanjang.keliling()}');
}

// Membuat abstract class sebagai interface
abstract class Shape {
  luas();
  keliling();
}

class Circle implements Shape {
  double r;
  double phi = 3.14;
  double hasil = 0;
  Circle(this.r);
  @override
  luas() {
    hasil = phi * r * r;
    return hasil;
  }

  @override
  keliling() {
    hasil = 2 * phi * r;
    return hasil;
  }
}

class Square implements Shape {
  int hasil = 0;
  int sisi;
  Square(this.sisi);
  @override
  luas() {
    hasil = sisi * sisi;
    return hasil;
  }

  @override
  keliling() {
    hasil = 4 * sisi;
    return hasil;
  }
}

class Rectangle implements Shape {
  int panjang;
  int lebar;
  int hasil = 0;

  Rectangle(this.panjang, this.lebar);
  @override
  luas() {
    hasil = panjang * lebar;
    return hasil;
  }

  @override
  keliling() {
    hasil = 2 * panjang + 2 * lebar;
    return hasil;
  }
}
