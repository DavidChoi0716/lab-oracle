--1. ��� �̸� 5������ ��� ���� empno, ename�� ���.
--����� �� �� �ڸ��� �����ְ� �������� *�� ���
--�̸��� ù ���ڸ� �����ְ� �������� *�� ���
--(��� ����)
--empno mask_no ename mask_name
-------------------------------
-- 7369    73** SMITH S****

select empno,
       Rpad(substr(empno,1,2),4,'*')as mask_no,
       ename,
       Rpad(substr(ename,1,1),5,'*')as mask_name
from emp
where length(ename)=5;

select empno,
       Rpad(trunc(empno,-2)/100,4,'*')as mask_no,
       ename,
       Rpad(substr(ename,1,1),length(ename),'*') as mask_name
from emp
where length(ename)=5;

select substr(sysdate,1,10) from dual;

--2. ������� �� ��� �ٹ��ϼ��� 21.5���̰�, �Ϸ� �ٹ� �ð��� 8�ð��̶�� �� ��,
--������� �� �޿�(day_pay), �ñ�(time_pay)�� ����Ͽ� ���.
--�� �޿��� �Ҽ��� ����° �ڸ����� ����, �ñ��� �Ҽ��� �ι�° �ڸ����� �ݿø�
--(��� ����)
--empno ename sal day_pay time_pay
----------------------------------
-- 7369 SMITH 800   37.20      4.7

select empno, ename, sal,
      trunc(sal/21.5,2) as day_pay, 
      round(sal/(21.5*8),1) as time_pay
from emp;

--3. �Ի糯¥�� �������� 3������ ���� �� ù��° �����Ͽ� �������� �ȴٰ� �� ��,
--������� �������� �Ǵ� ��¥�� YYYY-MM-DD �������� ���.
--(Hint) next_day(��¥, 'x����'): ���ƿ��� ������ ��¥�� ����
--(��� ����)
--empno ename hiredate   regular
-----------------------------------
-- 7369 SMITH 1980/12/17 1981-03-23

select empno, ename, 
    to_char(hiredate,'YYYY-MM-DD') as hiredate,
    to_char(next_day(add_months(hiredate,3),'��'),'YYYY-MM-DD') as regular,
    to_char(next_day(add_months(hiredate,3)-1,'��'),'YYYY-MM-DD') as regular_1
from emp;

select sysdate, next_day(sysdate,'��') from dual;

