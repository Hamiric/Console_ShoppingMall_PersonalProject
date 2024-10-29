import 'package:console_shoppingmall/product.dart';

class Shoppingmall {
  List<Product> items = [];
  List<Product> my_items = [];
  int allprice = 0;

  Shoppingmall() {
    items = [
      Product('shirt', 45000),  // 셔츠
      Product('dress', 30000),  // 원피스
      Product('sleeves', 35000),  // 반팔티
      Product('shorts', 38000),  // 반바지
      Product('socks', 5000),  // 양말
      // Product('sky', 2000)
    ];
  }

  void showProducts() {
    for (int i = 0; i < items.length; i++) {
      print(items[i].name + ' / ' + items[i].price.toString() + '원\n');
    }
  }

  void addToCart(Product a, int times) {
    for (int i = 0; i < times; i++) {
      my_items.add(a);
      allprice += a.price;
    }
  }

  int showTotal() {
    return allprice;
  }
}
