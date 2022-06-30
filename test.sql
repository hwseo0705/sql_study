DROP TABLE score;

CREATE TABLE score (
    stu_num NUMBER(10),
    stu_name VARCHAR2(20) NOT NULL,
    kor NUMBER(3) NOT NULL,
    eng NUMBER(3) NOT NULL,
    math NUMBER(3) NOT NULL,
    total NUMBER(3),
    average NUMBER(5,2),
    CONSTRAINT pk_score PRIMARY KEY (stu_num)
);

-- 연속된 숫자 생성
CREATE SEQUENCE seq_score;

SELECT * FROM score;

INSERT INTO score VALUES (seq_score.nextval,  '홍길동', 90, 90, 90, 270, 90);
INSERT INTO score VALUES (seq_score.nextval,  '김철수', 80, 80, 80, 240, 80);
INSERT INTO score VALUES (seq_score.nextval,  '박영희', 100, 100, 100, 300, 100);
COMMIT;

SELECT AVG(average) AS avg_cls FROM score;


DROP TABLE schedule;

CREATE TABLE schedule (
    schedule_id NUMBER(10),
    category VARCHAR2(20) NOT NULL,
    schedule_name VARCHAR2(30) NOT NULL,
    date_time VARCHAR2(20) NOT NULL,
    location VARCHAR(40) NOT NULL,
    note VARCHAR2(150),
    CONSTRAINT pk_schedule PRIMARY KEY (schedule_id)
);

DROP TABLE trash;

CREATE TABLE trash
AS
SELECT * FROM schedule WHERE 1 = 2;

SELECT * FROM trash;


-- 연속된 숫자 생성
CREATE SEQUENCE seq_schedule;

SELECT * FROM schedule ORDER BY date_time;

INSERT INTO schedule VALUES (seq_schedule.nextval, 'Work', 'Meeting with Julie', '22/07/05 13:00', 'Gangnam', 'Buy Present for Julie');
INSERT INTO schedule VALUES (seq_schedule.nextval, 'Health', 'Doctor,s Appointment', '22/07/01 17:00', '서울시 은평구 진관동', NULL);
INSERT INTO schedule VALUES (seq_schedule.nextval, 'Finance', 'Bank', '22/07/09 10:00', '서울시 금천구', NULL);
INSERT INTO schedule VALUES (seq_schedule.nextval, 'Food', 'Grocery', '22/07/05 16:30', '하나로 마트', '감자, 고구마, 커피, 물, 라면');
COMMIT;

INSERT INTO trash VALUES (seq_schedule.nextval, 'Food', 'Grocery', '22/07/05 16:30', '하나로 마트', '감자, 고구마, 커피, 물, 라면');




