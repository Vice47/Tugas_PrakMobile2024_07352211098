class User {
  String name;
  int age;
  late List<Product> products;
  Role? role;

  User(this.name, this.age, this.role) {
    products = [];
  }
}

class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}

enum Role { Admin, Customer, Premium }

class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age, Role.Admin);

  void tambahProduk(Product product) {
    if (product.inStock) {
      products.add(product);
      print("\n===== INFO LAPORAN TAMBAH PRODUK =====");
      print('${product.productName} berhasil ditambahkan ke daftar produk.');
    } else {
      print(
          '${product.productName} tidak tersedia dalam stok dan tidak dapat ditambahkan.');
    }
  }

  void hapusProduk(Product product) {
    products.remove(product);
    print("\n===== INFO LAPORAN HAPUS PRODUK =====");
    print('${product.productName} berhasil dihapus dari daftar produk.');
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, Role.Customer);

  void lihatProduk() {
    print('\nDaftar Produk Tersedia:');
    for (var product in products) {
      print(
          '${product.productName} - Rp${product.price} - ${product.inStock ? "Tersedia" : "Habis"}');
    }
  }
}

class Premium extends User {
  Premium(String name, int age) : super(name, age, Role.Premium);
  Future<void> beliProduk(Product product) async {
    print('Melakukan pembelian produk ${product.productName}...');
    await Future.delayed(Duration(seconds: 2));
    if (product.inStock) {
      print(
          'Pembelian ${product.productName} berhasil! Terima kasih sudah berbelanja.');
    } else {
      print('Maaf, ${product.productName} tidak tersedia.');
    }
  }
}

Future<void> fetchProductDetails() async {
  print('Mengambil detail produk...');
  await Future.delayed(Duration(seconds: 2));
  print('Detail produk berhasil diambil.');
}

Future<void> main() async {
  AdminUser a = AdminUser('Vaiz', 20);
  CustomerUser c = CustomerUser('Reiki', 21);
  Premium p = Premium("Byadun", 19);

  Product product1 = Product('Acer Aspire 5', 8000000.0, false);
  Product product2 = Product('Samsung S20', 12000000.0, false);
  Product product3 = Product('Infinix Note 40', 6000000.0, true);

  try {
    a.tambahProduk(product1);
    a.hapusProduk(product2);
    a.tambahProduk(product3);
  } on Exception catch (e) {
    print('Kesalahan: $e');
  }

  print("");
  await p.beliProduk(product1);
  await p.beliProduk(product2);
  await p.beliProduk(product3);
  print("");
  c.lihatProduk();
  Map<String, Product> productMap = {
    product1.productName: product1,
    product2.productName: product2,
    product3.productName: product3,
  };

  fetchProductDetails();

  productMap.forEach((key, value) {
    print(
        '${key} - Harga: Rp${value.price} - Stok: ${value.inStock ? "Tersedia" : "Habis"}');
  });

  Set<Product> productSet = {product1, product2, product3};
  print('\nDaftar Produk dari Set:');
  productSet.forEach((product) {
    print(
        '${product.productName} - Harga: Rp${product.price} - Stok: ${product.inStock ? "Tersedia" : "Habis"}');
  });
}
