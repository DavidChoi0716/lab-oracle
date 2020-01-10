--PL/SQL의 데이터 타입
--https://docs.oracle.com/cd/A91202_01/901_doc/appdev.901/a89856/03_types.htm
--1) Scalar(스칼라) 타입: number, varchar2, date, ..
--2) Reference(참조) 타입: 특정 테이블의 행(row) 또는 열(column)을 참조하는 타입
--   행은 여러 개의 data type 들이 복합적으로 mix 되어 있는 경우가 발생할 수 있음
--3) Compound(복합) 타입: collection(숫자를 여러 개 저장), record(복합) (20190909) 


-- 컬럼(column) 참조 타입 변수를 선언: 변수이름 테이블이름.컬럼이름%type := 값; 
-- (오라클에서는 식별자라고 부름> identifier)
-- 행(row) 참조 타입 변수를 선언: 변수이름 테이블이름%rowtype := 값;
--변수 이름은 30byte를 넘을 수 없음

set serveroutput on;

declare 
  --dept 테이블의 각 컬럼의 값들을 저장할 수 있는 변수 선언
   v_deptno dept.deptno%type := 10;
   v_dname dept.dname%type;
   v_loc dept.loc%type;

begin
  select dname, loc into v_dname, v_loc
  from dept 
  where deptno = v_deptno;

  DBMS_OUTPUT.put_line(v_deptno||':'||v_dname||':'||v_loc);

end;
/


declare
    -- emp 테이블의 행(row)의 모든 정보를 저장할 수 있는 변수를 선언
    v_emp7788 emp%rowtype;
begin
    select*into v_emp7788 from emp  where empno = 7788;
    dbms_output.put_line(v_emp7788.ename);
    dbms_output.put_line(v_emp7788.sal);
    dbms_output.put_line(v_emp7788.deptno);
    dbms_output.put_line(v_emp7788.hiredate);
end;
/


