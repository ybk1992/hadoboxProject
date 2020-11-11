
INSERT INTO MEMBERS VALUES (MEMBERS_SEQ.NEXTVAL, 'apple123', 'a@gmail.com', '123qwe!', 
'김사과', '010-1111-1111', '17117', '서울 강남구', '역삼동 타임스퀘어',
SYSDATE, '1', 'C:\\tomcat_h\upload\members\apple.png');

INSERT INTO MEMBERS VALUES (MEMBERS_SEQ.NEXTVAL, 'melon123', 'b@gmail.com', '123qwe!', 
'김메론', '010-2222-2222', '17117', '서울 서초구', '서초동 타임스퀘어',
SYSDATE, '1', 'C:\\tomcat_h\upload\members\melon.png');

INSERT INTO MEMBERS VALUES (MEMBERS_SEQ.NEXTVAL, 'lemon123', 'c@gmail.com', '123qwe!', 
'김레몬', '010-3333-3333', '17117', '서울 광진구', '군자동 타임스퀘어',
SYSDATE, '1', 'C:\\tomcat_h\upload\members\lemon.png');

INSERT INTO MEMBERS VALUES (MEMBERS_SEQ.NEXTVAL, 'banana123', 'd@gmail.com', '123qwe!', 
'반하나', '010-4444-4444', '17117', '용인 기흥구', '보정동 타임스퀘어',
SYSDATE, '1', 'C:\\tomcat_h\upload\members\banana.png');



INSERT INTO CATEGORY(CATE_NUM, CATE_NAME, CATE_PRE)
		  SELECT 101, '교육', '대학' FROM DUAL
UNION ALL SELECT 102, '교육', '초중고' FROM DUAL
UNION ALL SELECT 103, '교육', '외국어' FROM DUAL
UNION ALL SELECT 104, '교육', '기타' FROM DUAL
UNION ALL SELECT 201, '시험', '공무원' FROM DUAL
UNION ALL SELECT 202, '시험', '외국어능력시험' FROM DUAL
UNION ALL SELECT 203, '시험', '기타' FROM DUAL
UNION ALL SELECT 301, '만화', '소년만화' FROM DUAL
UNION ALL SELECT 302, '만화', '스포츠' FROM DUAL
UNION ALL SELECT 303, '만화', '미스테리' FROM DUAL
UNION ALL SELECT 304, '만화', '요리' FROM DUAL
UNION ALL SELECT 305, '만화', '웹툰' FROM DUAL
UNION ALL SELECT 306, '만화', '기타' FROM DUAL
UNION ALL SELECT 401, '소설', '판타지' FROM DUAL
UNION ALL SELECT 402, '소설', '라이트노벨' FROM DUAL
UNION ALL SELECT 403, '소설', '공상과학' FROM DUAL
UNION ALL SELECT 404, '소설', '호러' FROM DUAL
UNION ALL SELECT 405, '소설', '무협' FROM DUAL
UNION ALL SELECT 406, '소설', '액션' FROM DUAL
UNION ALL SELECT 407, '소설', '로맨스' FROM DUAL
UNION ALL SELECT 408, '소설', '시' FROM DUAL
UNION ALL SELECT 409, '소설', '기타' FROM DUAL
UNION ALL SELECT 501, '예술', '미술' FROM DUAL
UNION ALL SELECT 502, '예술', '음악' FROM DUAL
UNION ALL SELECT 503, '예술', '영화' FROM DUAL
UNION ALL SELECT 504, '예술', '건축' FROM DUAL
UNION ALL SELECT 505, '예술', '디자인' FROM DUAL
UNION ALL SELECT 506, '예술', '기타' FROM DUAL
UNION ALL SELECT 601, '여행', '국내여행' FROM DUAL
UNION ALL SELECT 602, '여행', '유럽여행' FROM DUAL
UNION ALL SELECT 603, '여행', '아시아여행' FROM DUAL
UNION ALL SELECT 604, '여행', '아프리카여행' FROM DUAL
UNION ALL SELECT 605, '여행', '아메리카여행' FROM DUAL
UNION ALL SELECT 606, '여행', '기타' FROM DUAL
UNION ALL SELECT 701, '유아', '동화책' FROM DUAL
UNION ALL SELECT 702, '유아', '유아학습' FROM DUAL
UNION ALL SELECT 703, '유아', '기타' FROM DUAL
UNION ALL SELECT 801, '역사', '국내역사' FROM DUAL
UNION ALL SELECT 802, '역사', '해외역사' FROM DUAL
UNION ALL SELECT 803, '역사', '기타' FROM DUAL
UNION ALL SELECT 901, 'IT', '프로그래밍' FROM DUAL
UNION ALL SELECT 902, 'IT', '그래픽' FROM DUAL
UNION ALL SELECT 903, 'IT', '웹디자인' FROM DUAL
UNION ALL SELECT 904, 'IT', '오피스' FROM DUAL
UNION ALL SELECT 905, 'IT', '기타' FROM DUAL;

