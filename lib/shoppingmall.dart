import 'package:console_shoppingmall/product.dart';

class Shoppingmall {
  List<Product> items = [];
  List<Product> myitems = [];
  int allprice = 0;

  Shoppingmall() {
    items = [
      Product('셔츠', 45000),  // 셔츠, shirt
      Product('원피스', 30000),  // 원피스, dress
      Product('반팔티', 35000),  // 반팔티, sleeves
      Product('반바지', 38000),  // 반바지, shorts
      Product('양말', 5000),  // 양말, socks
      Product('socks', 2000),  // Window 테스트용
    ];
  }

  // [상품명] / [상품가격] 형태로 출력해주는 로직
  void showProducts() {
    for (int i = 0; i < items.length; i++) {
      print('${items[i].name} / ${items[i].price}원');
    }
  }

  // 장바구니에 상품과 가격을 추가하는 로직
  void addToCart(Product a, int times) {
    for (int i = 0; i < times; i++) {
      myitems.add(a);
      allprice += a.price;
    }
  }

  // 총 가격을 반환하는 함수
  int showTotal() {
    return allprice;
  }

  // 장바구니 비었는지 확인
  bool isEmptyMyItems(){
    if(myitems.isEmpty) {
      return true;
    }
    else{
      return false;
    }
  }

  // 장바구니 비우기
  void resetMyItems() {
    myitems.clear();
    allprice = 0;
  }
}
