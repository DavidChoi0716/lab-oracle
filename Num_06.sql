/*

ex 6. 
(1) �� ����� �ټӳ���� �˾ƺ����� �մϴ�. �Ʒ��� ���� ��µǵ��� SQL�� �ۼ��ϼ���.
EMPNO   ENAME   HIREDATE                YEAR
7369	SMITH	1980-12-17 00:00:00	38
7499	ALLEN	1981-02-20 00:00:00	38
......

(2) �μ��� ���� ���� �Ի� ��¥�� ����ϴ� SQL�� �ۼ�
DEPTNO  MIN_HIREDATE
10	1981-06-09 00:00:00
20	1980-12-17 00:00:00
30	1981-02-20 00:00:00

(3) 10�� �μ����� �Ի� ��¥�� ���� ���� ������ �μ� ��ȣ, ���, �̸�, �ټӳ���� ����ϴ� SQL�� �ۼ�
(��� ����)
10, 7782, CLARK, 38

(4) �� �μ����� �Ի� ��¥�� ���� ���� ������ �μ� ��ȣ, ���, �̸�, �ټӳ���� ����ϴ� PL/SQL�� �ۼ�
(��� ����)
10, 7782, CLARK, 38
20, 7369, SMITH, 38
30, 7499, ALLEN, 38

*/


--(1)
select empno, ename, to_char(hiredate) as hiredate, trunc(months_between(sysdate,hiredate)/12,0) as year from emp; 

--(2)
select deptno, min(hiredate) from emp 
group by deptno
order by deptno; 

--(3)
select deptno, empno, ename, trunc(months_between(sysdate,hiredate)/12,0) as year
from emp
where hiredate = (select min(hiredate) from emp where deptno = 10)
      and deptno =10;

--(4)
select deptno, empno, ename, trunc(months_between(sysdate,hiredate)/12,0) as year
from emp where hiredate in (select min(hiredate) from emp group by deptno) order by deptno;

 declare cursor fastest_emp is (
        select deptno, empno, ename, trunc(months_between(sysdate, hiredate)/12, 0) as year from emp
            where hiredate in (select min(hiredate) from emp group by deptno)) order by deptno;
    begin
        for r in fastest_emp loop
            dbms_output.put_line('�μ���ȣ : ' || r.deptno || ', ��� : ' || r.empno || ', �̸� : ' || r.ename || ', �ټӳ�� : ' || r.year);
        end loop;
    end;
/


