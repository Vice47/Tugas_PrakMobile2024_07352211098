// Enum untuk jenis makanan
enum JenisMakanan {
  Appetizer,
  MainCourse,
  Dessert,
}

mixin Diskon {
  double hitungDiskon(double harga, double persenDiskon) {
    return harga - (harga * persenDiskon / 100);
  }
}

abstract class Restoran {
  String namaRestoran;
  String lokasi;

  Restoran(this.namaRestoran, this.lokasi);

  void infoRestoran();
}

class ItemMakanan {
  String nama;
  double harga;
  JenisMakanan jenis;

  ItemMakanan(this.nama, this.harga, this.jenis);

  void tampilkanInfo() {
    print("Nama Makanan: $nama, Harga: Rp $harga, Jenis: $jenis");
  }
}

class Menu extends Restoran with Diskon {
  List<ItemMakanan> daftarMakanan;

  Menu(String namaRestoran, String lokasi, {required this.daftarMakanan})
      : super(namaRestoran, lokasi);

  void infoRestoran() {
    print("Restoran: $namaRestoran, Lokasi: $lokasi");
  }

  void tambahMakanan(String nama, double harga, JenisMakanan jenis) {
    daftarMakanan.add(ItemMakanan(nama, harga, jenis));
  }

  void tampilkanMenu() {
    for (var makanan in daftarMakanan) {
      makanan.tampilkanInfo();
    }
  }

  double totalHarga() {
    return daftarMakanan.fold(0, (sum, item) => sum + item.harga);
  }

  double totalHargaDenganDiskon(double persenDiskon) {
    double total = totalHarga();
    return hitungDiskon(total, persenDiskon);
  }
}

void main() {
  var m1 = ItemMakanan("Nasi Goreng", 25000, JenisMakanan.MainCourse);
  var m2 = ItemMakanan("Es Cokelat", 15000, JenisMakanan.Dessert);
  var m3 = ItemMakanan("Bakso Mini", 4000, JenisMakanan.Appetizer);

  var menu = Menu(
    "Restoran Vikzer",
    "Jl. Merdeka No.447",
    daftarMakanan: [m1, m2, m3],
  );

  menu.infoRestoran();

  print("\nDaftar Menu:");
  menu.tampilkanMenu();

  print("\nTotal Harga: Rp ${menu.totalHarga()}");
  print("Total Harga setelah Diskon: Rp ${menu.totalHargaDenganDiskon(10)}");
}
