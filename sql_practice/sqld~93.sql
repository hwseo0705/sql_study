
DROP TABLE ���ں�����_93;

CREATE TABLE ���ں�����_93 (
    ���� DATE,
    ����� NUMBER(5)
);

INSERT INTO ���ں�����_93 VALUES ('2015-11-01', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-02', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-03', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-04', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-05', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-06', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-07', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-08', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-09', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-10', 1000);
COMMIT;

SELECT * FROM ���ں�����_93;

-- ���� 1

SELECT A.����, SUM(A.�����) AS ���������
FROM ���ں�����_93 A
GROUP BY A.����
ORDER BY A.����
;

-- ���� 2

SELECT B.����, SUM(B.�����) AS ���������
FROM ���ں�����_93 A JOIN ���ں�����_93 B ON (A.���� >= B.����)
GROUP BY B.����
ORDER BY B.����
;

-- 86��
drop table ȸ���⺻����_86;
drop table ȸ��������_86;
CREATE TABLE ȸ���⺻����_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE ȸ��������_86 (
    user_id VARCHAR2(200)
    
);
ALTER TABLE ȸ��������_86
ADD CONSTRAINT fk_user_id 
FOREIGN KEY (user_id)
references ȸ���⺻����_86 (user_id);

INSERT INTO ȸ���⺻����_86 VALUES ('abc01');
INSERT INTO ȸ���⺻����_86 VALUES ('abc02');
INSERT INTO ȸ���⺻����_86 VALUES ('abc03');
COMMIT;


INSERT INTO ȸ��������_86 VALUES ('abc01');
INSERT INTO ȸ��������_86 VALUES ('abc02');
INSERT INTO ȸ��������_86 VALUES ('abc03');
COMMIT;

SELECT * FROM ȸ���⺻����_86;
SELECT * FROM ȸ��������_86;

-- ���� 1

SELECT user_id FROM ȸ���⺻����_86
MINUS
SELECT user_id FROM ȸ��������_86
;

-- ���� 2

SELECT user_id FROM ȸ���⺻����_86
UNION ALL
SELECT user_id FROM ȸ��������_86
;

-- ���� 3
SELECT user_id FROM ȸ���⺻����_86
INTERSECT
SELECT user_id FROM ȸ��������_86
;

-- ���� 4

SELECT A.user_id 
FROM ȸ���⺻����_86 A
JOIN ȸ��������_86 B
ON A.user_id = B.user_id
;

-- ���� 5

SELECT user_id FROM ȸ���⺻����_86
UNION
SELECT user_id FROM ȸ��������_86
;

-- ��������

CREATE TABLE �μ� (
    �μ��ڵ� NUMBER(3)
    , �μ��� VARCHAR(100)
    , �����μ��ڵ� NUMBER(3)
    , CONSTRAINT �μ��ڵ�_pk PRIMARY KEY (�μ��ڵ�)
);

CREATE TABLE ���� (
    �μ��ڵ� NUMBER(3)
    , ����� NUMBER(4)
);

INSERT INTO �μ� VALUES('100', '�ƽþƺ�', NULL);

-----------------------------------------------

DROP TABLE TB_EMP_19;
DROP TABLE TB_DEPT_19;

CREATE TABLE TB_DEPT_19 (
    dept_no CHAR(6)
    , dept_nm VARCHAR2(150) NOT NULL
    , CONSTRAINT TB_DEPT_19_pk PRIMARY KEY (dept_no)
);

INSERT INTO TB_DEPT_19 VALUES ('D00001', 'Data�ð�ȭ��');
INSERT INTO TB_DEPT_19 VALUES ('D00002', 'Data�÷�����');
INSERT INTO TB_DEPT_19 VALUES ('D00003', 'Data�м���');
COMMIT;

CREATE TABLE TB_EMP_19 (
    emp_no CHAR(6)
    , emp_nm VARCHAR2(50) NOT NULL
    , DEPT_NO CHAR(6)
    , CONSTRAINT TB_EMP_19_PK PRIMARY KEY (emp_no)
);

INSERT INTO TB_EMP_19 VALUES ('E00001', '�̰��', 'D00001');
INSERT INTO TB_EMP_19 VALUES ('E00002', '�̼���', 'D00001');
INSERT INTO TB_EMP_19 VALUES ('E00003', '��ȿ��', 'D00002');
INSERT INTO TB_EMP_19 VALUES ('E00004', '�ڻ���', 'D00003');
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





