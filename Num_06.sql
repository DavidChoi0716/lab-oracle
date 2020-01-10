/*

ex 6. 
(1) 각 사원의 근속년수를 알아보고자 합니다. 아래와 같이 출력되도록 SQL을 작성하세요.
EMPNO   ENAME   HIREDATE                YEAR
7369	SMITH	1980-12-17 00:00:00	38
7499	ALLEN	1981-02-20 00:00:00	38
......

(2) 부서별 가장 빠른 입사 날짜를 출력하는 SQL을 작성
DEPTNO  MIN_HIREDATE
10	1981-06-09 00:00:00
20	1980-12-17 00:00:00
30	1981-02-20 00:00:00

(3) 10번 부서에서 입사 날짜가 가장 빠른 직원의 부서 번호, 사번, 이름, 근속년수를 출력하는 SQL을 작성
(결과 예시)
10, 7782, CLARK, 38

(4) 각 부서에서 입사 날짜가 가장 빠른 직원의 부서 번호, 사번, 이름, 근속년수를 출력하는 PL/SQL을 작성
(결과 예시)
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
            dbms_output.put_line('부서번호 : ' || r.deptno || ', 사번 : ' || r.empno || ', 이름 : ' || r.ename || ', 근속년수 : ' || r.year);
        end loop;
    end;
/


