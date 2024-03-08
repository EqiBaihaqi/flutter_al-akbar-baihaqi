void main(List<String> args) {
  // Membuat objek untuk class KPK
  var operation = KelipatanPersekutuanTerkecil();
  print(operation.rumus());
}

//Membuat abstract class yang akan memiliki fungsi kosong
abstract class Matematika {
  rumus();
}

//melakukan implements ke class matematika
class KelipatanPersekutuanTerkecil implements Matematika {
  @override
  rumus() {
    return 'Ini adalah rumus KPK';
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  @override
  rumus() {
    return 'Ini adalah rumus FPB';
  }
}
