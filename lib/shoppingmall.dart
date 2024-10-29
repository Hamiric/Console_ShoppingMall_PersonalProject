import 'package:console_shoppingmall/product.dart';

class Shoppingmall {
  List<Product> items = [];
  List<Product> my_items = [];
  int allprice = 0;

  Shoppingmall() {
    items = [
      Product('셔츠', 45000),
      Product('원피스', 30000),
      Product('반팔티', 35000),
      Product('반바지', 38000),
      Product('양말', 5000),
      Product('sky', 2000)
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
