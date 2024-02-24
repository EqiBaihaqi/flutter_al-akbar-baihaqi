//Soal eskplorasi

void main(List<String> args) {
  String kata = 'kasur rusak';
  print('apakah kata "$kata" adalah sebuah palindrome ?');
  if (isPalindrome(kata)) {
    print('Ya benar');
  } else {
    print('Tidak salah');
  }
}

bool isPalindrome(String word) {
  // Menggunakan metode List untuk membalik string
  String reversedWord = word.split('').reversed.join('');

  // Mengecek apakah kata asli dan kata yang dibalik sama
  return word == reversedWord;
}
