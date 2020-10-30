
/* Drop Tables */

--DROP TABLE "BOOK_ANSWER" CASCADE CONSTRAINTS;
--DROP TABLE "FREE_ANSWER" CASCADE CONSTRAINTS;
--DROP TABLE "BOOKLIST" CASCADE CONSTRAINTS;
--DROP TABLE "CATEGORY" CASCADE CONSTRAINTS;
--DROP TABLE "FREEWRITE" CASCADE CONSTRAINTS;
--DROP TABLE "MEMBERS" CASCADE CONSTRAINTS;

/* ���� ��� ������ ������̺� DROP ��  */
--SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables


/* Create Tables */

CREATE TABLE book_answer
(
	-- ��۹�ȣ
	an_num number NOT NULL,
	-- �۹�ȣ
	an_writenum number,
	-- ����
	an_content varchar2(2000),
	-- �ۼ���
	an_regdate timestamp,
	-- ȸ�� ���̵�
	an_id varchar2(20),
	PRIMARY KEY (an_num)
);


CREATE TABLE free_answer
(
	-- ��۹�ȣ
	swer_num number NOT NULL,
	-- �۹�ȣ
	swer_writenum number,
	-- ����
	swer_content varchar2(2000),
	-- �ۼ���
	swer_regdate timestamp,
	-- ȸ�� ���̵�
	swer_id varchar2(20),
	PRIMARY KEY (swer_num)
);


-- ����� å �� ���
CREATE TABLE HD04A.BOOKLIST
(
	-- �� ��ȣ
	BOOK_NUM number NOT NULL,
	-- ȸ�����̵�
	book_sellid varchar2(20),
	-- å �̸�
	BOOK_NAME varchar2(50) NOT NULL,
	-- å ����
	BOOK_PRICE number NOT NULL,
	-- �ۼ��� ��¥
	BOOK_REGDATE timestamp NOT NULL,
	-- �� ����
	BOOK_CONTENT clob,
	-- ��ȸ��
	BOOK_VIEWCNT number NOT NULL,
	-- �� �ּ�
	BOOK_URI varchar2(20) NOT NULL,
	-- å ī�װ���
	BOOK_CATE number NOT NULL,
	-- �̹��� ���
	BOOK_IMAGE varchar2(50),
	-- �Ǹſ���
	BOOK_STATUS char(1) NOT NULL,
	CONSTRAINT BOOKLIST_PK PRIMARY KEY (BOOK_NUM)
);


-- å ī�װ���
CREATE TABLE HD04A.CATEGORY
(
	-- ī�װ��� ������ȣ
	CATE_NUM number NOT NULL,
	-- ī�װ��� �̸�
	CATE_NAME varchar2(20) NOT NULL,
	-- ���� ī�װ���
	CATE_PRE varchar2(20) NOT NULL,
	CONSTRAINT CATEGORY_PK PRIMARY KEY (CATE_NUM)
);


CREATE TABLE HD04A.FREEWRITE
(
	FREE_NUM number NOT NULL,
	-- ȸ�����̵�
	free_id number,
	FREE_NAME varchar2(40) NOT NULL,
	FREE_CONTENT clob,
	FREE_VIEWCNT number NOT NULL,
	CONSTRAINT FREEWRITE_PK PRIMARY KEY (FREE_NUM)
);


-- ȸ������
CREATE TABLE HD04A.MEMBERS
(
	mem_num number NOT NULL,
	-- ȸ�����̵�
	MEM_USERID varchar2(20) NOT NULL,
	-- ȸ���̸���
	MEM_EMAIL varchar2(50) NOT NULL,
	-- ȸ�� ��й�ȣ
	MEM_PASSWORD varchar2(20) NOT NULL,
	-- ȸ�� �Ǹ�
	MEM_USERNAME varchar2(30) NOT NULL,
	-- ����ó
	MEM_PHONE varchar2(14),
	-- ������ȣ
	MEM_ZIPCODE varchar2(20),
	-- ���ּ�1
	MEM_ADDRESS1 varchar2(200),
	-- ���ּ�2
	MEM_ADDRESS2 varchar2(200),
	-- ȸ�� �����
	MEM_REGISTER_DATETIME timestamp NOT NULL,
	-- ���� ����
	MEM_STATUS char(1) NOT NULL,
	-- ȸ�� �̹��� ���
	MEM_IMAGE varchar2(50),
	CONSTRAINT MEMBERS_PK PRIMARY KEY (mem_num)
);



