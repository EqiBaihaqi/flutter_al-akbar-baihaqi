void main() {
  // Ganti nilai berikut dengan angka yang ingin Anda cek
  int angka = 11;
  if (isPrime(angka)) {
    print('$angka adalah bilangan prima');
  } else {
    print('$angka bukan bilangan prima');
  }
}

bool isPrime(int number) {
  if (number < 2) {
    return false; // Bilangan kurang dari 2 bukan bilangan prima
  }

  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false; // Jika ada pembagi selain 1 dan angka itu sendiri
    }
  }

  return true; // Jika tidak ada pembagi selain 1 dan angka itu sendiri
}
