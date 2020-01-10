--������ �Լ�
--�ϳ��� ���� �Լ��� argument�� ���޵Ǽ� �ϳ��� ������� ��µǴ� �Լ�

--������ �Լ�(multi-row fuction, group function)
--�������� ���� �Լ��� argument�� ���޵Ǽ� �ϳ��� ������� ��µǴ� �Լ�

--��� ����� �޿��� �� �հ�, ���, �ִ�, �ּڰ�, �л�, ǥ������
select sum(sal), round(avg(sal),2), max(sal), min(sal), 
    variance(sal), stddev(sal)
from emp;


--count(����): �������� ������ ����
select count(*) from emp;
select count(sal) from emp;
select count(comm) from emp; -- count�Լ��� null�� �ƴ� ������ ������ ����
select count(deptno), count(distinct deptno) from emp;
--count(distinct ����): �ߺ����� �ʴ� ������ ������ ����

--(����) ���� ���� ����� ��µǴ� ������ �׷��Լ��� �Բ� select�� �� ����.
select empno, count(empno)from emp; --���� �߻�

--max(),min()�Լ��� date Ÿ�Կ��� ����� �� ����.
select max(hiredate), min(hiredate) from emp;

--order by ����(�÷�)�̸� ���Ĺ��
--���� ���: ��������(asc), ��������(desc)
--�������� ������ �⺻���̹Ƿ� asc�� ���� ����
select*from emp order by empno desc;

--�μ���ȣ �������� ����
select*from emp order by deptno;
select*from emp order by deptno asc, empno desc;

--30�� �μ� ������� �޿��� �հ�, �ּڰ�, �ִ�, ���
select 30 as DEPTNO,
        sum(sal)as �հ�, 
        min(sal)as �ּڰ�, 
        max(sal)as �ִ�, 
        round(avg(sal),1)as ���, 
        round(variance(sal),1)as �л�, 
        round(stddev(sal),1)as ǥ������       
from emp
where deptno=30
union
select 20 as DEPTNO,
        sum(sal)as �հ�, 
        min(sal)as �ּڰ�, 
        max(sal)as �ִ�, 
        round(avg(sal),1)as ���, 
        round(variance(sal),1)as �л�, 
        round(stddev(sal),1)as ǥ������       
from emp
where deptno=20
union
select 10 as DEPTNO,
        sum(sal)as �հ�, 
        min(sal)as �ּڰ�, 
        max(sal)as �ִ�, 
        round(avg(sal),1)as ���, 
        round(variance(sal),1)as �л�, 
        round(stddev(sal),1)as ǥ������       
from emp
where deptno=10;


--�μ��� �޿��� �ּ�/�ִ�/��հ��� ���
select 10 as DEPTNO, min(sal), max(sal), avg(sal) from emp where deptno = 10
union
select 20 as DEPTNO, min(sal), max(sal), avg(sal) from emp where deptno = 20
union
select 30 as DEPTNO, min(sal), max(sal), avg(sal) from emp where deptno = 30;

--��� �׷� �Լ��� �⺻������ null�� �����ϰ� ����� ����
select sum(comm), avg(comm), avg(nvl(comm,0)) 
from emp;


--group by�� ����� ����
select deptno, avg(sal)
from emp
group by deptno
order by deptno;

-- ��å�� �޿� ���, �ּڰ�, �ִ�
select job, round(avg(sal),2), min(sal), max(sal)
from emp
group by job;

--�Ŵ����� �޿� ���
select mgr, round(avg(sal),2) 
from emp
group by mgr
order by mgr;

select ename, deptno, avg(sal)
from emp
group by deptno;--������ �߻�
--group by���� ������ ���� ����(�÷�)�� select�� �� ����!


--�μ��� �޿� ��� ���. ��, ��� �޿��� 2000 �̻��� �μ��� ���
select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=2000;

select deptno, avg(sal)
from emp
where avg(sal)>=2000
group by deptno; --���� �߻�
--�׷��Լ��� where ������ ����� �� ����!

--�Ŵ����� null�� �ƴ� ������ �߿���, �Ŵ��� ���� ��� �޿� ���
 select mgr, avg(sal)
 from emp
 where mgr is not null
 group by mgr;
 
 select mgr, avg(sal)
 from emp
 group by mgr
 having mgr is not null;
 
--�μ���, ��å�� ��� �޿�
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;

select job, deptno, avg(sal)
from emp
group by job, deptno
order by job, deptno;

--1)�μ��� �μ���ȣ, �μ��� ��� �޿�, �μ��� �ְ�/�ּ� �޿�, ������� ���
--�μ���ȣ ������������ ���, �Ҽ����� �ݿø��ؼ� ���ڸ������� ���
select deptno as �μ���ȣ, 
      round(avg(sal),1) as �μ�����ձ޿�, 
      max(sal) as �μ����ְ�޿�, 
      min(sal) as  �μ����ּұ޿�, 
      count(*) as  �����
from emp
group by deptno
order by deptno;

--2) ���� ��å�� ���� ������� 3�� �̻��� ��å�� ���ؼ�, ��å�� ������� ���
select job as ��å, count(*) as �����
from emp
group by job
having count(*)>=3
order by �����;
--select���� ���� �÷��� ����(alias)�� 
--group by, having �������� ����� �� ����!

--3) �Ի� ����, �Ի� ������ �޿� ���, �޿� �ּ�/�ִ��� ���. �Ի翬���� 'YYYY'�������� ���
select to_char(hiredate,'YYYY')as H_YEAR, 
      avg(sal), 
      min(sal), 
      max(sal) 
from emp
group by to_char(hiredate,'YYYY')
order by H_YEAR;


--4) �Ի� ������, �μ����� �� ���� �Ի��ߴ� ���� ���
select to_char(hiredate,'YYYY') as YEAR, deptno, count(*)
from emp
group by to_char(hiredate,'YYYY'), deptno
order by YEAR, deptno;

--5) ����(comm)�� �޴� �������� ���� �ʴ� �������� ���
select nvl2(comm,'������ �޴� ���� �� ','������ ���� �ʴ� ������'), count(*)
from emp
group by nvl2(comm,'������ �޴� ���� �� ','������ ���� �ʴ� ������') 
order by nvl2(comm,'������ �޴� ���� �� ','������ ���� �ʴ� ������');


