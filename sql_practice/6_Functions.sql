-- ���� �Լ� (������ �Լ�)
-- : ���� ���� ��� �Լ��� ����
SELECT * FROM tb_sal_his;

SELECT * FROM tb_sal_his
WHERE emp_no = '1000000005'
;

-- ������ �Լ� : applies code to each row and show all
SELECT DISTINCT
    SUBSTR(emp_nm, 1, 1) ����
FROM tb_emp
;

-- ������ �Լ� : performs and shows as a single result, unless grouped
-- GROUP BY�� �ұ׷�ȭ ���� ������ �����Լ��� ��ü����� �������� �����Ѵ�.
SELECT
    SUM(pay_amt) "���� �Ѿ�"
    , AVG(pay_amt) "��� ���޾�"
    , COUNT(pay_amt) "���� Ƚ��"
FROM tb_sal_his
;

-- everything but 'COUNT(*)' doesn't include null
-- everything : COUNT, AVG, etc.
SELECT
    COUNT(emp_no) AS "�� �����"
    , COUNT(direct_manager_emp_no) "dmen" -- null ����
    , COUNT(*)
    , MIN(birth_de) "�ֿ������� ����"
    , MAX(birth_de) "�ֿ������� ����"
FROM tb_emp;

-- GROUP BY : ������ �÷����� �ұ׷�ȭ �� �� �����Լ� ����
-- �μ����� ���� � ����� �������, �������� ������� �μ��� �� ��� ���� ��ȸ

SELECT * FROM tb_emp
ORDER BY dept_cd
;

SELECT
    dept_cd
    , MAX(birth_de) �ֿ�����
    , MIN(birth_de) �ֿ�����
    , COUNT(emp_no) ������
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;

-- ����� ���� �޿� ���ɾ� ��ȸ
-- WHERE . GROUP . ORDER
SELECT
    emp_no "���"
    , SUM(pay_amt) "���� ���ɾ�" 
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

-- ������� �޿��� ���� ���� �޾�����, ���� ���� �޾�����, ��������� �� �޾Ҵ��� ��ȸ
SELECT
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "�ְ� ���ɾ�"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

-- ������� 2019�⿡ �޿��� ���� ���� �޾�����, ���� ���� �޾�����, ��������� �� �޾Ҵ��� ��ȸ
SELECT
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "�ְ� ���ɾ�"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "��� ���ɾ�"
    , TO_CHAR(SUM(pay_amt), 'L999,999,999') "����"

FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231' -- LIKE '2019%'
GROUP BY emp_no
ORDER BY emp_no
; 

SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de
;

-- HAVING : �׷�ȭ�� ������� ������ �ɾ� �� ���� ����

-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����
SELECT
    dept_cd
    , MAX(birth_de) �ֿ�����
    , MIN(birth_de) �ֿ�����
    , COUNT(emp_no) ������
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(emp_no) > 1
ORDER BY dept_cd
;

-- ������� �޿��� ���� ���� �޾�����, ���� ���� �޾�����, ��������� �� �޾Ҵ��� ��ȸ
-- ��� �޿��� 450���� �̻��� ����� ��ȸ
SELECT
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "�ְ� ���ɾ�"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

-- ������� 2019�� ��� ���ɾ��� 450���� �̻��� ����� 2019�� ���� ��ȸ
SELECT
    emp_no "���"
    , SUM(pay_amt) "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

SELECT
    emp_no
    , sex_cd
    , dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT
    dept_cd
    , COUNT(*)
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd, sex_cd
;

-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no DESC
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm DESC
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC
;

SELECT
    emp_no ���
    , emp_nm �̸�
    , addr �ּ�
FROM tb_emp
ORDER BY �̸� -- order by emp_nm
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 2 DESC
;

SELECT
    emp_no ���
    , emp_nm �̸�
    , addr �ּ�
FROM tb_emp
ORDER BY �̸�, 1 DESC
;

-- ������� 2019�� ��� ���ɾ��� 450���� �̻��� ����� 2019�� ���� ��ȸ
SELECT
    emp_no "���"
    , SUM(pay_amt) "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY �̸� -- or ORDER BY emp_no
;

SELECT
    emp_no "���"
    , SUM(pay_amt) "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC -- if I want to know the most paid
;

SELECT
    emp_no "���"
    , SUM(pay_amt) "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY pay_amt -- NOPE DOESN'T WORK, �׷� ���̿��� ������ �÷��� ������ ����� ����
; 












