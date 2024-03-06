void main(List<String> args) {
  //Membuat beberapa object detail buku yang nantinya akan ditambahkan ke list dari DataBuku
  var buku1 = DetailBuku(01, 'Sherlock Holmes', 'Rudi', '50.000', 'Action');
  var buku2 = DetailBuku(02, 'Lemari Biru', 'Joko', '20.000', 'Drama');
  var buku3 = DetailBuku(03, 'One Day', 'Santi', '30.000', 'Romance');

  var dataBuku = DataBuku();
  //Cek viewListBook sebelum ada data yang ditambahkan
  dataBuku.viewListBook();
  //Melakukan Tambah buku
  dataBuku.tambahBuku(buku1);
  dataBuku.tambahBuku(buku2);
  dataBuku.viewListBook();
  //Menghapus salah 1 buku dari daftar
  dataBuku.hapusBuku(buku2);
  dataBuku.viewListBook();
}

//Membuat class untuk menampung detail buku
class DetailBuku {
  int id;
  String judul;
  String penerbit;
  String harga;
  String kategori;
  DetailBuku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

//Membuat class Data buku yang berisi method
class DataBuku {
  List<DetailBuku> listBook = [];

  tambahBuku(DetailBuku buku) {
    listBook.add(buku);
    print("Buku ${buku.judul} berhasil ditambahkan");
  }

  hapusBuku(DetailBuku buku) {
    listBook.remove(buku);
    print('Buku ${buku.judul} berhasil dihapus');
  }

  viewListBook() {
    if (listBook.isEmpty) {
      print('Maaf tidak ada daftar buku');
    } else {
      for (var element in listBook) {
        print(
            'ID: ${element.id}\nJudul: ${element.judul}\nPenerbit: ${element.penerbit}\nHarga: ${element.harga}\nKategori: ${element.kategori}\n');
      }
    }
  }
}
