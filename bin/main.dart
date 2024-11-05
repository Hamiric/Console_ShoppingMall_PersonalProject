import 'dart:convert';
import 'dart:io';

import 'package:console_shoppingmall/product.dart';
import 'package:console_shoppingmall/shoppingmall.dart';

void main() {
  Shoppingmall myshoppingmall = Shoppingmall();

  bool loop = true;
  while (loop) {
    // 메뉴 출력 및 첫 입력 받기
    int a = startshopping();

    switch (a) {
      // 1 입력시, 상품 목록들을 나열하여 보여주기
      case 1:
        myshoppingmall.showProducts();
        break;
      // 2 입력시, 상품명과 개수를 입력받아 장바구니에 담기
      case 2:
        insertproduct(myshoppingmall);
        break;
      // 3 입력시, 장바구니에 담겨있는 상품들 목록과 총 가격을 보여주기
      case 3:
        showshopping(myshoppingmall);
        break;
      // 4 입력시, 프로그램을 종료를 위한 프로세스를 수행 (정말로 종료할지를 한번더 물어보기)
      case 4:
        if (checkexit()) {
          print('이용해 주셔서 감사합니다 ~ 안녕히 계세요 !');
          loop = false;
        } else {
          print('종료하지 않습니다.\n');
        }
        break;
      // 6 입력시, 장바구니를 초기화 시켜주기
      case 6:
        resetshopping(myshoppingmall);
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ...\n');
    }
  }
}

// 메뉴를 호출하고, 사용자 입력을 받는데 정수값만 반환하고, 아닐경우 -1 반환
int startshopping() {
  String? input;

  menu();

  while (true) {
    input = userinput();

    if(isInt(input)){
      return int.parse(input!);
    } else {
      return -1;
    }
  }
}

// 메뉴
void menu() {
  print(
      '______________________________________________________________________________________________________________________\n');
  print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 비우기\n');
  print(
      '‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\n');
}

// 상품을 장바구니에 넣는 로직
void insertproduct(Shoppingmall shop) {
  late Product a;
  late int times;

  print('상품 이름을 입력해 주세요!');
  String? inputName = userinput();

  print('상품 개수를 입력해 주세요!');
  String? inputCount = userinput();

  // 입력받은 상품 이름과 상품 목록들을 비교하여, 목록에 없으면 false
  bool aFlag = false;
  for (int i = 0; i < shop.items.length; i++) {
    if (inputName == shop.items[i].name) {
      a = shop.items[i];
      aFlag = true;
      break;
    }
  }
  // 입력받은 개수값이 숫자가 아닌 경우 false
  if (isInt(inputCount!) == false) aFlag = false;

  // 즉, 상품명이 상품 목록에 있어야 하고, 개수값이 정수일 경우 로직 실행
  if (aFlag) {
    // 입력받은 개수값을 times에 입력
    times = int.parse(inputCount);
    // times가 1보다 적을 경우 리턴, times가 1보다 큰 경우 다음 로직 수행
    if (times < 1) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요!\n');
      return;
    }
  } else {
    // flag 값이 false인 경우 올바르지 않은 입력값이라고 고지 및 리턴
    print('입력값이 올바르지 않아요!\n');
    return;
  }

  // 장바구니에 개수만큼 상품을 담는 로직
  shop.addToCart(a, times);
  print('장바구니에 상품이 담겼어요!\n');
}

// 입력받은값이 정수값인지를 판별 (null,글자는 false, 정수는 true)
bool isInt(String? n) {
  if (n == null) {
    return false;
  } else {
    return int.tryParse(n) != null;
  }
}

// 프로그램 종료시 한번더 확인 받는 로직
bool checkexit() {
  print('정말 종료하시겠습니까? [5] 누르면 종료\n');
  String? input = userinput();

  try{
    if (int.parse(input!) == 5) {
      return true;
    }
  } catch(e) {
    // input 에 숫자형태가 들어오지 않은 경우는 어차피 프로그램 종료를 하지 않는 형태
  }

  return false;
}

// 장바구니를 초기화 하는 로직. 만약 장바구니에 아무것도 없을경우엔 장바구니가 비어있다고 고지
void resetshopping(Shoppingmall shop) {
  if (shop.isEmptyMyItems()) {
    print('이미 장바구니가 비어있습니다.');
  } else {
    shop.resetMyItems();
    print('장바구니를 초기화합니다.');
  }
}

// 장바구니에 들어있는 상품 및 총 가격을 출력해주는 로직
void showshopping(Shoppingmall shop) {
  int allprice = shop.showTotal();
  List<String> items = [];

  if (shop.isEmptyMyItems()) {
    print('장바구니에 아무것도 없네요..');
  } else {
    for (int i = 0; i < shop.myitems.length; i++) {
      items.add(shop.myitems[i].name);
    }
    String a = items.join(', ');

    print('장바구니에 [ $a ](이)가 담겨있네요.');
  }

  print('총 가격 $allprice원 입니다!\n');
}

// 사용자 입력을 받는 함수
// 입력시 오류가 생길경우 Exception을 발생시킴
String? userinput() {
  String? input;

  try {
    input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
  } catch (e) {
    print('입력이 정상처리 되지 않았어요! 오류내용 : $e');
  }

  return input;
}
