set serveroutput on; --새로운 시트 사용

-- 1) 이름을 입력받아서
-- 사번, 부서번호를 검색해서
-- 사번, 이름, 부서번호를 출력

accept p_ename prompt '이름을 입력하세요.';

declare
      v_empno number(4,0);
      v_deptno number(2,0);
begin
      select empno, deptno into v_empno, v_deptno from emp where upper(ename)= trim(upper('&p_ename'));
      
      dbms_output.put_line ('사번:'||v_empno);
      dbms_output.put_line ('이름:'||'&p_ename');
      dbms_output.put_line ('부서번호:'||v_deptno);
      
end;
/



-- 2) 이름을 입력받아서
-- emp, dept 테이블을 사용해서(JOIN))
-- 'SCOTT은 DALLAS의 RESEARCH부서에서 근무합니다.'와 같은 형식으로 출력


accept p_ename prompt '이름을 입력하세요.';

declare
    v_e.ename varchar2(10);
    v_d.loc varchar2(13);
    v_e.dname varchar2(14);
    
begin
    select e.ename, d.loc, e.dname into v_e.ename, v_d.loc, v_e.dname  
    from emp e join dept d on 'e.dname' = 'd.dname'
    where e.ename = '&p_ename';
    
    dbms_output.put_line (v_e.ename || '은' || v_d.loc || '의' || v_e.dname || '부서에서 근무합니다.');
    
end;
/


accept p_name prompt '이름을 입력하세요.';

declare
  v_ename varchar2(100) := '&p_name'; --입력받은 이름을 저장하는 변수
  v_loc varchar2(13);  --부서위치(loc)를 저장할 변수
  v_dname varchar2(14);   -- 부서 이름을 저장할 변수
begin
 select d.dname, d.loc into v_dname, v_loc
 from emp e join dept d
 on e.deptno = d.deptno
 where upper(e.ename) = upper(trim(v_ename));
 
 dbms_output.put_line(v_ename || '은(는) ' || 
                      v_loc || ' 의 ' ||
                      v_dname || '부서에서 근무합니다.');
 end;
 /
 
 
--Logic (논리)
--1. 사원의 이름
--2. emp: deptno
--3. dept: loc, dname

accept p_name prompt '이름을 입력하세요...';

declare
     v_ename varchar2(20) := upper(trim('&p_name'));
     v_dname varchar2(14);
     v_loc varchar2(13);
     v_deptno number(2);
     
begin
-- 사원 이름으로 그 사원이 근무하는 부서 번호를 검색
 select deptno into v_deptno from emp where upper(ename) = v_ename;
 
 --부서 번호를 사용해서 부서의 이름, 위치를 검색
 select loc, dname into v_loc, v_dname from dept where deptno = v_deptno;
 
  --검색한 정보를 화면에 출력
  dbms_output.put_line(v_ename || ':' || v_loc || ':' || v_dname);
  
end;
/
 

