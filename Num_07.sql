/*
ex 7.
(1) 직원 이름과 그 직원의 매니저 이름을 출력하는 SQL 작성. 단, 매니저가 없는 직원도 출력해야 함.
(결과 예시)
emp_name mgr_name
FORD	 JONES
SCOTT	 JONES
JAMES	 BLAKE
......
KING

  

(2) SCOTT의 매니저 이름을 출력하는 SQL 작성.


(3) 직원 이름을 파라미터에 전달하면 매니저의 이름을 리턴하는 함수를 작성하고 결과를 확인.
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
    
    
    
    