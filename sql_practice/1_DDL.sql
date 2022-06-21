-- DDL : ������ ���Ǿ�
-- CREATE, ALTER, DROP, RENAME, TRUNCATE

DROP TABLE board;

-- CREATE TABLE : ���̺��� ����
CREATE TABLE board (
    bno NUMBER(10) -- bno NUMBER(10) PRIMARY KEY
    , title VARCHAR2(200) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , content CLOB -- CLOB can save up to 2GB
    , reg_date DATE DEFAULT SYSDATE
    , view_count NUMBER(10) DEFAULT 0
);

-- ALTER : �����ͺ��̽��� ���� ����
-- PK ���� -> this is important, must remember
-- PK : not null, unique

-- bno column modify
-- ALTER TABLE board MODIFY (bno NUMBER(10));

ALTER TABLE board
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (bno);

-- ������ �߰�
-- must insert values for 'not null'
INSERT INTO board
    (bno, title, writer, content)
VALUES
    (1, 'Hello', 'Yellow', 'Mellow Hehehehehehehehe~~~~');

INSERT INTO board
    (bno, title, writer, content)
VALUES
    (2, 'I am Hungry', 'Julie', 'I want food!');

INSERT INTO board
    (bno, title, writer)
VALUES
    (3, 'Nap Time', 'Haewon');

COMMIT;

SELECT * FROM board;

-- �������� ����
-- �Խù��� ����� ����
--    1   :   M

-- ��� ���̺� ����
CREATE TABLE REPLY (
    rno NUMBER(10)
    , r_content VARCHAR2(400)
    , r_writer VARCHAR2(40) NOT NULL
    , bno NUMBER(10)
    , CONSTRAINT pk_reply_rno PRIMARY KEY (rno) -- set PK
);

-- FOREIGN KEY : ���̺� ���� ���� ���� ����
ALTER TABLE reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY (bno)
REFERENCES board (bno);

-- change columns
-- add columns
ALTER TABLE reply
ADD (r_reg_date DATE DEFAULT SYSDATE);

SELECT * FROM reply;

-- remove column
ALTER TABLE board
DROP COLUMN view_count;

-- modify column;
ALTER TABLE board
MODIFY (title VARCHAR2(500));

SELECT * FROM board;

-- Delete Table
DROP TABLE reply; -- remove table completely
TRUNCATE TABLE board; -- inner remove (clear)

SELECT * FROM board;
