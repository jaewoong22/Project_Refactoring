<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- 테일윈드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.1.4/tailwind.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- 스와이퍼 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<style>


/* 노말라이즈 */
body,
ul,
li {
  padding: 0;
  margin: 0;
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}

/* 라이브러리 */

/* 커스텀 */
html,
body {
  overflow-x: hidden;
}

/* 상단 팝업 */
.popup-1 {
  height: 54px;
  background-color: #67625d;
  color: white;
}

.popup-1.active {
  display: none;
}

.btn__popup-1-close {
  width: 25px;
  height: 25px;
}

.btn__popup-1-close::before,
.btn__popup-1-close::after {
  position: absolute;
  content: "";
  background-color: white;
  width: 100%;
  height: 2px;
  top: 40%;
  transform: rotate(45deg);
}

.btn__popup-1-close::after {
  transform: rotate(-45deg);
}

/* 탑바 */
@media (min-width: 1281px) {
  .mobile-top-bar {
    display: none;
  }

  .mobile-side-bar {
    display: none;
  }
}

@media (max-width: 1280px) {
  .top-bar {
    display: none;
  }
}

.top-bar {
  height: 80px;
  border-bottom: 1px solid #ccc;
}

.menu-box-1 {
  width: 810px;
}

.menu-box-1 > ul > li {
  min-width: 108px;
}

.menu-box-1 > ul > li > a {
  transition: color 0.3s;
}

.menu-box-1 > ul > li > a:hover {
  color: #74a767;
}

.btn__login,
.btn__lang {
  transition: color 0.3s;
}

.btn__login:hover,
.btn__lang:hover {
  color: #74a767;
}

/* 2차 메뉴 */
.menu-box-2 > li {
  font-size: 15px;
  padding: 11px 0;
  padding-left: 20px;
  color: rgb(153, 153, 153);
}

.menu-box-2 > li > a {
  position: relative;
  transition: color 0.3s;
}

.menu-box-2 > li > a:hover {
  color: #74a767;
}

.menu-box-2 > li > .btn__more::after {
  position: absolute;
  content: ">";
  padding-left: 5px;
}

.menu-box-2 {
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s, visibiity 0.3s;
}

.menu-box-1 > ul:hover .menu-box-2 {
  opacity: 1;
  visibility: visible;
}

.menu-box-1 > ul .menu-box-2__bg {
  background-color: white;
  width: 100%;
  height: 0;
  left: 0;
  border-top: 1px solid #ccc;
  transition: height 0.3s;
}

.menu-box-1 > ul:hover .menu-box-2__bg {
  height: 460px;
}

/* 3차 메뉴 */
.menu-box-3 {
  top: 0;
  left: 100%;
  z-index: 2;
  width: 1080px;
  height: 460px;
  background-color: white;
  border-top: 1px solid #ccc;
  opacity: 0;
  visibility: hidden;
}

.menu-box-3 > li:first-child {
  padding: 11px 0;
}

.menu-box-3 > li > a {
  transition: color 0.3s;
}

.menu-box-3 > li:hover > a {
  color: #74a767;
}

.menu-box-3 > li li > a {
  transition: color 0.3s;
}

.menu-box-3 > li li:hover > a {
  color: #74a767;
}

.menu-box-3 > li > ul > li {
  padding: 11px 0;
  padding-left: 20px;
}

.menu-box-2 > li:hover > .menu-box-3 {
  opacity: 1;
  visibility: visible;
}

.items-etc,
.items-login,
.items-lang {
  top: 100%;
  left: 50%;
  transform: translatex(-50%);
  white-space: nowrap;
  background-color: white;
  padding: 10px;
  border: 1px solid #ccc;
  border-top: 1px solid white;
  text-align: right;
  opacity: 0;
  visibility: hidden;
  transition: height 0.3s, opacity 0.3s, visibility 0.3s;
}

li:hover > .items-etc,
li:hover > .items-login,
li:hover > .items-lang {
  opacity: 1;
  visibility: visible;
}

.items-etc > li > a,
.items-login > li > a,
.items-lang > li > a {
  transition: color 0.3s;
}

.items-etc > li:hover > a,
.items-login > li:hover > a,
.items-lang > li:hover > a {
  color: #74a767;
}

