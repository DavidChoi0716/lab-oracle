/*
ex 5. 
(1) 이름이 SCOTT 인 사원의 이름과 부서 위치를 출력하는 SQL 작성.

(2) 이름을 prompt로 물어보고, 해당사원의 부서 위치를 출력하는 PL/SQL 작성. 단, 이름은 소문자로 입력해도 수행되게 작성.
(예)
이름 입력 ~ scott
SCOTT은 DALLAS에서 근무합니다
*/

--(1)
select e.ename, d.loc 
from emp e, dept d
where e.deptno = d.deptno and e.ename = 'SCOTT';


--(2)
accept p_name prompt '이름을 입력하세요.';

declare
  v_ename varchar2(100) := '&p_name'; --입력받은 이름을 저장하는 변수
  v_loc varchar2(13);  --부서위치(loc)를 저장할 변수
 
begin
 select d.loc into v_loc
 from emp e join dept d
 on e.deptno = d.deptno
 where upper(e.ename) = upper(trim(v_ename));
 
 dbms_output.put_line(v_ename || '은(는) ' || 
                      v_loc || ' 에서 근무합니다.'); 
                      
 end;
 /
