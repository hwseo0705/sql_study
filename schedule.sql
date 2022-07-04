

DROP TABLE schedule;

CREATE TABLE schedule (
    schedule_id NUMBER(10),
    category VARCHAR2(20) NOT NULL,
    schedule_name VARCHAR2(30) NOT NULL,
    date_time VARCHAR2(20) NOT NULL,
    location VARCHAR(40) NOT NULL,
    note VARCHAR2(150),
    user_id VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_schedule PRIMARY KEY (schedule_id),
    CONSTRAINT fk_tb_users FOREIGN KEY (user_id) REFERENCES tb_users(user_id)
);

DROP TABLE tb_users;

CREATE TABLE tb_users (
    user_id VARCHAR2(20),
    password VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_tb_users PRIMARY KEY (user_id)
);

INSERT INTO tb_users VALUES ('abcd', '1234');
INSERT INTO tb_users VALUES ('efgh', '5678');
INSERT INTO tb_users VALUES ('ijkl', '9999');
COMMIT;

SELECT * FROM tb_users;

DROP TABLE trash;

CREATE TABLE trash
AS
SELECT * FROM schedule WHERE 1 = 2;

SELECT * FROM trash;


-- 연속된 숫자 생성
CREATE SEQUENCE seq_schedule;
DROP SEQUENCE seq_schedule;

SELECT * FROM schedule;

INSERT INTO schedule VALUES (seq_schedule.nextval, 'business', 'Meeting with Julie', '22/07/05 13:00', 'Gangnam', 'Buy Present for Julie', 'abcd');
INSERT INTO schedule VALUES (seq_schedule.nextval, 'health', 'Doctor,s Appointment', '22/07/01 17:00', '서울시 은평구 진관동', NULL, 'abcd');
INSERT INTO schedule VALUES (seq_schedule.nextval, 'finance', 'Bank', '22/07/09 10:00', '서울시 금천구', NULL, 'efgh');
INSERT INTO schedule VALUES (seq_schedule.nextval, 'food', 'Grocery', '22/07/05 16:30', '하나로 마트', '감자, 고구마, 커피, 물, 라면', 'efgh');
INSERT INTO schedule VALUES (seq_schedule.nextval, 'business', '스케쥴', '22/06/09 10:00', '서울시 금천구', NULL, 'ijkl');
INSERT INTO schedule VALUES (seq_schedule.nextval, 'finance', '스케쥴2', '22/07/01 10:00', '서울시 금천구', NULL, 'ijkl');

COMMIT;

INSERT INTO trash VALUES (seq_schedule.nextval, 'food', 'Grocery', '22/07/05 16:30', '하나로 마트', '감자, 고구마, 커피, 물, 라면', 'efgh');
COMMIT;