/* Create Foreign Keys */

ALTER TABLE book_answer
	ADD FOREIGN KEY (an_writenum)
	REFERENCES HD04A.BOOKLIST (BOOK_NUM)
;


ALTER TABLE HD04A.BOOKLIST
	ADD FOREIGN KEY (BOOK_CATE)
	REFERENCES HD04A.CATEGORY (CATE_NUM)
;


ALTER TABLE free_answer
	ADD FOREIGN KEY (swer_writenum)
	REFERENCES HD04A.FREEWRITE (FREE_NUM)
;


ALTER TABLE HD04A.FREEWRITE
	ADD FOREIGN KEY (free_id)
	REFERENCES HD04A.MEMBERS (mem_num)
;



/* Comments */

COMMENT ON COLUMN book_answer.an_num IS '��۹�ȣ';
COMMENT ON COLUMN book_answer.an_writenum IS '�۹�ȣ';
COMMENT ON COLUMN book_answer.an_content IS '����';
COMMENT ON COLUMN book_answer.an_regdate IS '�ۼ���';
COMMENT ON COLUMN book_answer.an_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN free_answer.swer_num IS '��۹�ȣ';
COMMENT ON COLUMN free_answer.swer_writenum IS '�۹�ȣ';
COMMENT ON COLUMN free_answer.swer_content IS '����';
COMMENT ON COLUMN free_answer.swer_regdate IS '�ۼ���';
COMMENT ON COLUMN free_answer.swer_id IS 'ȸ�� ���̵�';
COMMENT ON TABLE HD04A.BOOKLIST IS '����� å �� ���';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_NUM IS '�� ��ȣ';
COMMENT ON COLUMN HD04A.BOOKLIST.book_sellid IS 'ȸ�����̵�';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_NAME IS 'å �̸�';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_PRICE IS 'å ����';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_REGDATE IS '�ۼ��� ��¥';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_CONTENT IS '�� ����';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_VIEWCNT IS '��ȸ��';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_URI IS '�� �ּ�';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_CATE IS 'å ī�װ���';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_IMAGE IS '�̹��� ���';
COMMENT ON COLUMN HD04A.BOOKLIST.BOOK_STATUS IS '�Ǹſ���';
COMMENT ON TABLE HD04A.CATEGORY IS 'å ī�װ���';
COMMENT ON COLUMN HD04A.CATEGORY.CATE_NUM IS 'ī�װ��� ������ȣ';
COMMENT ON COLUMN HD04A.CATEGORY.CATE_NAME IS 'ī�װ��� �̸�';
COMMENT ON COLUMN HD04A.CATEGORY.CATE_PRE IS '���� ī�װ���';
COMMENT ON COLUMN HD04A.FREEWRITE.free_id IS 'ȸ�����̵�';
COMMENT ON TABLE HD04A.MEMBERS IS 'ȸ������';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_USERID IS 'ȸ�����̵�';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_EMAIL IS 'ȸ���̸���';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_PASSWORD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_USERNAME IS 'ȸ�� �Ǹ�';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_PHONE IS '����ó';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_ZIPCODE IS '������ȣ';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_ADDRESS1 IS '���ּ�1';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_ADDRESS2 IS '���ּ�2';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_REGISTER_DATETIME IS 'ȸ�� �����';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_STATUS IS '���� ����';
COMMENT ON COLUMN HD04A.MEMBERS.MEM_IMAGE IS 'ȸ�� �̹��� ���';


