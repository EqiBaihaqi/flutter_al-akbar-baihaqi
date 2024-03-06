void main(List<String> args) {
  //membuat object
  var cal = Calculator(bilangan1: 5, bilangan2: 3);
  print(
      'Hasil penjumlahan : ${cal.penjumlahan()}\nHasil pengurangan : ${cal.pengurangan()}\nHasil perkalian : ${cal.perkalian()}\nHasil pembagian : ${cal.pembagian()}');

  //SOAL NOMOR 2

  //Membuat object untuk course
  var kelas1 = Course('Bahasa Jepang', 'Mempelajari bahasa jepang advance');
  var kelas2 = Course('Rock Music', 'Belajar music rock');
  var kelas3 = Course('Flutter', 'Memperdalam ilmu Flutter');

  //Membuat object untuk student
  var murid = Student('Akbar', 'A');
  //cek course
  murid.viewCourses();
  //Tambah course
  murid.tambahCourse(kelas1);
  murid.tambahCourse(kelas2);
  murid.tambahCourse(kelas3);
  murid.viewCourses();
  //Remove Course
  murid.removeCourse(kelas2);
  murid.viewCourses();
}

//CLASSES UNTUK SOAL NOMOR 1
class Calculator {
  final int bilangan1;
  final int bilangan2;

  Calculator({required this.bilangan1, required this.bilangan2});

  penjumlahan() {
    int hasil = bilangan1 + bilangan2;
    return hasil;
  }

  pengurangan() {
    int hasil = bilangan1 - bilangan2;
    return hasil;
  }

  perkalian() {
    int hasil = bilangan1 * bilangan2;
    return hasil;
  }

  pembagian() {
    //Melakukan konversi variable bilangan1 dan bilangan2 ke double agar hasil pembagian lebih akurat
    double bil1 = bilangan1.toDouble();
    double bil2 = bilangan2.toDouble();
    double hasil = bil1 / bil2;
    return hasil;
  }
}

//CLASSES UNTUK SOAL NOMOR 2
class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  final String nama;
  final String kelas;
  List<Course> courses = []; //Membuat list dengan tipe class Course

  Student(this.nama, this.kelas);

  //method tambah course dengan parameter bertipe Course
  tambahCourse(Course courseTambah) {
    courses.add(courseTambah);
    print('Course ${courseTambah.judul} berhasil ditambahkan');
  }

  //method remove course
  removeCourse(Course courseKurang) {
    courses.remove(courseKurang);
    print('Course ${courseKurang.judul} berhasil dihapus');
  }
  //method view all course

  viewCourses() {
    //Melakukan pengecekan apakah list courses memiliki data/isi
    if (courses.isEmpty) {
      print('Tidak ada course yang terdaftar');
    } else {
      print('Daftar course yang terdaftar :');
      for (var element in courses) {
        print(
            'Judul : ${element.judul}\nDeskripsi : ${element.deskripsi}\n'); //Menampilkan judul dan deskripsi dengan for in
      }
    }
  }
}
