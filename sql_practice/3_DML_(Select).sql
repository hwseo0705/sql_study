-- SELECT Basics
SELECT 
    emp_no, emp_nm
FROM tb_emp;

SELECT
    certi_cd, certi_nm
FROM tb_certi;

SELECT
    *
FROM tb_dept;

SELECT 
    emp_nm, emp_no
FROM tb_emp;

-- DISTINCT : 중복값을 제외하고 조회
SELECT DISTINCT issue_insti_nm 
FROM tb_certi;

SELECT DISTINCT certi_nm, issue_insti_nm -- find distinct pairs
FROM tb_certi;

-- 열 별칭 (column alias)
SELECT
    certi_cd AS "certificate id" -- space allowed with ""
    , certi_nm AS certificate_name -- space not allowed without ""
    , issue_insti_nm institute -- 'AS' optional
FROM tb_certi;

-- 문자열 결합 연산자 ||
-- ex) SQLD (100002) - 한국데이터진흥원
SELECT
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "자격증 정보"
FROM tb_certi;

-- Dummy Table (dual) : 단순 연산 결과를 조회할 때 사용
SELECT
    3 * 7 AS "연산 결과"
FROM dual;

SELECT
   SYSDATE AS "Current Date"
FROM dual;

















