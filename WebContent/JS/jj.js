/**
 * 
 */
$('#cate').change(function(){
      switch(this.value){
      case 0:
         $("select#gory").empty();
         $("select#gory").append("<option value='0'>하위 카테고리</option>");
         break;
      case 1:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='101'>대학</option>");
         $("select#gory").append("<option value='102'>초중고</option>");
         $("select#gory").append("<option value='103'>외국어</option>");
         $("select#gory").append("<option value='104'>기타</option>");
         break;
      case 2:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='201'>공무원</option>");
         $("select#gory").append("<option value='202'>외국어능력시험</option>");
         $("select#gory").append("<option value='203'>기타</option>");
         break;
      case 3:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='301'>소년 만화</option>");
         $("select#gory").append("<option value='302'>스포츠</option>");
         $("select#gory").append("<option value='303'>미스테리</option>");
         $("select#gory").append("<option value='304'>요리</option>");
         $("select#gory").append("<option value='305'>웹툰</option>");
         $("select#gory").append("<option value='306'>기타</option>");
         break;
      case 4:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='401'>판타지</option>");
         $("select#gory").append("<option value='402'>라이트 노벨</option>");
         $("select#gory").append("<option value='403'>공상과학</option>");
         $("select#gory").append("<option value='404'>호러</option>");
         $("select#gory").append("<option value='405'>무협</option>");
         $("select#gory").append("<option value='406'>액션</option>");
         $("select#gory").append("<option value='407'>로맨스</option>");
         $("select#gory").append("<option value='408'>시</option>");
         $("select#gory").append("<option value='409'>기타</option>");
         break;
      case 5:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='501'>미술</option>");
         $("select#gory").append("<option value='502'>음악</option>");
         $("select#gory").append("<option value='503'>영화</option>");
         $("select#gory").append("<option value='504'>건축</option>");
         $("select#gory").append("<option value='505'>디자인</option>");
         $("select#gory").append("<option value='506'>기타</option>");
         break;
      case 6:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='601'>국내 여행</option>");
         $("select#gory").append("<option value='602'>유럽 여행</option>");
         $("select#gory").append("<option value='603'>아시아 여행</option>");
         $("select#gory").append("<option value='604'>아프리카 여행</option>");
         $("select#gory").append("<option value='605'>아메리카 여행</option>");
         $("select#gory").append("<option value='606'>기타</option>");
         break;
      case 7:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='701'>동화책</option>");
         $("select#gory").append("<option value='702'>유아 학습</option>");
         $("select#gory").append("<option value='703'>기타</option>");
         break;
      case 8:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='801'>국내 역사</option>");
         $("select#gory").append("<option value='802'>해외 역사</option>");
         $("select#gory").append("<option value='803'>기타</option>");
         break;
      case 9:
         $("select#gory").empty();
         $("select#gory").append("<option value='0' selected>하위 카테고리</option>");
         $("select#gory").append("<option value='901'>프로그래밍</option>");
         $("select#gory").append("<option value='902'>그래픽</option>");
         $("select#gory").append("<option value='903'>웹디자인</option>");
         $("select#gory").append("<option value='904'>오피스</option>");
         $("select#gory").append("<option value='905'>기타</option>");
         break;
      }
   })