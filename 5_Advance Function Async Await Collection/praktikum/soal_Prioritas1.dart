void main(List<String> args) async {
  //Membuat variable yang diperlukan 
  var data1 = [3, 4, 7, 10, 2];
  int pengali = 3;
  //Memanggil function Future
  await Pengali(data1, pengali);
  //Membuat Print di bawah function Future Async Await
  print('Test mana yang duluan');
}

Future<void> Pengali(List data, int pengali) async {
  //function yang akan direturn nantinya
  var hasilList = [];
  //mmebuat perulanag for in untuk mengisi variabel hasilList
  for (var element in data) {
    var hasilKali = element * pengali;
    hasilList.add(hasilKali);
  }
  //Membuat Future delayed selama 1 detik
  Future.delayed(Duration(seconds: 1), () {
    print(hasilList);
  });
}
