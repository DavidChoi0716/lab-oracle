--������ �����ϴ� ���ڵ� �˻�
--select �÷��̸�,  ....  from ���̺��̸� where ����;

--��� ���̺��� �μ� ��ȣ�� 10���� ������� ��� �÷��� �˻�
select*from emp where deptno=10;
select*from emp where deptno=20;
select*from emp where deptno=30;
select*from emp where deptno=40;

--��� ���̺��� �޿��� 2500 �̻�(>=)�� �������� �˻�
select*from emp where sal>=2500;

--��� ���̺��� �޿��� 1000�̻�, 2000�̸��� �������� ��� �÷��� �˻�
select*from emp 
where sal>=1000 and sal<=2000;

--��� ���̺��� �޿��� 3000�̻�, 5000�̸��� �������� ��� �÷��� �˻�
select*from emp 
where sal>=3000 and sal<5000;

--��� ���̺��� �޿��� 3000�̻�, 5000������ �������� ��� �÷��� �˻�
select*from emp 
where sal>=3000 and sal<=5000;

select*from emp
where sal between 3000 and 5000;

--��� ���̺��� �޿��� 1000 �����̰ų� �Ǵ� 5000 �̻��� �������� ��� �÷� ����
select*from emp
where sal<=1000 or sal>=5000;

--��� ���̺��� �μ���ȣ�� 10 �Ǵ� 20�� �������� ��� �÷� �˻�
select*
from emp
where deptno=10 or deptno=20;

select*
from emp
where deptno in (10,20);

--��� ���̺��� �μ���ȣ�� 10���� �ƴ� �������� ��� ���� �˻�
--�ٸ�: !=, <>, ^=
select*
from emp
where deptno !=10;

select*
from emp
where not deptno =10;

--��� ���̺��� ��å�� 'CLERK'�� �������� ��� ������ �˻�
select*
from emp
where job = 'CLERK';
--oracle���� �����(select, from, where, ...,) ���̺� �̸�, �÷� �̸��� ��ҹ��ڸ� �������� �ʴ´�.
--���̺� ����� ���� ��ҹ��ڸ� ������. 'CLERK' != 'Clerk'

select*
from emp
where ename > 'FQ';
--���ڿ��� ũ�� �񱳰� ������


--1)��� ���̺��� �μ���ȣ�� 20���̰ų� ��å�� 'SALESMAN'�� 
--������� ��� ������ �˻�
select*
from emp
where deptno=20 or job ='SALESMAN';

--2)��� ���̺��� ��å�� 'CLERK'�̰ų� 'ANALYST' �Ǵ� 'MANAGER'�� 
--������� ��� ������ �˻�
select*
from emp
where job='CLERK'
     or job='ANALYST'
     or job='MANAGER';
     
select*
from emp
where job in ('CLERK','ANALYST', 'MANAGER');

--3)��� ���̺��� ��å�� 'CLERK', 'ANALYST','MANAGER'�� �ƴ�
--�������� ��� ������ �˻�
select*
from emp
where job !='CLERK'
     and job !='ANALYST'
     and job !='MANAGER';

select*
from emp
where not job in ('CLERK','ANALYST', 'MANAGER');

--����Ŭ���� ���ڿ��� �׻� ���� ����ǥ('')�� ���
--�÷��� ����(alias)������ ū����ǥ("")�� �����
select empno ��� from emp;
select empno "���" from emp;
select empno as ��� from emp;
select empno as "���" from emp;


--��� ���̺��� �̸��� 'A'�� �����ϴ� �������� ��� ������ �˻�
select*
from emp
where ename like'A%';

select*
from emp
where ename like'A_';

select*
from emp
where job like '_LERK';

select*
from emp
where job like '_ERK';

select*
from emp
where job like '%ERK';

select*
from emp
where job like '%E%';

--���� ���̺��� ����(commision)�� null�� �������� ��� ������ �˻�
select*
from emp 
where comm is null;

--���� ���̺��� ����(commision)�� null�� �ƴ� �������� ��� ������ �˻�
select*
from emp 
where not(comm is null);

-- select*from emp where comm not is null; -- ����

--���� ���̺��� ����(commission)�� �޴� ������ �߿��� �޿��� 1500�� �ʰ��ϴ� ������ 
--���, �̸�, �޿��� �˻�
select empno, ename, sal
from emp
where (comm is not null) and (sal>1500);


--���� ���̺��� ����(commission)�� ���� �ʴ� ������ �߿��� �޿��� 1500�� �ʰ��ϴ� ������ 
--���, �̸�, �޿��� �˻�
select empno, ename, sal
from emp
where (comm is null) and (sal>1500);

--���տ�����: ������(union), ������(intersect), ������(minus)
select*from emp where deptno = 10 or deptno = 20;

select*from emp where deptno = 10
union
select*from emp where deptno = 20;

--���տ����ڸ� ����� �� �ΰ��� select������ ���� �÷����� ���� ������ �˻��ؾ� ��!
select empno, ename, deptno  from emp where deptno =10
union
select empno, ename, deptno from emp where deptno =20;

--�̸��� 'E'�� �����ϴ� ��� ���� ���� > A
select*
from emp
where ename like '%E%';

--��å�� 'E'�� �����ϴ� ��� ���� ���� > B
select*
from emp
where job like '%E%';

--�� ������ ������
select*
from emp
where ename like '%E%'
intersect
select*
from emp
where job like '%E%';

--�� ������ ������ (B-A)
select*
from emp
where job like '%E%'
minus
select*
from emp
where ename like '%E%';

--1) 30�� �μ����� ���ϴ� ��å�� SALESMAN�� ��������
--���, �̸�, �޿�, �μ���ȣ�� �˻�
 select empno, ename, sal, deptno
 from emp
 where deptno = 30 and job = 'SALESMAN';

--2) 20,30�� �μ����� �ٹ��ϴ� ������ �� �޿��� 2000�� �ʰ��ϴ�
--�������� ���, �̸�, �޿�, �μ���ȣ�� �˻�
 select empno, ename, sal, deptno
 from emp
 where (deptno = 20 or deptno = 30) and (sal > 2000);
 
select empno, ename, sal, deptno
from emp
where deptno in(20,30) and sal > 2000;
 
 
--3)������ ���� ������ �߿���, �Ŵ����� �ְ�, ��å�� 'MANAGER' �Ǵ� 'CLERK'��
--�������� ���, �̸�, �޿�, �μ���ȣ�� �˻�
select empno, ename, sal, deptno
from emp
where (comm is null) 
    and (mgr is not null) 
    and (job='MANAGER' or job='CLERK'); 


select empno, ename, sal, deptno
from emp
where (comm is null) 
    and (mgr is not null) 
    and job in ('MANAGER','CLERK'); 
    