/* 섹션-배너 */
.banner-slider swiper-slide > img {
  width:100%;
}

.banner-inner {
  top: 0;
  left: 0;
}

.banner-inner .btn-go-page {
  width: 200px;
  border: 1px solid rgb(115, 115, 115);
  padding: 12px 0;
  text-align: center;
  margin-top: 38px;
}

.btn-go-page:hover {
  background-color: #333;
  color: white;
  transition: background-color 0.3s, color 0.3s;
}



</style>



<!-- 상단 팝업 -->
<div class="popup-1">
  <div class="container mx-auto h-full w-full cursor-pointer">
    <div class="popup__content h-full flex items-center justify-center relative">
      <div class="absolute text-xl whitespace-nowrap">지금 가입하면 5천원 할인 쿠폰 증정</div>
      <div class="btn__popup-1-close ml-auto relative"></div>
    </div>
  </div>
</div>

<!-- PC 탑바 -->
<header class="top-bar">
  <div class="container mx-auto h-full">
    <div class="flex h-full">
      <a href="#" class="top-bar__logo self-center">
        <img src="https://www.osulloc.com/kr/ko/static_renew/images/common/logo.png" alt="">
      </a>
      <div class="flex-grow"></div>
      <nav class="menu-box-1 z-10">
        <div class="menu-box-1__bg"></div>
        <ul class="flex h-full justify-around">
          <li>
            <a href="#" class="flex h-full items-center text-lg font-bold whitespace-nowrap px-5">티샵</a>
            <div class="menu-box-2__bg absolute"></div>
            <ul class="menu-box-2 whitespace-nowrap py-5 relative">
              <li>
                <a href="#" class="btn__more">티/티푸드</a>
                <ul class="menu-box-3 flex flex-col absolute p-5">
                  <li><a href="#" class="pl-5 font-bold">전체보기</a></li>
                  <li class="flex">
                    <ul class="w-0 flex-grow">
                      <li><a href="#" class="font-bold">티</a></li>
                      <li><a href="#">티</a></li>
                      <li><a href="#">명차</a></li>
                      <li><a href="#">녹차/발효차/홍차</a></li>
                      <li><a href="#">허브티(무카페인)</a></li>
                      <li><a href="#">블렌디드티</a></li>
                      <li><a href="#">웰니스티</a></li>
                      <li><a href="#">파우더</a></li>
                      <li><a href="#">세트</a></li>
                    </ul>
                    <ul class="w-0 flex-grow">
                      <li><a href="#" class="font-bold">티푸드</a></li>
                      <li><a href="#">베이커리</a></li>
                      <li><a href="#">초콜릿/잼</a></li>
                    </ul>
                    <ul class="w-0 flex-grow">
                      <li><a href="#" class="font-bold">테마샵</a></li>
                      <li><a href="#">기프트몰</a></li>
                      <li><a href="#">라이프스타일몰</a></li>
                      <li><a href="#">오피스몰</a></li>
                      <li><a href="#">건강기능식품</a></li>
                      <li><a href="#">정기배송</a></li>
                    </ul>
                    <ul class="w-0 flex-grow">
                    </ul>
                    <ul class="w-0 flex-grow">
                      <li><a href="#"><img src="https://www.osulloc.com/upload/kr/ko/adminImage/MF/FI/20210430142825767ES.jpg?quality=80" alt=""></a></li>
                      <li><a href="#">다이어트와 피부보습을 동시에!<br>맛있는15kcal이너핏 워터플러스</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li>
                <a href="#" class="btn__more">티웨어</a>
                <ul class="menu-box-3 flex flex-col absolute p-5">
                  <li><a href="#" class="pl-5 font-bold">전체보기</a></li>
                  <li class="flex">
                    <ul class="w-0 flex-grow">
                      <li><a href="#" class="font-bold">용도별</a></li>
                      <li><a href="#">찻잔</a></li>
                      <li><a href="#">티팟</a></li>
                      <li><a href="#">소도구</a></li>
                      <li><a href="#">티푸드플레이트</a></li>
                    </ul>
                    <ul class="w-0 flex-grow">
                      <li><a href="#" class="font-bold">브랜드별</a></li>
                      <li><a href="#">오설록</a></li>
                      <li><a href="#">광주요</a></li>
                      <li><a href="#">소일베이커</a></li>
                      <li><a href="#">서울번드</a></li>
                      <li><a href="#">토림도예</a></li>
                      <li><a href="#">소로시</a></li>
                      <li><a href="#">킨토</a></li>
                    </ul>
                    <ul class="w-0 flex-grow">
                    </ul>
                    <ul class="w-0 flex-grow">
                    </ul>
                    <ul class="w-0 flex-grow">
                      <li><a href="#"><img src="https://www.osulloc.com/upload/kr/ko/adminImage/MF/FI/20210430142825767ES.jpg?quality=80" alt=""></a></li>
                      <li><a href="#">다이어트와 피부보습을 동시에!<br>맛있는15kcal이너핏 워터플러스</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li><a href="#">선물추천</a></li>
              <li><a href="#">베스트</a></li>
              <li><a href="#">오설록 라운지</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="flex h-full items-center text-lg font-bold whitespace-nowrap px-5">티라이프</a>
            <ul class="menu-box-2 whitespace-nowrap py-5">
              <li><a href="#">티라이프</a></li>
              <li><a href="#">상품후기</a></li>
              <li><a href="#">선물추천</a></li>
              <li><a href="#">다다일상(정기구독)</a></li>
              <li><a href="#">매장 방문기</a></li>
              <li><a href="#">차 알아가기</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="flex h-full items-center text-lg font-bold whitespace-nowrap px-5">이벤트</a>
            <ul class="menu-box-2 absolute whitespace-nowrap py-5">
              <li><a href="#">이벤트</a></li>
              <li><a href="#">온라인 쇼핑혜택</a></li>
              <li><a href="#">인스타그램</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="flex h-full items-center text-lg font-bold whitespace-nowrap px-5">스토리</a>
            <ul class="menu-box-2 absolute whitespace-nowrap py-5">
              <li><a href="#">일구다, 가꾸다, 즐기다</a></li>
              <li><a href="#">Since 1979</a></li>
              <li><a href="#">오설록 차밭 이야기</a></li>
              <li><a href="#">숫자로 보는 오설록</a></li>
              <li><a href="#">티하우스 메뉴</a></li>
              <li><a href="#">매거진</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="flex h-full items-center text-lg font-bold whitespace-nowrap px-5">제주 티뮤지엄</a>
            <ul class="menu-box-2 absolute whitespace-nowrap py-5">
              <li><a href="#">둘러보기</a></li>
              <li><a href="#">티스톤 예약</a></li>
              <li><a href="#">제주 오설록 맵</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div class="flex-grow"></div>
      <nav class="menu-box-icon z-10">
        <ul class="flex h-full">
          <li class="flex items-center px-5"><a href="#"><img src="https://www.osulloc.com/kr/ko/static_renew/images/main/ico_search.png" alt=""></a></li>
          <li class="flex items-center px-5"><a href="#"><img src="https://www.osulloc.com/kr/ko/static_renew/images/main/ico_cart.png" alt=""></a></li>
          <li class="flex items-center relative px-5">
            <a href="#" class="etc-icon"><img src="https://www.osulloc.com/kr/ko/static_renew/images/main/ico_gnbMore2_off.png" alt=""></a>
            <ul class="items-etc absolute p-5">
              <li><a href="#">고객센터</a></li>
              <li class="pt-2"><a href="#">매장찾기</a></li>
              <li class="pt-2"><a href="#">주문배송 조회</a></li>
              <li class="pt-2"><a href="#">뷰티포인트 추후적립</a></li>
            </ul>
          </li>
        </ul>
      </nav>
      <div class="flex-grow"></div>
      <nav class="menu-box-etc z-10">
        <ul class="flex h-full">
          <li class="flex items-center h-full whitespace-nowrap relative px-5">
            <a href="#" class="btn-login">로그인</a>
            <ul class="items-login absolute p-5">
              <li><a href="#">로그인</a></li>
              <li class="pt-2"><a href="#">회원가입</a></li>
            </ul>
          </li>
          <li class="flex items-center h-full whitespace-nowrap relative px-5">
            <a href="#" class="btn-lang">한국어</a>
            <ul class="items-lang absolute p-5">
              <li><a href="#">한국어</a></li>
              <li class="pt-2"><a href="#">English</a></li>
              <li class="pt-2"><a href="#">中文</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
</header>