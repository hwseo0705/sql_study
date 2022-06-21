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

-- DISTINCT : �ߺ����� �����ϰ� ��ȸ
SELECT DISTINCT issue_insti_nm 
FROM tb_certi;

SELECT DISTINCT certi_nm, issue_insti_nm -- find distinct pairs
FROM tb_certi;

-- �� ��Ī (column alias)
SELECT
    certi_cd AS "certificate id" -- space allowed with ""
    , certi_nm AS certificate_name -- space not allowed without ""
    , issue_insti_nm institute -- 'AS' optional
FROM tb_certi;

-- ���ڿ� ���� ������ ||
-- ex) SQLD (100002) - �ѱ������������
SELECT
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "�ڰ��� ����"
FROM tb_certi;

-- Dummy Table (dual) : �ܼ� ���� ����� ��ȸ�� �� ���
SELECT
    3 * 7 AS "���� ���"
FROM dual;

SELECT
   SYSDATE AS "Current Date"
FROM dual;

















