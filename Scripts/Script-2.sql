
/* Drop Tables */

DROP TABLE BOOK_ANSWER CASCADE CONSTRAINTS;
DROP TABLE HD04A.BOOKLIST CASCADE CONSTRAINTS;
DROP TABLE HD04A.CATEGORY CASCADE CONSTRAINTS;
DROP TABLE HD04A.FREEWRITE CASCADE CONSTRAINTS;
DROP TABLE HD04A.MEMBERS CASCADE CONSTRAINTS;

--SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;


/* Create Tables */

CREATE TABLE BOOK_ANSWER
(
   -- 댓글번호
   an_num number NOT NULL,
   -- 글번호
   an_writenum number,
   -- 내용
   an_content varchar2(2000),
   -- 작성일
   an_regdate timestamp,
   -- 회원 아이디
   an_id varchar2(20),
   PRIMARY KEY (an_num)
);


-- 등록한 책 글 목록
CREATE TABLE HD04A.BOOKLIST
(
   -- 글 번호
   BOOK_NUM number NOT NULL,
   -- 회원아이디
   BOOK_SELLID varchar2(20) NOT NULL,
   -- 책 이름
   BOOK_NAME varchar2(50) NOT NULL,
   -- 책 가격
   BOOK_PRICE number NOT NULL,
   -- 작성한 날짜
   BOOK_REGDATE timestamp NOT NULL,
   -- 글 내용
   BOOK_CONTENT clob,
   -- 조회수
   BOOK_VIEWCNT number NOT NULL,
   -- 글 제목
   BOOK_TITLE varchar2(300) NOT NULL,
   -- 책 카테고리
   BOOK_CATE number NOT NULL,
   -- 판매여부
   BOOK_STATUS char(1) NOT NULL,
   -- 이미지 경로
   BOOK_IMAGE varchar2(300),
   CONSTRAINT BOOKLIST_PK PRIMARY KEY (BOOK_NUM)
);


-- 책 카테고리
CREATE TABLE HD04A.CATEGORY
(
   -- 카테고리 고유번호
   CATE_NUM number NOT NULL,
   -- 카테고리 이름
   CATE_NAME varchar2(40) NOT NULL,
   -- 상위 카테고리
   CATE_PRE varchar2(40) NOT NULL,
   CONSTRAINT CATEGORY_PK PRIMARY KEY (CATE_NUM)
);

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


-- 회원정보
CREATE TABLE HD04A.MEMBERS
(
   MEM_NUM number NOT NULL,
   -- 회원아이디
   MEM_USERID varchar2(20) NOT NULL UNIQUE,
   -- 회원이메일
   MEM_EMAIL varchar2(50) NOT NULL,
   -- 회원 비밀번호
   MEM_PASSWORD varchar2(20) NOT NULL,
   -- 회원 실명
   MEM_USERNAME varchar2(30) NOT NULL,
   -- 연락처
   MEM_PHONE varchar2(14),
   -- 우편번호
   MEM_ZIPCODE varchar2(20),
   -- 집주소1
   MEM_ADDRESS1 varchar2(200),
   -- 집주소2
   MEM_ADDRESS2 varchar2(200),
   -- 회원 등록일
   MEM_REGISTER_DATETIME timestamp NOT NULL,
   -- 가입 상태
   MEM_STATUS char(1) NOT NULL,
   -- 회원 이미지 경로
   MEM_IMAGE varchar2(300),
   CONSTRAINT MEMBERS_PK PRIMARY KEY (MEM_NUM)
);



/* Create Foreign Keys */
ALTER TABLE BOOK_ANSWER
   ADD FOREIGN KEY (an_writenum)
   REFERENCES HD04A.BOOKLIST (BOOK_NUM)
   ON DELETE CASCADE
;


ALTER TABLE HD04A.BOOKLIST
   ADD FOREIGN KEY (BOOK_CATE)
   REFERENCES HD04A.CATEGORY (CATE_NUM)
   ON DELETE CASCADE
