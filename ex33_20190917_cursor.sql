/*

Ŀ��(cursor): PL/SQL ���ο��� SQL ������ ó���ϴ� ������ �����ϰ� �ִ� �޸� ����
(1) ����� Ŀ��(explicit cursor) : �����ڰ� ���� �̸��� �����ϰ� ����ϴ� Ŀ��
(2) ������ Ŀ��(implicit cursor) : ���ٸ� ���� ���� ����ϴ� Ŀ�� 

����� Ŀ�� ��� ����: ���� > open > fetch > close

*/

set serveroutput on;

select * from dept;

declare
  v_dept dept%rowtype;
  
begin
 select * into v_dept from dept where deptno=10;
 -- ����Ŭ DB ���ο��� ������ Ŀ���� �ڵ����� ������.
 dbms_output.put_line(v_dept.deptno);

end;
/



-- select into ������ 1�� �̻��� ��(row)�� select�Ǵ� ���� ����� �� ����.
-- ����� Ŀ���� select�� ����� ���� ������ ������� ����� �� �մ�.

declare
  -- ����� Ŀ�� ����:
  -- cursor Ŀ���̸� is (SQL����);
      cursor my_cursor is (
             select * from dept where deptno = 10
       );

     v_row dept%rowtype; -- Ŀ���� �����͸� ����(fetch)�� �� ����� ����

begin
    --Ŀ�� open(����,SQL ���� ����)
     open my_cursor;
    
    --Ŀ�� fetch(������ �б�)
     fetch my_cursor into v_row;
     dbms_output.put_line(v_row.deptno ||','|| 
                          v_row.dname||','||
                          v_row.loc);
    
    --Ŀ�� close
     close my_cursor;

end;
/


--��� ���� 1���� ����� Ŀ��
declare
   -- (1) Ŀ�� ����
   cursor sel_emp is ( 
      select * from emp where empno =7788
   );
   v_row emp%rowtype; --Ŀ�� ����� ����(fetch)�� ����
   
begin
   -- (2) Ŀ�� open
   open sel_emp;
   
   -- (3) Ŀ�� ���� ��� �б� (fetch)
   fetch sel_emp into v_row;
   dbms_output.put_line(v_row.empno || ',' ||
                        v_row.ename);
   -- (4) Ŀ�� close
   close sel_emp;

end;
/


--��� ���� �������� �� �� �ִ� ����� Ŀ�� 
declare 
    -- ����� Ŀ�� ����
   cursor sel_dept is ( 
     select * from dept
    );
    -- Ŀ�� ���� ����� fetch�� �� ����� ���� 
    v_row dept%rowtype;
    
begin
   --(2) open
    open sel_dept;
    
   --(3) fetch -- ��� ���� �������� ��� �ݺ��� �ȿ��� fetch
   loop
      fetch sel_dept into v_row;
      -- Ŀ������ ���̻� ���� ���ڵ尡 ���� �� loop�� ����
      exit when sel_dept%notfound;
          
      dbms_output.put_line(v_row.deptno || ','|| v_row.dname||','||v_row.loc);
   end loop;
   
   --(4) close
    close sel_dept;
end;
/

--emp ���̺��� �μ���ȣ�� 30���� �������� ���, �̸�, �޿��� ���

declare

  cursor sel_emp is (
    select * from emp where deptno = 30
    );
    
    v_row emp%rowtype;

begin

    open sel_emp;
    
    loop
         fetch sel_emp into v_row;   
         exit when sel_emp%notfound;
         dbms_output.put_line(v_row.empno || ','|| v_row.ename||','||v_row.sal);
         
    end loop;
    
    close sel_emp;

end;
/



--emp ���̺��� �μ���ȣ�� 10���� �������� ���, �̸�, �޿��� ���

declare

  cursor my_cursor is (
       select empno, ename, sal from emp where deptno = 10
    );
    
    type my_record is record (
      empno     emp.empno%type,
      ename     emp.ename%type,
      sal       emp.sal%type
    );  
    
    v_row my_record;
 
   
begin

    open my_cursor;
    
--    loop
--         fetch my_cursor into v_row;
--         exit when my_cursor%notfound;
--    end loop;
    
    fetch my_cursor into v_row;
    while my_cursor%found loop
       dbms_output.put_line(v_row.empno || ','|| v_row.ename||','||v_row.sal);
      fetch my_cursor into v_row;
    end loop;
    
    close my_cursor;

end;
/


-- ����� Ŀ���� for loop���� ���
-- open, fetch, close �� �ڵ����� �����.
-- for ���� in Ŀ�� loop... end loop;

declare
     cursor my_cursor is (
       select * from dept 
    );
    
begin
    for row in my_cursor loop
       dbms_output.put_line(row.deptno|| ','|| row.dname||','||row.loc);
    end loop;
    
end;
/

--����� Ŀ��, for loop�� ����ؼ�
--20�� �μ� �������� ���, �̸�, �޿��� ���

declare
    cursor my_cursor is (
    select empno, ename name, sal from emp where deptno = 20
    );
    
