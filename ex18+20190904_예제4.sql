/*
1. ���̺� ���� SQL �� �ۼ�
  1) emp ���̺��� �����ؼ� emp2�� ����
  2) dept ���̺��� �����ؼ� dept2�� ����
  3) salgrade ���̺��� �����ؼ� salgrade2�� ����

2. dept2 ���̺� �Ʒ��� ���� �μ� ������ ����ϴ� SQL �� �ۼ�
  deptno  dname   loc
  -----------------------
  50      ORACLE  Seoul
  60      SQL     Jeju
  70      DDL     Pusan
  80      DML     Incheon
  
3. 2���� ����� �μ����� �ٹ��ϴ� ��� ����(empno, ename, job, mgr, hiredate, sal, comm)�� �����Ӱ� emp2 ���̺� ����ϴ� SQL �� �ۼ�

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
4. emp2 ���̺��� 20�� �μ����� �ٹ��ϴ� ������� ��� �޿�/���� ���� �޿��� �޴� �������/ 80�� �μ��� �ű�� SQL �� �ۼ� (subquery)

5. emp2 ���̺��� ����� �߿�, 10�� �μ��� ��� �� �Ի����� ���� ���� ������� �� �ʰ� �Ի��� ������� �޿��� 10% �λ��ϰ�, �μ��� 70������ �̵��ϴ� SQL �� �ۼ� (subquery)

6. emp2 ���̺��� ����� �� �޿� ����� 5�� ����� �����ϴ� SQL �� �ۼ� (join)

7. ��� �۾� ����� �����ͺ��̽��� ������ ���� (commit)
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