;


ALTER TABLE HD04A.BOOKLIST
   ADD FOREIGN KEY (BOOK_SELLID)
   REFERENCES HD04A.MEMBERS (MEM_USERID)
   ON DELETE CASCADE
;


--ALTER TABLE HD04A.FREEWRITE
--   ADD FOREIGN KEY (FREE_ID)
--   REFERENCES HD04A.MEMBERS (MEM_NUM)
--   ON DELETE CASCADE
--;

-- 시퀀스 삭제
DROP SEQUENCE BOOK_ANSWER_SEQ;
DROP SEQUENCE BOOKLIST_SEQ;
DROP SEQUENCE FREEWRITE_SEQ;
DROP SEQUENCE MEMBERS_SEQ;

-- 시퀀스 작성 ANSWER
CREATE SEQUENCE BOOK_ANSWER_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 시퀀스 작성 MEMBERS
CREATE SEQUENCE MEMBERS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 시퀀스 작성 booklist
CREATE SEQUENCE BOOKLIST_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 시퀀스 작성 freeboard
CREATE SEQUENCE FREEWRITE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 다음 NEXTVAL 확인
--SELECT MEMBERS_SEQ.NEXTVAL FROM DUAL;
--SELECT BOOKLIST_SEQ.NEXTVAL FROM DUAL;
--SELECT FREEWRITE_SEQ.NEXTVAL FROM DUAL;
-- 현재 LAST_NUMBER 확인
--SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'MEMBERS_SEQ';
--SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'BOOKLIST_SEQ';
--SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'FREEWRITE_SEQ';


/* Comments */

COMMENT ON COLUMN BOOK_ANSWER.an_num IS '댓글번호';
COMMENT ON COLUMN BOOK_ANSWER.an_writenum IS '글번호';
COMMENT ON COLUMN BOOK_ANSWER.an_content IS '내용';
COMMENT ON COLUMN BOOK_ANSWER.an_regdate IS '작성일';
COMMENT ON COLUMN BOOK_ANSWER.an_id IS '회원 아이디';

COMMENT ON TABLE HD04A.BOOKLIST IS '등록한 책 글 목록';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_NUM IS '글 번호';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_SELLID IS '회원아이디';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_NAME IS '책 이름';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_PRICE IS '책 가격';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_REGDATE IS '작성한 날짜';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_CONTENT IS '글 내용';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_VIEWCNT IS '조회수';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_TITLE IS '글 제목';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_CATE IS '책 카테고리';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_STATUS IS '판매여부';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_IMAGE IS '이미지 경로';
COMMENT ON TABLE HD04A.CATEGORY IS '책 카테고리';
COMMENT ON COLUMN HD04A.CATEGORY.CATE_NUM IS '카테고리 고유번호';
COMMENT ON COLUMN HD04A.CATEGORY.CATE_NAME IS '카테고리 이름';
COMMENT ON COLUMN HD04A.CATEGORY.CATE_PRE IS '상위 카테고리';
COMMENT ON TABLE HD04A.MEMBERS IS '회원정보';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_USERID IS '회원아이디';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_EMAIL IS '회원이메일';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_PASSWORD IS '회원 비밀번호';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_USERNAME IS '회원 실명';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_PHONE IS '연락처';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_ZIPCODE IS '우편번호';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_ADDRESS1 IS '집주소1';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_ADDRESS2 IS '집주소2';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_REGISTER_DATETIME IS '회원 등록일';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_STATUS IS '가입 상태';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_IMAGE IS '회원 이미지 경로';



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

INSERT INTO BOOKLIST VALUES (BOOKLIST_SEQ.NEXTVAL, 'apple123', '귀멸의 칼날', 3000, SYSDATE, '직거래 원합니다1', 0, '글제목1', 301, '1', 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1523954%3Ftimestamp%3D20200418132612');
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

SELECT * FROM MEMBERS;

SELECT * FROM BOOKLIST;


