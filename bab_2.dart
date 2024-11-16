class ProdukDigital {
  String namaProduk;
  double harga;
  String kategori;
  int produkTerjual;

  ProdukDigital(this.namaProduk, this.harga, this.kategori, this.produkTerjual);

  void terapkanDiskon() {
    if (kategori == 'NetworkAutomation') {
      if (produkTerjual > 50) {
        harga -= harga * (15 / 100);
        print('Diskon sebesar 15% diterapkan. Harga baru: $harga');
        print("Harga Total Anda: $harga");
      } else {
        print("Harga Total anda: $harga");
      }
    } else {
      print('Diskon hanya berlaku untuk kategori NetworkAutomation.');
      print("Harga Total Anda: $harga");
    }
  }
}

abstract class Karyawan {
  String nama;
  int umur;

  Karyawan(this.nama, this.umur);

  void bekerja();
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, int umur) : super(nama, umur);

  @override
  void bekerja() {
    print('$nama adalah karyawan tetap, bekerja penuh waktu.');
  }
}

class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String nama, int umur) : super(nama, umur);

  @override
  void bekerja() {
    print('$nama adalah karyawan kontrak, bekerja sesuai kontrak proyek.');
  }
}

class KaryawanBaru {
  String nama;
  int umur;
  String peran;

  KaryawanBaru(this.nama, {required this.umur, required this.peran});
}

mixin Kinerja {
  int produktivitas = 0;

  void tingkatkanProduktivitas() {
    produktivitas += 1;
    print('Produktivitas naik: $produktivitas');
  }
}

class Manager extends Karyawan with Kinerja {
  Manager(String nama, int umur) : super(nama, umur);

  void bekerja() {
    print('$nama bekerja sebagai Manager.');
  }

  void cekProduktivitas() {
    if (produktivitas < 85) {
      print('$nama produktivitas kurang dari 85, perlu ditingkatkan.');
    } else {
      print('$nama produktivitas sudah memenuhi standar.');
    }
  }
}

enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

class Proyek {
  FaseProyek faseSaatIni;

  Proyek(this.faseSaatIni);

  void transisiKeFase(FaseProyek faseTujuan) {
    if (faseSaatIni == FaseProyek.Perencanaan &&
        faseTujuan == FaseProyek.Pengembangan) {
      faseSaatIni = faseTujuan;
      print('Proyek telah bertransisi ke fase Pengembangan.');
    } else if (faseSaatIni == FaseProyek.Pengembangan &&
        faseTujuan == FaseProyek.Evaluasi) {
      faseSaatIni = faseTujuan;
      print('Proyek telah bertransisi ke fase Evaluasi.');
    } else {
      print('Transisi ke fase $faseTujuan tidak valid dari fase $faseSaatIni.');
    }
  }
}

class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  final int batasKaryawanAktif = 20;

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < batasKaryawanAktif) {
      karyawanAktif.add(karyawan);
      print('Karyawan ${karyawan.nama} ditambahkan ke daftar karyawan aktif.');
    } else {
      print(
          'Tidak dapat menambahkan karyawan ${karyawan.nama}. Batas karyawan aktif tercapai.');
    }
  }

  void karyawanResign(Karyawan karyawan) {
    if (karyawanAktif.contains(karyawan)) {
      karyawanAktif.remove(karyawan);
      karyawanNonAktif.add(karyawan);
      print(
          'Karyawan ${karyawan.nama} telah resign dan statusnya menjadi non-aktif.');
    } else {
      print(
          'Karyawan ${karyawan.nama} tidak ditemukan dalam daftar karyawan aktif.');
    }
  }

  void tampilkanKaryawanAktif() {
    print("Daftar Karyawan Aktif:");
    for (var k in karyawanAktif) {
      print("- ${k.nama}");
    }
  }
}

void main() {
  var produk1 = ProdukDigital(
      'Otomasi Perangkat Lunak', 1200000, 'NetworkAutomation', 56);
  var produk2 =
      ProdukDigital('Pembangunan Website', 50000000, 'WebDevelopment', 20);

  produk1.terapkanDiskon();
  produk2.terapkanDiskon();
  print("");

  var karyawanTetap = KaryawanTetap('Vaiz', 20);
  var karyawanKontrak = KaryawanKontrak('Vikz', 24);
  print("");

  var manager = Manager('Taufik', 30);
  manager.cekProduktivitas();
  manager.tingkatkanProduktivitas();
  manager.cekProduktivitas();
  print("");

  var karyawanBaru = KaryawanBaru('Alfarz', umur: 23, peran: 'Developer');
  print(
      'Nama: ${karyawanBaru.nama}, Umur: ${karyawanBaru.umur}, Peran: ${karyawanBaru.peran}');

  var proyek = Proyek(FaseProyek.Perencanaan);
  proyek.transisiKeFase(FaseProyek.Pengembangan);
  proyek.transisiKeFase(FaseProyek.Evaluasi);

  var perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawanTetap);
  perusahaan.tambahKaryawan(karyawanKontrak);
  perusahaan.tambahKaryawan(manager);

  perusahaan.tampilkanKaryawanAktif();

  perusahaan.karyawanResign(karyawanKontrak);
  perusahaan.tampilkanKaryawanAktif();
}
