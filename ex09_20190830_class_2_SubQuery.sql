--Sub Query

--*[단일행]
--사번이 7369번인 사원의 매니저 사번
select mgr from emp where empno = 7369;
--사번이 7902번 사원의 이름
select ename from emp where empno=7902;

select ename from emp
where empno = (
 select mgr from emp where empno = 7369
);

--사원 테이블에서 평균 급여보다 더 많은 급여를 받는 직원들만 출력
select* 
from emp
where sal > (
select avg(sal) from emp
);

--AllEN보다 comm을 더 많이 받는 직원 정보 출력
select*
from emp
where comm > (
select comm from emp where ename = 'ALLEN'
);

--*[다중행]
--부서 번호가 20 또는 30번인 직원들의 정보를 출력
select*from emp where deptno=20 or deptno=30; 
select*from emp where deptno in (20,30);

-- 각 부서의 급여 최솟값과 같은 급여를 받는 직원들의 정보를 출력
select min(sal) from emp group by deptno ;
select*from emp where sal in (950,800,1300);

select*from emp
where sal in(
select min(sal) from emp group by deptno 
);

--각 부서에서 급여 최솟값을 받는 직원 정보를 출력
select deptno, min(sal)from emp group by deptno;

select*from emp 
where (deptno, sal) in (
select deptno, min(sal)from emp group by deptno
);

--sub query와 all/any(자체에 비교에 의미가 없기 때문에 등호가 필요/즉,비교 연산자 사용이 가능하다)
--in(자체에 비교에 의미가 있기 때문에 등호가 필요 없음)
select min(sal) from emp group by deptno;
select*from emp where sal in (950,800,1300);
select*from emp where sal = any (950,800,1300);
select*from emp where sal > any (950,800,1300);
select*from emp where sal = all (950,800,1300);
select*from emp where sal > all (950,800,1300);

select*from emp where sal in (select min(sal) from emp group by deptno);
select*from emp where sal = any (select min(sal) from emp group by deptno);
select*from emp where sal > any (select min(sal) from emp group by deptno);
select*from emp where sal = all (select min(sal) from emp group by deptno);
select*from emp where sal > all (select min(sal) from emp group by deptno);






