# Console ShoppingMall
개인 과제 - 콘솔 쇼핑몰

## 프로젝트 소개
아래의 기능들을 가진 콘솔 쇼핑몰 프로그램

<필수 기능> 
1. 상품 목록
2. 장바구니 담기
3. 장바구니 총 금액 나타내기
4. 프로그램 종료

<도전기능>
1. 프로그램 종료 시 묻기
2. 장바구니 초기화
3. 장바구니 상품의 목록과 가격 나타내기
4. 자유 구현

## 현재 Error 현황

    String? inputName = stdin.readLineSync();

해당 코드에 한글 입력시 입력값이 제대로 들어오지 않는 현상이 발생중.. 

따라서 임시로 shoppingmall.dart의 해당 코드를 임의로 변경했음..

    // 기존 버전
    items = [
      Product('셔츠', 45000),
      Product('원피스', 30000),
      Product('반팔티', 35000),
      Product('반바지', 38000),
      Product('양말', 5000),
    ];

>>

    // 변경 후
    items = [
      Product('shirt', 45000),  // 셔츠
      Product('dress', 30000),  // 원피스
      Product('sleeves', 35000),  // 반팔티
      Product('shorts', 38000),  // 반바지
      Product('socks', 5000),  // 양말
    ];