begin
   for row in my_cursor loop
       dbms_output.put_line(row.empno|| ','|| row.name||','||row.sal);
   end loop;
   
end;
/




-- ��ü ������ �޿� ��պ��� ���� �޿��� �޴� �������� �̸��� ����ϴ� PL/SQL
select ename from emp 
where sal < (select avg(sal) from emp);


declare
   cursor my_cursor is (
    select * from emp where sal < (select avg (sal) from emp)
    );

   v_row emp%rowtype;
    
begin

  open my_cursor;
  
  loop
  fetch my_cursor into v_row;
  exit when my_cursor%notfound;
  dbms_output.put_line(v_row.ename);
  end loop;
  
  
  close my_cursor;

end;
/


declare
   cursor my_cursor is (
    select ename from emp where sal < (select avg (sal) from emp)
    );
    
begin

  for result in my_cursor loop
     dbms_output.put_line(result.ename);
  end loop;
  
end;
/

-- �Ķ����(parameter,�Ű�����)�� ���� Ŀ�� ����
-- cursor Ŀ���̸�(���� Ÿ��, ���� Ÿ��, ...) is SQL����;

declare
   v_avg number;
   cursor my_cursor(p_avg number) is
      select ename from emp where sal < p_avg;
   
begin
    --��ü ������ �޿� ����� �˾Ƴ�
   select avg(sal) into v_avg from emp;
   dbms_output.put_line(v_avg);
   
   -- �Ķ���͸� ���� Ŀ���� open/fetch/close
   for row in my_cursor(v_avg) loop
     dbms_output.put_line(row.ename);
     
   end loop;
   
end;
/


-- 10�� �μ�����, 10�� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� 
-- �̸��� ����ϴ� PL/SQL
select deptno, ename from emp 
where sal < (
      select avg(sal) from emp where deptno = 10
) and deptno=10;


declare
    cursor my_cursor is (
    select deptno, ename from emp 
    where sal < (select avg(sal) from emp where deptno =10) 
    and deptno=10
    );

begin
  for row in my_cursor loop
   dbms_output.put_line( row.deptno || ','|| row.ename);
  end loop;
end;
/


declare 
  cursor my_cursor(p_deptno emp.deptno%type) is
      select deptno, ename from emp
      where sal < (select avg(sal) from emp where deptno=p_deptno)
      and deptno = p_deptno;

begin
   for row in my_cursor(10) loop
     dbms_output.put_line(row.deptno || ',' || row.ename);
   end loop;
end;
/





-- �� �μ�����, �� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� ��������
-- �μ���ȣ�� ���� �̸��� ����ϴ� PL/SQL

declare 
  cursor my_cursor(p_deptno emp.deptno%type) is
      select deptno, ename from emp
      where sal < (select avg(sal) from emp where deptno=p_deptno)
      and deptno = p_deptno;

begin
   for i in 1..30 loop
      for row in my_cursor(i) loop
         dbms_output.put_line(row.deptno || ',' || row.ename);
      end loop;
   end loop;
end;
/

declare 
  cursor get_deptno is
      select deptno from dept;
  cursor my_cursor (p_deptno emp.deptno%type) is
      select deptno, ename from emp
      where sal < (select avg(sal) from emp where deptno=p_deptno)
      and deptno = p_deptno;

begin
   for rlst in get_deptno loop
--       dbms_output.put_line(rlst.deptno);
      for row in my_cursor(rlst.deptno) loop
         dbms_output.put_line(row.deptno || ',' || row.ename);
      end loop;
   end loop;
end;
/


select deptno from dept;
select deptno from emp;
select distinct deptno from emp order by deptno; 


select deptno, trunc(avg(sal),0) from emp group by deptno;


declare
  cursor cur1 is 
     (select deptno, avg(sal) average from emp group by deptno) order by deptno;
     
  cursor cur2 (p_deptno emp.deptno%type, p_avg number) is
      select deptno, ename, sal from emp 
      where deptno = p_deptno and sal < p_avg;
      
begin
   for r1 in cur1 loop
      dbms_output.put_line(r1.deptno|| ','|| r1.average);
      for r2 in cur2(r1.deptno, r1.average) loop
         dbms_output.put_line( r2.deptno|| ','|| r2.ename || ','|| r2.sal );
      end loop;
   end loop;
   
end;
/


--select deptno dno, avg(sal) average from emp group by deptno;

--select a.dno 
--from (select deptno dno, avg(sal) average from emp group by deptno) a;


declare

   cursor my_cursor is
       select e.deptno, e.ename, e.sal, a.average
       from emp e join (select deptno, avg(sal) average from emp group by deptno) a
       on e.deptno = a.deptno
       where e.sal < a.average
       order by a.deptno;

begin

   for r in my_cursor loop
      dbms_output.put_line(r.deptno || ',' || r.ename);
   end loop;

end;
/

select e.deptno, e.ename, e.sal, a.average
from emp e , (select deptno, avg(sal) average from emp group by deptno) a
where e.deptno = a.deptno 
and e.sal< a.average
order by a.deptno;

