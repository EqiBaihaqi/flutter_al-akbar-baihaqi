//Soal eskplorasi

void main(List<String> args) {
  //soal nomor 1
  String kata = 'kasur rusak';
  print('apakah kata "$kata" adalah sebuah palindrome ?');
  //menentukan kondisi if else
  if (isPalindrome(kata)) {
    print('Ya benar');
  } else {
    print('Tidak salah');
  }

  //soal nomor 2
  int bilangan = 14;
  print("Faktor dari bilangan $bilangan adalah: ");
  faktor(bilangan);
}

//Pengecekan palindrome
bool isPalindrome(String word) {
  // Menggunakan metode List untuk membalik string
  String reversedWord = word.split('').reversed.join('');

  // Mengecek apakah kata asli dan kata yang dibalik sama
  return word == reversedWord;
}

//Rumus untuk menentukan faktor dari sebuah bilangan
void faktor(int number) {
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      print(i);
    }
  }
}
