--join

--Oracle ����� Cross Join(Cartesian Product)
select *
from emp, dept;

--ANSI(ǥ��) ����� Cross Join
select *
from emp cross join dept;

--Oracle����� Join (Equi Join)
select *
from emp, dept
where emp.deptno = dept.deptno
order by emp.empno;

--ANSI ����� Join (Equi Join)
select*
from emp e join dept d
on e.deptno = d.deptno
order by e.empno desc;


-- emp ���̺�� dept ���̺��� 
-- ���, �̸�, �μ���ȣ, �μ��̸��� ���
--1) Oracle ���
select e.empno, e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by e.deptno asc;

--2) ANSI(ǥ��) ���
select e.empno, e.ename, d.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
order by e.empno;

-- emp���̺�� dept ���̺���
-- ���, �̸�, �޿�, �μ���ȣ, �μ��̸����˻�
-- ��, �޿��� 2000 �̻��� ������ ����

--1) Oracle ���
select e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno 
      and
      e.sal>=2000;
     
--2) ANSI ���
select  e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e join dept d 
on e.deptno = d.deptno 
where e.sal>=2000;


--emp ���̺�� salgrade ���̺���
--���, �̸�, �޿�, �޿� ����� ���

--1) Oracle ��� (Non-Equi Join)
select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

--2) ANSI ��� (Non-Equi Join)
select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
            on e.sal >s.losal and e. sal<=s.hisal;
        
select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
            on e.sal between s.losal and s.hisal;
            
            


--emp, dept, salgrade ���̺���  (���̺��� 2�� �̻��� ���)
--���, �̸�, �μ���ȣ, �μ��̸�, �޿�, �޿� ����� ��� 

--1) Oracle ��� 
select e.empno, e.ename, e.deptno, d.dname, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno =d.deptno 
    and 
    e.sal between s.losal and s.hisal
order by s.grade desc;

--2) ANSI ��� 
select e.empno, e.ename, e.deptno, d.dname, e.sal, s.grade
from emp e join dept d 
           on e.deptno = d.deptno
           join salgrade s 
           on e.sal between s.losal and s.hisal
order by s.grade desc;



-- emp ���̺��� ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸�

--1) Oracle ��� 
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;

--2) ANSI ��� 
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 join emp e2 
            on e1.mgr = e2.empno;
            


-- emp, dept ���̺��� ���, �̸�, �μ���ȣ, �μ��̸��� ���
--dept ���̺��� ��� �μ� ������ ���
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
            
            
            
-- �Ŵ����� �������� �ʴ� king�� ������ �Բ� ���
--1) Oracle ���
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- 2) ANSI ���
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 left join emp e2
on e1.mgr = e2.empno;

--���� ������ ���� ������� ������ �Բ� ���(21 records)
--1) Oracle ���
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1, emp e2
where e1.mgr(+)= e2.empno;

--2) ANSI ���
select e1.empno, e1.ename, e1.mgr, e2.ename
from emp e1 right join emp e2
     on e1.mgr= e2.empno;
    
    
--full (outer) join
--full join�� ANSI ����� ������ �ְ�, Oracle ����� ������ ����
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1 full join emp e2
  on e1.mgr = e2.empno;
  
--Oracle ������� full join�� �Ϸ��� union(������) �����ڸ� ����ؾ� ��
--���ʿ� (+)�ϴ� ����� ����
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1, emp e2 where e1.mgr = e2.empno(+)
union
select e1.empno, e1.ename, e2.empno, e2.ename
from emp e1, emp e2 where e1.mgr(+) = e2.empno;



--1) emp ���̺�� dept ���̺��� ����ؼ�
--�μ���ȣ, �μ��̸�, �� �μ� �������� �޿� ���, �ִ�, �ּҰ�, �������� ���.
--�Ҽ����� ���ڸ������� ǥ��.
--(��� ����)
--deptno  dname           avg     max     min     cnt
---------------------------------------------------
--10	ACCOUNTING	2916.6	5000	1300	3

--Oracle ���
select e.deptno, d.dname, round(avg(sal),1) as avg, max(sal) as max, min(sal)as min, count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno 
group by e.deptno, d.dname;

--ANSI ���
select e.deptno, d.dname, round(avg(sal),1) as avg, max(sal) as max, min(sal)as min, count(*) as cnt
from emp e join dept d
on e.deptno = d.deptno 
group by e.deptno, d.dname;

--2) emp ���̺�� dept ���̺��� ����ؼ�
--�μ���ȣ, �μ��̸�, ���, �̸�, ��å(job), �޿��� ���.
--��, ��� �μ��� ��µǾ�� ��.
--(��� ����)
--deptno  dname     empno   ename  job     sal
---------------------------------------------
--10	ACCOUNTING	7782	CLARK  Manager 2450
--...
--40	OPERATIONS	

--Oracle ���
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d, emp e
where d.deptno  = e.deptno (+)
order by d.deptno;


--ANSI ���
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d left join emp e
on d.deptno = e.deptno
order by d.deptno;


--3) emp, dept, salgrade ���̺���
--�μ���ȣ, �μ��̸�, ���, �̸�, �Ŵ������, �Ŵ��� �̸�, �޿�, �޿� ����� ���.
--��, ��� �μ��� ��� ����� ��µǾ�� ��. �μ���ȣ �������� ���.
--(��� ����)
--deptno  dname           empno   ename   mgr    mgr_name sal    grade
--------------------------------------------------------------------
--10	ACCOUNTING	7934	MILLER	7782	CLARK	1300	2
--10	ACCOUNTING	7839	KING			5000	5
--...
--40	OPERATIONS		

--Oracle ���
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename as mgr_name , e1.sal, s.grade
from dept d, emp e1, emp e2, salgrade s
where d.deptno = e1.deptno (+)
     and
     e1.mgr =e2.empno(+)
     and
     e1.sal between s.losal (+) and s.hisal (+)
order by d.deptno;
     
     
--ANSI ���
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename as mgr_name, e1.sal , s.grade
from dept d left join emp e1
               on d.deptno = e1.deptno
               left join emp e2
               on e1.mgr = e2.empno
               left join salgrade s
               on e1.sal between s.losal and s.hisal
order by d.deptno;



     
     