--insert 책 등록 <-- 글번호, 판매자, 책이름, 책가격, 작성일, 내용, 조회수, 책주소, 카테고리, 판매여부, 이미지경로
--AN_NUM, AN_WRITENUM, AN_CONTENT, AN_REGDATE, AN_ID
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 16, '첫 글의 댓글입니다', SYSDATE, 'melon123');
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 16, '두번째 댓글', SYSDATE, 'melon123');
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 16, '세번째 댓글', SYSDATE, 'lemon123');
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 16, '네번째 댓글', SYSDATE, 'apple123');

INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 20, '첫 글의 댓글입니다', SYSDATE, 'melon123');
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 20, '두번째 댓글', SYSDATE, 'melon123');
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 20, '세번째 댓글', SYSDATE, 'lemon123');
INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 20, '네번째 댓글', SYSDATE, 'apple123');

DELETE FROM BOOK_ANSWER WHERE AN_ID = 'melon123' AND AN_NUM = '2';



INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '귀멸의 칼날', 3000, SYSDATE, '직거래 원합니다1', 0, '호호호', 301, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '점멸의 칼날', 3000, SYSDATE, '직거래 원합니다2', 0, '글제목2', 302, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '입멸의 칼날', 3000, SYSDATE, '직거래 원합니다3', 0, '글제목3', 303, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '눈멸의 칼날', 3000, SYSDATE, '직거래 원합니다4', 0, '글제목4', 304, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '코멸의 칼날', 3000, SYSDATE, '직거래 원합니다5', 0, '글제목5', 305, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '목멸의 칼날', 3000, SYSDATE, '직거래 원합니다6', 0, '글제목6', 306, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '소멸의 칼날', 3000, SYSDATE, '직거래 원합니다7', 0, '글제목7', 304, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '닭멸의 칼날', 3000, SYSDATE, '직거래 원합니다8', 0, '글제목8', 303, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '박멸의 칼날', 3000, SYSDATE, '직거래 원합니다9', 0, '글제목9', 302, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '모멸의 칼날', 3000, SYSDATE, '직거래 원합니다10', 0, '글제목10', 301, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '점멸의 칼날', 3000, SYSDATE, '직거래 원합니다11', 0, '글제목11', 302, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '입멸의 칼날', 3000, SYSDATE, '직거래 원합니다12', 0, '글제목12', 303, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '눈멸의 칼날', 3000, SYSDATE, '직거래 원합니다13', 0, '글제목13', 304, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '코멸의 칼날', 3000, SYSDATE, '직거래 원합니다14', 0, '글제목14', 305, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '목멸의 칼날', 3000, SYSDATE, '직거래 원합니다15', 0, '글제목15', 306, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '소멸의 칼날', 3000, SYSDATE, '직거래 원합니다16', 0, '글제목16', 304, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '닭멸의 칼날', 3000, SYSDATE, '직거래 원합니다17', 0, '글제목17', 303, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '박멸의 칼날', 3000, SYSDATE, '직거래 원합니다18', 0, '글제목18', 302, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '모멸의 칼날', 3000, SYSDATE, '직거래 원합니다19', 0, '글제목19', 301, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '모멸의 칼날', 3000, SYSDATE, '직거래 원합니다20', 0, '글제목20', 301, '0', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');



INSERT INTO BOOK_ANSWER VALUES (BOOK_ANSWER_SEQ.NEXTVAL, 20, '네번째 댓글', SYSDATE, 'apple123');

