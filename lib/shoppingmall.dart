import 'package:console_shoppingmall/product.dart';

class Shoppingmall {
  List<Product> items = [];
  List<Product> my_items = [];
  int allprice = 0;

  Shoppingmall() {
    items = [
      Product('셔츠', 45000),  // 셔츠, shirt
      Product('원피스', 30000),  // 원피스, dress
      Product('반팔티', 35000),  // 반팔티, sleeves
      Product('반바지', 38000),  // 반바지, shorts
      Product('양말', 5000),  // 양말, socks
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
