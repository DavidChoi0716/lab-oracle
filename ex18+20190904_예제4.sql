/*
1. 테이블 복사 SQL 문 작성
  1) emp 테이블을 복사해서 emp2를 생성
  2) dept 테이블을 복사해서 dept2를 생성
  3) salgrade 테이블을 복사해서 salgrade2를 생성

2. dept2 테이블에 아래와 같은 부서 정보를 등록하는 SQL 문 작성
  deptno  dname   loc
  -----------------------
  50      ORACLE  Seoul
  60      SQL     Jeju
  70      DDL     Pusan
  80      DML     Incheon
  
3. 2에서 등록한 부서에서 근무하는 사원 정보(empno, ename, job, mgr, hiredate, sal, comm)를 자유롭게 emp2 테이블에 등록하는 SQL 문 작성

*/

--1.
create table emp2  as (select*from emp);
create table dept2 as (select*from dept);
create table salgrade2 as (select*from salgrade);

--2.
insert into dept2(deptno, dname, loc) values(50, 'ORACLE', 'Seoul');
insert into dept2(deptno, dname, loc) values(60, 'SQL ', 'Jeju');
insert into dept2(deptno, dname, loc) values(70, 'DDL ', 'Pusan');
insert into dept2(deptno, dname, loc) values(80, 'DML ', 'Incheon');
select*from dept2;

--3.
insert into emp2(empno, ename, job, mjgr, hiredate, sal, comm, deptno)
values (7201, 'test1', 'CLERK', 7788,
        to_date('2019-09-04', 'YYYY-MM-DD'),4500, null, 50);
        
insert into (


insert into (


insert into (


/*
4. emp2 테이블에서 20번 부서에서 근무하는 사원들의 평균 급여/보다 많은 급여를 받는 사원들을/ 80번 부서로 옮기는 SQL 문 작성 (subquery)

5. emp2 테이블의 사원들 중에, 10번 부서의 사원 중 입사일이 가장 늦은 사람보다 더 늦게 입사한 사원들의 급여를 10% 인상하고, 부서를 70번으로 이동하는 SQL 문 작성 (subquery)

6. emp2 테이블의 사원들 중 급여 등급이 5인 사원을 삭제하는 SQL 문 작성 (join)

7. 모든 작업 결과를 데이터베이스에 영구히 저장 (commit)
*/

--4. 
select avg(sal) from emp2 where deptno=20;

update emp2
set deptno=80
where sal> (
     select avg(sal) from emp2 where deptno=20
);

select*from emp2;

--5. 
select max(hiredate) from emp2 where deptno =10;

update emp2
set sal=sal*1.1, deptno=70
where hiredate > (
    select max(hiredate) from emp2 where deptno =10
);


select*from emp2;


--6.
select e.empno, e.sal, s.grade
from emp2 e join salgrade2 s
on e.sal between s.losal and s.hisal
where s.grade =5;

delete from emp2
where empno in (
  select e.empno
  from emp2 e join salgrade2 s
  on e.sal between s.losal and s.hisal
  where s.grade =5
);

delete from emp2
where sal between 3001 and 9999;

delete from emp2
where sal between 
           (select losal from salgrade where grade=5) 
           and 
           (select hisal from salgrade where grade=5);
           


--7.
commit;
