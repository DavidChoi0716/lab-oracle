--단일행 함수
--하나의 행이 함수의 argument로 전달되서 하나의 결과값이 출력되는 함수

--다중행 함수(multi-row fuction, group function)
--여러개의 행이 함수의 argument로 전달되서 하나의 결과값이 출력되는 함수

--모든 사원의 급여의 총 합계, 평균, 최댓값, 최솟값, 분산, 표준편차
select sum(sal), round(avg(sal),2), max(sal), min(sal), 
    variance(sal), stddev(sal)
from emp;


--count(변수): 데이터의 갯수를 리턴
select count(*) from emp;
select count(sal) from emp;
select count(comm) from emp; -- count함수는 null이 아닌 값들의 갯수를 리턴
select count(deptno), count(distinct deptno) from emp;
--count(distinct 변수): 중복되지 않는 값들의 갯수를 리턴

--(주의) 여러 행의 결과로 출력되는 변수와 그룹함수는 함께 select할 수 없다.
select empno, count(empno)from emp; --에러 발생

--max(),min()함수는 date 타입에도 사용할 수 있음.
select max(hiredate), min(hiredate) from emp;

--order by 변수(컬럼)이름 정렬방식
--정렬 방식: 오름차순(asc), 내림차순(desc)
--오름차순 정렬이 기본값이므로 asc는 생략 가능
select*from emp order by empno desc;

--부서번호 오름차순 정렬
select*from emp order by deptno;
select*from emp order by deptno asc, empno desc;

--30번 부서 사원들의 급여의 합계, 최솟값, 최댓값, 평균
select 30 as DEPTNO,
        sum(sal)as 합계, 
        min(sal)as 최솟값, 
        max(sal)as 최댓값, 
        round(avg(sal),1)as 평균, 
        round(variance(sal),1)as 분산, 
        round(stddev(sal),1)as 표준편차       
from emp
where deptno=30
union
select 20 as DEPTNO,
        sum(sal)as 합계, 
        min(sal)as 최솟값, 
        max(sal)as 최댓값, 
        round(avg(sal),1)as 평균, 
        round(variance(sal),1)as 분산, 
        round(stddev(sal),1)as 표준편차       
from emp
where deptno=20
union
select 10 as DEPTNO,
        sum(sal)as 합계, 
        min(sal)as 최솟값, 
        max(sal)as 최댓값, 
        round(avg(sal),1)as 평균, 
        round(variance(sal),1)as 분산, 
        round(stddev(sal),1)as 표준편차       
from emp
where deptno=10;


--부서별 급여의 최소/최대/평균값을 출력
select 10 as DEPTNO, min(sal), max(sal), avg(sal) from emp where deptno = 10
union
select 20 as DEPTNO, min(sal), max(sal), avg(sal) from emp where deptno = 20
union
select 30 as DEPTNO, min(sal), max(sal), avg(sal) from emp where deptno = 30;

--모든 그룹 함수는 기본적으로 null을 제외하고 기능을 수행
select sum(comm), avg(comm), avg(nvl(comm,0)) 
from emp;


--group by를 사용한 쿼리
select deptno, avg(sal)
from emp
group by deptno
order by deptno;

-- 직책별 급여 평균, 최솟값, 최댓값
select job, round(avg(sal),2), min(sal), max(sal)
from emp
group by job;

--매니저별 급여 평균
select mgr, round(avg(sal),2) 
from emp
group by mgr
order by mgr;

select ename, deptno, avg(sal)
from emp
group by deptno;--에러가 발생
--group by에서 사용되지 않은 변수(컬럼)는 select할 수 없음!


--부서별 급여 평균 출력. 단, 평균 급여가 2000 이상인 부서만 출력
select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=2000;

select deptno, avg(sal)
from emp
where avg(sal)>=2000
group by deptno; --오류 발생
--그룹함수는 where 절에서 사용할 수 없음!

--매니저가 null이 아닌 직원들 중에서, 매니저 별로 평균 급여 출력
 select mgr, avg(sal)
 from emp
 where mgr is not null
 group by mgr;
 
 select mgr, avg(sal)
 from emp
 group by mgr
 having mgr is not null;
 
--부서별, 직책별 평균 급여
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;

select job, deptno, avg(sal)
from emp
group by job, deptno
order by job, deptno;

--1)부서별 부서번호, 부서별 평균 급여, 부서별 최고/최소 급여, 사원수를 출력
--부서번호 오름차순으로 출력, 소숫점은 반올림해서 한자리까지만 출력
select deptno as 부서번호, 
      round(avg(sal),1) as 부서별평균급여, 
      max(sal) as 부서별최고급여, 
      min(sal) as  부서별최소급여, 
      count(*) as  사원수
from emp
group by deptno
order by deptno;

--2) 같은 직책을 갖는 사원수가 3명 이상인 직책에 대해서, 직책별 사원수를 출력
select job as 직책, count(*) as 사원수
from emp
group by job
having count(*)>=3
order by 사원수;
--select에서 만든 컬럼의 별명(alias)는 
--group by, having 절에서는 사용할 수 없음!

--3) 입사 연도, 입사 연도별 급여 평균, 급여 최소/최댓값을 출력. 입사연도를 'YYYY'형식으로 출력
select to_char(hiredate,'YYYY')as H_YEAR, 
      avg(sal), 
      min(sal), 
      max(sal) 
from emp
group by to_char(hiredate,'YYYY')
order by H_YEAR;


--4) 입사 연도별, 부서별로 몇 명이 입사했는 지를 출력
select to_char(hiredate,'YYYY') as YEAR, deptno, count(*)
from emp
group by to_char(hiredate,'YYYY'), deptno
order by YEAR, deptno;

--5) 수당(comm)을 받는 직원수와 받지 않는 직원수를 출력
select nvl2(comm,'수당을 받는 직원 수 ','수당을 받지 않는 직원수'), count(*)
from emp
group by nvl2(comm,'수당을 받는 직원 수 ','수당을 받지 않는 직원수') 
order by nvl2(comm,'수당을 받는 직원 수 ','수당을 받지 않는 직원수');


