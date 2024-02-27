void main(List<String> args) {
  int nilai = 20;
  checkNilai(nilai);

  //Membuat perulangan for
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}

//Membuat fungsi untuk mengecek nilai
void checkNilai(int nilai) {
  if (nilai > 70) {
    return print('Nilai Anda A');
  } else if (nilai > 40) {
    return print('Nilai Anda B');
  } else if (nilai > 0) {
    return print('Nilai Anda C');
  }
}
