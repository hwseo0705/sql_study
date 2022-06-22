
SELECT
    UPPER(first_name)
FROM employees
;

SELECT
    LOWER(first_name)
FROM employees
;

SELECT
    first_name, LENGTH(first_name)
FROM employees
;

SELECT
    first_name, last_name
FROM employees
WHERE LOWER(first_name) = 'david'
; -- doesn't work cuz 'david' doesn't exist
-- so make it LOWER()

-- Q. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. 
--          �� ���� ��Ī�� name�Դϴ�.
--  ����3 ) �޿��� ��ü 10�ڸ��� ����ϵ� �������ڸ��� *�� ����մϴ�. 
--           �� ���� ��Ī�� salary�Դϴ�.
SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') Name, LPAD(salary, 10, '*') Salary
FROM employees
WHERE LOWER(job_id) = 'it_prog'
;