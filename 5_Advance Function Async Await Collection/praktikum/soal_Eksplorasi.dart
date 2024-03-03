void main(List<String> args) {
  //MEMBUAT DATA LIST
  var data1 = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  var data2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];
  //MEMANGGIL FUNCTION SORT DATA
  print(sortData(data1));
  print(sortData(data2));

  //MEMBUAT VARIABLE UNTUK MENAMPUNG RETURN FUNCTIONN countFrequen
  Map frequency = countFrequen(data2);
  //Melakukan foreach untuk memunculkan key dan value dari frequency
  frequency.forEach((key, value) {
    print('$key : $value');
  });
}

//MEMBUAT FUNCTION UNTUK SORTING LIST DATA
Set sortData(List datas) {
  var sortedData = datas.toList().toSet();
  return sortedData;
}

//MENGHITUNG FREKUENSI ELEMENT
Map countFrequen(List datas) {
  Map countedData = {};
  for (var element in datas) {
    if (countedData.containsKey(element)) {
      countedData[element]++;   //Jika saat melakukan for in loop pada datas
    } else {                    //terdapat key (element) maka akan ditambah 1.
      countedData[element] = 1; //Jika pada perulangan tidak ditemukan lagi duplikat
    }                           //Makan hanya memiliki 1 value
  }
  return countedData;
}
