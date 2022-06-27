
DROP TABLE 일자별매출_93;

CREATE TABLE 일자별매출_93 (
    일자 DATE,
    매출액 NUMBER(5)
);

INSERT INTO 일자별매출_93 VALUES ('2015-11-01', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-02', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-03', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-04', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-05', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-06', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-07', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-08', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-09', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-10', 1000);
COMMIT;

SELECT * FROM 일자별매출_93;

-- 보기 1

SELECT A.일자, SUM(A.매출액) AS 누적매출액
FROM 일자별매출_93 A
GROUP BY A.일자
ORDER BY A.일자
;

-- 보기 2

SELECT B.일자, SUM(B.매출액) AS 누적매출액
FROM 일자별매출_93 A JOIN 일자별매출_93 B ON (A.일자 >= B.일자)
GROUP BY B.일자
ORDER BY B.일자
;

-- 86번
drop table 회원기본정보_86;
drop table 회원상세정보_86;
CREATE TABLE 회원기본정보_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE 회원상세정보_86 (
    user_id VARCHAR2(200)
    
);
ALTER TABLE 회원상세정보_86
ADD CONSTRAINT fk_user_id 
FOREIGN KEY (user_id)
references 회원기본정보_86 (user_id);

INSERT INTO 회원기본정보_86 VALUES ('abc01');
INSERT INTO 회원기본정보_86 VALUES ('abc02');
INSERT INTO 회원기본정보_86 VALUES ('abc03');
COMMIT;


INSERT INTO 회원상세정보_86 VALUES ('abc01');
INSERT INTO 회원상세정보_86 VALUES ('abc02');
INSERT INTO 회원상세정보_86 VALUES ('abc03');
COMMIT;

SELECT * FROM 회원기본정보_86;
SELECT * FROM 회원상세정보_86;

-- 보기 1

SELECT user_id FROM 회원기본정보_86
MINUS
SELECT user_id FROM 회원상세정보_86
;

-- 보기 2

SELECT user_id FROM 회원기본정보_86
UNION ALL
SELECT user_id FROM 회원상세정보_86
;

-- 보기 3
SELECT user_id FROM 회원기본정보_86
INTERSECT
SELECT user_id FROM 회원상세정보_86
;

-- 보기 4

SELECT A.user_id 
FROM 회원기본정보_86 A
JOIN 회원상세정보_86 B
ON A.user_id = B.user_id
;

-- 보기 5

SELECT user_id FROM 회원기본정보_86
UNION
SELECT user_id FROM 회원상세정보_86
;

-- 연습문제

CREATE TABLE 부서 (
    부서코드 NUMBER(3)
    , 부서명 VARCHAR(100)
    , 상위부서코드 NUMBER(3)
    , CONSTRAINT 부서코드_pk PRIMARY KEY (부서코드)
);

CREATE TABLE 매출 (
    부서코드 NUMBER(3)
    , 매출액 NUMBER(4)
);

INSERT INTO 부서 VALUES('100', '아시아부', NULL);

-----------------------------------------------

DROP TABLE TB_EMP_19;
DROP TABLE TB_DEPT_19;

CREATE TABLE TB_DEPT_19 (
    dept_no CHAR(6)
    , dept_nm VARCHAR2(150) NOT NULL
    , CONSTRAINT TB_DEPT_19_pk PRIMARY KEY (dept_no)
);

INSERT INTO TB_DEPT_19 VALUES ('D00001', 'Data시각화팀');
INSERT INTO TB_DEPT_19 VALUES ('D00002', 'Data플랫폼팀');
INSERT INTO TB_DEPT_19 VALUES ('D00003', 'Data분석팀');
COMMIT;

CREATE TABLE TB_EMP_19 (
    emp_no CHAR(6)
    , emp_nm VARCHAR2(50) NOT NULL
    , DEPT_NO CHAR(6)
    , CONSTRAINT TB_EMP_19_PK PRIMARY KEY (emp_no)
);

INSERT INTO TB_EMP_19 VALUES ('E00001', '이경오', 'D00001');
INSERT INTO TB_EMP_19 VALUES ('E00002', '이수지', 'D00001');
INSERT INTO TB_EMP_19 VALUES ('E00003', '김효선', 'D00002');
INSERT INTO TB_EMP_19 VALUES ('E00004', '박상진', 'D00003');
COMMIT;

ALTER TABLE TB_EMP_19
ADD CONSTRAINTS TB_EMP_19_FK FOREIGN KEY (dept_no)
REFERENCES TB_DEPT_19(dept_no)
;

SELECT DISTINCT A.dept_no
FROM TB_EMP_19 A
WHERE A.dept_no = 'D00002'
UNION ALL
SELECT A.dept_no
FROM TB_EMP_19 A
WHERE A.dept_no = 'D00001'
ORDER BY dept_no
;





