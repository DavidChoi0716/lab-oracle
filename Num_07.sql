/*
ex 7.
(1) ���� �̸��� �� ������ �Ŵ��� �̸��� ����ϴ� SQL �ۼ�. ��, �Ŵ����� ���� ������ ����ؾ� ��.
(��� ����)
emp_name mgr_name
FORD	 JONES
SCOTT	 JONES
JAMES	 BLAKE
......
KING

  

(2) SCOTT�� �Ŵ��� �̸��� ����ϴ� SQL �ۼ�.


(3) ���� �̸��� �Ķ���Ϳ� �����ϸ� �Ŵ����� �̸��� �����ϴ� �Լ��� �ۼ��ϰ� ����� Ȯ��.
*/

--(1)
 select e1.ename, e2.ename from emp e1, emp e2
        where e1.mgr = e2.empno(+);
        
--(2)  
    select ename from emp
        where empno = (select mgr from emp where ename = 'SCOTT');

-- (3) 
   set serveroutput on;
   
    create or replace function func_mgr (e_name varchar2) return varchar2
        is v_mgr emp.ename%type;
    begin
        select e2.ename into v_mgr
            from emp e1, emp e2 where e1.mgr = e2.empno(+) and upper(e1.ename) = upper(e_name);
    return v_mgr;
    end;
    /
        
    select func_mgr('scott') from dual;
    select func_mgr('king') from dual;
    select func_mgr('allen') from dual;
    
    
    
    