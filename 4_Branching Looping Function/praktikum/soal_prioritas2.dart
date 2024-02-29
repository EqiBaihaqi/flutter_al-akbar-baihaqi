import 'dart:io';

void main() {
  triangleMaker();
  jamPasir();
  factorialChecker(40);
  luasLingkaran(5.21);
}

void triangleMaker() {
  //membuat segitiga dari bintang
  print('Membuat segitiga');
  for (var i = 1; i <= 8; i++) {
    for (var j = 1; j <= 15; j++) {
      if (j >= 9 - i && j <= 7 + i) {
        stdout.write('*');
      } else {
        stdout.write(" ");
      }
    }
    print(" ");
  }
}

void jamPasir() {
  //membuat jam pasir
  print('Jam Pasir');
  int i, j, k, n = 10;
  for (i = 0; i <= n - 1; i++) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= n - 1; k++) {
      stdout.write("0" + " ");
    }
    stdout.writeln("");
  }
  for (i = n - 1; i >= 0; i--) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= n - 1; k++) {
      stdout.write("0" + " ");
    }
    stdout.writeln("");
  }
}

void factorialChecker(int number) {
  print('Faktorial dari bilangan $number adalah :');
  for (int i = 1; i < number; i++) {
    if (number % i == 0) print(i);
  }
}

void luasLingkaran(double r) {
  double phi = 3.14;
  double luas = phi * r * r;
  print('\nPerhitungan Luas Lingkaran');
  print('Luas lingkaran adalah $luas');
}
