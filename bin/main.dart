import 'dart:convert';
import 'dart:io';

import 'package:console_shoppingmall/product.dart';
import 'package:console_shoppingmall/shoppingmall.dart';

void main() {
  Shoppingmall myshoppingmall = Shoppingmall();

  while (true) {
    int a = startshopping();

    if (a == 1) {
      // 상품 목록 출력
      myshoppingmall.showProducts();
    } else if (a == 2) {
      // 장바구니 담기
      insert_product(myshoppingmall);
    } else if (a == 3) {
      showshopping(myshoppingmall);
    } else if (a == 4) {
      if (check_exit()) {
        print('이용해 주셔서 감사합니다 ~ 안녕히 계세요 !');
        break;
      } else {
        print('종료하지 않습니다.\n');
      }
    } else if (a == 6) {
      resetshopping(myshoppingmall);
    }
  }
}

int startshopping() {
  print(
      '--------------------------------------------------------------------------------------------------\n');
  print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 비우기\n');
  print(
      '--------------------------------------------------------------------------------------------------\n');

  while (true) {
    String? input = stdin.readLineSync();
    if (input == '1') {
      return 1;
    } else if (input == '2') {
      return 2;
    } else if (input == '3') {
      return 3;
    } else if (input == '4') {
      return 4;
    } else if (input == '6') {
      return 6;
    } else {
      print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ...\n');
    }
  }
}

void insert_product(Shoppingmall shop) {
  late Product a;
  late int times;

  print('상품 이름을 입력해 주세요!');
  String? inputName = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
  print('상품 개수를 입력해 주세요!');
  String? inputCount = stdin.readLineSync();

  print(inputName);

  bool aFlag = false;
  for (int i = 0; i < shop.items.length; i++) {
    if (inputName == shop.items[i].name) {
      a = shop.items[i];
      aFlag = true;
      break;
    }
  }

  if (aFlag) {
    if (isInt(inputCount)) {
      times = int.parse(inputCount!);
      if (times < 1) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요 !\n');
        return;
      }
    } else {
      print('개수 입력값이 올바르지 않아요!\n');
      return;
    }
  } else {
    print('상품이름 입력값이 올바르지 않아요!\n');
    return;
  }

  shop.addToCart(a, times);
  print('장바구니에 상품이 담겼어요 !\n');
}

bool check_exit() {
  print('정말 종료하시겠습니까? [5] 누르면 종료\n');
  String? input = stdin.readLineSync();

  if (int.parse(input!) == 5) {
    return true;
  }

  return false;
}

bool isInt(String? n) {
  if (n == null) {
    return false;
  } else {
    return int.tryParse(n) != null;
  }
}

void resetshopping(Shoppingmall shop) {
  if (shop.my_items.isEmpty) {
    print('이미 장바구니가 비어있습니다.');
  } else {
    shop.my_items.clear();
    shop.allprice = 0;
    print('장바구니를 초기화합니다.');
  }
}

void showshopping(Shoppingmall shop) {
  int allprice = shop.allprice;
  List<String> items = [];

  if (shop.my_items.isEmpty) {
    print('장바구니에 아무것도 없네요..');
  } else {
    for (int i = 0; i < shop.my_items.length; i++) {
      items.add(shop.my_items[i].name);
    }
    String a = items.join(', ');

    print('장바구니에 [ $a ](이)가 담겨있네요.');
  }

  print('총 가격 $allprice원 입니다!\n');
}
