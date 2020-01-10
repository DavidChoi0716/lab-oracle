--join

--Oracle 방식의 Cross Join(Cartesian Product)
select *
from emp, dept;

--ANSI(표준) 방식의 Cross Join
select *
from emp cross join dept;

--Oracle방식의 Join (Equi Join)
select *
from emp, dept
where emp.deptno = dept.deptno
order by emp.empno;

--ANSI 방식의 Join (Equi Join)
select*
from emp e join dept d
on e.deptno = d.deptno
order by e.empno desc;


-- emp 테이블과 dept 테이블에서 
-- 사번, 이름, 부서번호, 부서이름을 출력
--1) Oracle 방식
select e.empno, e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by e.deptno asc;

--2) ANSI(표준) 방식
select e.empno, e.ename, d.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
order by e.empno;

-- emp테이블과 dept 테이블에서
-- 사번, 이름, 급여, 부서번호, 부서이름을검색
-- 단, 급여가 2000 이상인 직원만 선택

--1) Oracle 방식
select e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno 
      and
      e.sal>=2000;
     
--2) ANSI 방식
select  e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e join dept d 
on e.deptno = d.deptno 
where e.sal>=2000;


--emp 테이블과 salgrade 테이블에서
--사번, 이름, 급여, 급여 등급을 출력

--1) Oracle 방식 (Non-Equi Join)
select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

--2) ANSI 방식 (Non-Equi Join)
select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
            on e.sal >s.losal and e. sal<=s.hisal;
        
select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
            on e.sal between s.losal and s.hisal;
            
            


--emp, dept, salgrade 테이블에서  (테이블이 2개 이상인 경우)
--사번, 이름, 부서번호, 부서이름, 급여, 급여 등급을 출력 

--1) Oracle 방식 
select e.empno, e.ename, e.deptno, d.dname, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno =d.deptno 
    and 
    e.sal between s.losal and s.hisal
order by s.grade desc;

--2) ANSI 방식 
select e.empno, e.ename, e.deptno, d.dname, e.sal, s.grade
from emp e join dept d 
           on e.deptno = d.deptno
           join salgrade s 
           on e.sal between s.losal and s.hisal
order by s.grade desc;



-- emp 테이블에서 사번, 이름, 매니저 사번, 매니저 이름

--1) Oracle 방식 
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;

--2) ANSI 방식 
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 join emp e2 
            on e1.mgr = e2.empno;
            


-- emp, dept 테이블에서 사번, 이름, 부서번호, 부서이름을 출력
--dept 테이블의 모든 부서 정보를 출력
-- 1) Oracle
select e.empno, e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno (+) = d.deptno;
-- 2) ANSI
select e.empno, e.ename, d.deptno, d.dname
from emp e right join dept d
   on e.deptno = d.deptno;
   
-- 1) Oracle   
select e.empno, e.ename, d.deptno, d.dname
from dept d, emp e
where d.deptno = e.deptno (+);

-- 2) ANSI
select e.empno, e.ename, d.deptno, d.dname
from dept d left join emp e
on d.deptno = e.deptno (+);
            
            
            
-- 매니저가 존재하지 않는 king의 정보도 함께 출력
--1) Oracle 방식
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- 2) ANSI 방식
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 left join emp e2
on e1.mgr = e2.empno;

--부하 직원이 없는 사원들의 정보를 함께 출력(21 records)
--1) Oracle 방식
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr(+)= e2.empno;

--2) ANSI 방식
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 right join emp e2
     on e1.mgr= e2.empno;
    
    
--full (outer) join
--full join은 ANSI 방식의 문법만 있고, Oracle 방식의 문법은 없음
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1 full join emp e2
  on e1.mgr = e2.empno;
  
--Oracle 방식으로 full join을 하려면 union(합집합) 연산자를 사용해야 함
--양쪽에 (+)하는 방식은 없음
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1, emp e2 where e1.mgr = e2.empno(+)
union
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1, emp e2 where e1.mgr(+) = e2.empno;



--1) emp 테이블과 dept 테이블을 사용해서
--부서번호, 부서이름, 각 부서 직원들의 급여 평균, 최대, 최소값, 직원수를 출력.
--소숫점은 한자리까지만 표시.
--(결과 예시)
--deptno  dname           avg     max     min     cnt
---------------------------------------------------
--10	ACCOUNTING	2916.6	5000	1300	3

--Oracle 방식
select e.deptno, d.dname, round(avg(sal),1) as avg, max(sal) as max, min(sal)as min, count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno 
group by e.deptno, d.dname;

--ANSI 방식
select e.deptno, d.dname, round(avg(sal),1) as avg, max(sal) as max, min(sal)as min, count(*) as cnt
from emp e join dept d
on e.deptno = d.deptno 
group by e.deptno, d.dname;

--2) emp 테이블과 dept 테이블을 사용해서
--부서번호, 부서이름, 사번, 이름, 직책(job), 급여를 출력.
--단, 모든 부서가 출력되어야 함.
--(결과 예시)
--deptno  dname     empno   ename  job     sal
---------------------------------------------
--10	ACCOUNTING	7782	CLARK  Manager 2450
--...
--40	OPERATIONS	

--Oracle 방식
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d, emp e
where d.deptno  = e.deptno (+)
order by d.deptno;


--ANSI 방식
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d left join emp e
on d.deptno = e.deptno
order by d.deptno;


--3) emp, dept, salgrade 테이블에서
--부서번호, 부서이름, 사번, 이름, 매니저사번, 매니저 이름, 급여, 급여 등급을 출력.
--단, 모든 부서와 모든 사원이 출력되어야 함. 부서번호 오름차순 출력.
--(결과 예시)
--deptno  dname           empno   ename   mgr    mgr_name sal    grade
--------------------------------------------------------------------
--10	ACCOUNTING	7934	MILLER	7782	CLARK	1300	2
--10	ACCOUNTING	7839	KING			5000	5
--...
--40	OPERATIONS		

--Oracle 방식
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename as mgr_name , e1.sal, s.grade
from dept d, emp e1, emp e2, salgrade s
where d.deptno = e1.deptno (+)
     and
     e1.mgr =e2.empno(+)
     and
     e1.sal between s.losal (+) and s.hisal (+)
order by d.deptno;
     
     
--ANSI 방식
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename as mgr_name, e1.sal , s.grade
from dept d left join emp e1
               on d.deptno = e1.deptno
               left join emp e2
               on e1.mgr = e2.empno
               left join salgrade s
               on e1.sal between s.losal and s.hisal
order by d.deptno;



     
     