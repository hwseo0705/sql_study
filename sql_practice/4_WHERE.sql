

-- WHERE ������ : ��ȸ ��� ���� �����ϴ� ������
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd = 2
; -- only female

-- PK�� WHERE�� ���������� ����� �ݵ�� �������� ��ȸ�ȴ�
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;

-- �� ������ 
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231'
;

-- BETWEEN ������
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

-- OR ����
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
    OR dept_cd = '100006'
;

-- IN ������
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006')
;

-- NOT IN ������
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006')
;

-- LIKE ������
-- �˻��� ���
-- ���ϵ� ī�� ���� (% : 0���� �̻�, _ : 1���ڸ�)
SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��%'
; -- any name that starts with '��'

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��__'
; -- �� + '_' ���� ��ŭ�� �̸�

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��%��'
; -- starts with ��, ends with ��

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%����%'
; -- �ּҰ� ������ ����鸸 SELECT

-- ������ �达�̸鼭, �μ��� 100003, 100004, 100006�� �߿� �ϳ��̸鼭, 
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ
SELECT
    emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE 1=1
    AND emp_nm LIKE '��%'
    AND dept_cd IN ('100003', '100004', '100006')
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- ���� ��ġ �� ������
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd != 2
; -- not female

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd ^= 2
; -- not female

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd <> 2
; -- not female

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE NOT sex_cd = 2
; -- not female

-- �����ڵ尡 1�� �ƴϸ鼭 ������ �̾��� �ƴ� �������
-- ���, �̸�, �����ڵ带 ��ȸ�ϼ���.
SELECT
    emp_no, emp_nm, sex_cd
FROM tb_emp
WHERE emp_nm NOT LIKE '��%'
    AND sex_cd <> 1
;

-- null�� ��ȸ : 'IS NULL'
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL
;

SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;

-- ������ �켱���� : NOT > AND > OR
-- ������� �߿� �达�̸鼭 ���� �Ǵ� �ϻ꿡 ��� ������� ����
SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
WHERE 1=1
    AND (emp_nm LIKE '��%'
    AND addr LIKE '%����%') OR addr LIKE '%�ϻ�%'
; -- () first in this case

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
WHERE 1=1
    AND emp_nm LIKE '��%'
    AND (addr LIKE '%����%' OR addr LIKE '%�ϻ�%')
; -- () first with 'OR' first




















