CREATE SEQUENCE seq_product;
DROP SEQUENCE seq_product;

DROP TABLE tbl_product;
CREATE TABLE tbl_product (
    serial_no VARCHAR2(100) PRIMARY KEY
    , product_name VARCHAR2(100) NOT NULL
    , price NUMBER(8) NOT NULL
    , made_at DATE DEFAULT SYSDATE
);

INSERT INTO tbl_product 
    (serial_no, product_name, price)
VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(seq_product.nextval, 4, '0'), 'USB DISK 16GB', 10000);

COMMIT;

SELECT * FROM tbl_product;


SELECT  *
FROM (SELECT ROWNUM rn, v_board.* -- 로우넘
        FROM ( -- 정렬
                SELECT *
                FROM tbl_board
                WHERE title LIKE '%글쓴%'
                    OR content LIKE '%글쓴%'
                ORDER BY board_no DESC
                ) v_board)
WHERE rn BETWEEN 1 AND 10 -- 로우넘 거르기
;

SELECT * FROM tbl_board ORDER BY board_no DESC;