DELETE FROM BOOK_ANSWER WHERE AN_ID = 'melon123' AND AN_NUM = '2';
--select 전체 글
SELECT * FROM BOOK_ANSWER ORDER BY AN_REGDATE DESC;
SELECT * FROM BOOK_ANSWER WHERE AN_WRITENUM = '16' ORDER BY AN_REGDATE DESC;
SELECT * FROM BOOK_ANSWER WHERE AN_WRITENUM = '20' ORDER BY AN_REGDATE DESC;
SELECT * FROM CATEGORY;
SELECT * FROM BOOKLIST ORDER BY BOOK_REGDATE DESC;
SELECT * FROM MEMBERS;
SELECT * FROM FREEWRITE;
--select book_num 선택 글 읽기
--SELECT * FROM BOOKLIST WHERE BOOK_NUM=1;

--SELECT C.CATE_NAME, C.CATE_PRE, B.*
--FROM CATEGORY C, BOOKLIST B 
--WHERE C.CATE_NUM = B.BOOK_CATE AND BOOK_NUM=2;
--
----CATEGORY
--SELECT * FROM CATEGORY ORDER BY CATE_NUM DESC;
--SELECT * FROM CATEGORY WHERE CATE_NUM=201;
---- 카테 조인
SELECT C.CATE_NAME, C.CATE_PRE, B.*
FROM CATEGORY C, BOOKLIST B 
WHERE C.CATE_NUM = B.BOOK_CATE AND C.CATE_PRE = '미스테리' ORDER BY BOOK_REGDATE DESC;

SELECT C.CATE_NAME, C.CATE_PRE, B.*
FROM CATEGORY C, BOOKLIST B 
WHERE C.CATE_NUM = B.BOOK_CATE AND B.BOOK_NAME LIKE '%점멸%' ORDER BY BOOK_REGDATE DESC;


--SELECT * FROM CATEGORY C, BOOKLIST B
--WHERE C.CATE_NUM = B.BOOK_NUM AND B.BOOK_CATE = 101 AND B.BOOK_NUM = 1;

--중복확인
--SELECT * FROM MEMBERS where MEM_USERID ='melon123';

--update 글 수정 / 책이름, 책가격, 작성일, 내용, 책주소, 카테고리, 판매여부, 이미지경로
--UPDATE HD04A SET BOOK_NAME = ?, BOOK_PRICE = ?, BOOK_REGDATE = ?, BOOK_CONTENT = ?,
--BOOK_URI = ?, BOOK_CATE = ?, BOOK_STATUS = ?, BOOK_IMAGE = ?;
		
--delete 글 삭제
--DELETE FROM HD04A WHERE BOOK_NUM = ?;

--UPDATE BOOKLIST SET BOOK_VIEWCNT = BOOK_VIEWCNT + 1 WHERE BOOK_NUM = 1;







------------------------


/* Drop Tables */

DROP TABLE freewrite CASCADE CONSTRAINTS;


/* Create Tables */

CREATE TABLE freewrite
(
   wr_uid number NOT NULL,
   wr_subject varchar2(200) NOT NULL,
   wr_content clob,
   wr_name varchar2(40) NOT NULL,
   wr_viewcnt number DEFAULT 0,
   wr_regdate date DEFAULT SYSDATE,
   PRIMARY KEY (wr_uid)
);

-- 시퀀스 작성
CREATE SEQUENCE freewrite_SEQ;

-- 기본데이터 작성
INSERT INTO freewrite VALUES
(freewrite_SEQ.nextval, '첫째글:방가요', '안녕하세요', '김희철', 0, '2017-03-02');
INSERT INTO freewrite VALUES
(freewrite_SEQ.nextval, '둘째글:헤헤헤','1111', '김수길', 0, '2017-03-02');
INSERT INTO freewrite VALUES
(freewrite_SEQ.nextval, '세째글:힘내세요', '7394', '최진덕' , 0, '2017-08-12');
INSERT INTO freewrite VALUES
(freewrite_SEQ.nextval, '네째글: ... ', '9090', '이혜원', 0, '2018-02-09');
INSERT INTO freewrite VALUES
(freewrite_SEQ.nextval, '다섯째글: 게시판', '7531', '박수찬', 0, sysdate);


SELECT * FROM freewrite ORDER BY wr_uid DESC;

-- 기존의 테이블 x2배로 늘리기 : 기존 레코드 그대로 복사해서 INSERT
INSERT INTO freewrite (wr_uid, wr_subject, wr_content, wr_name, wr_viewcnt)
SELECT freewrite_seq.nextval, wr_subject, wr_content, wr_name, wr_viewcnt FROM freewrite;
