--���̺� ����
--���̺��� �÷� �̸� ����
alter table ex02 rename column ex_id to eid;

--���̺��� �÷� ������ Ÿ�� ����
alter table ex02 modify ex_text varchar2(100);

--���̺��� ���ο� �÷� �߰�
alter table ex02 add ex_date date;

--���̺��� �÷� ����
alter table ex02 drop column ex_date;  

--���̺� �÷��� ���� ���� �߰�
alter table ex02
add constraint pk_ex02 primary key (eid);

--�÷��� null �Ǵ� �ߺ��� ���� �ִ� ���� PK ������ �� ����.

select*from ex02;

update ex02 set eid = 2 where eid is null;

--null ���� �÷��� not null ���� ���� �߰�
alter table ex02
add constraint nn_ex02 check (ex_text is not null) ;

--�÷��� ������ ���� ������ ����
alter table ex02
drop constraint nn_ex02;

desc ex02;

--���̺� vs ����� ����
create table ex_test (...);
create user scott2 identified by tiger;

alter user scott 
identified by tiger account unlock;

alter table ex_test 
rename column a to b;
alter user scott
identified by tiger account unlock;
drop table ex_test;
drop user scott2;


select sal from emp where ename != 'SCOTT';
select avg(sal) from (
  select sal from emp where ename != 'SCOTT'
);