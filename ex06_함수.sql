--문자열함수
--upper('sql course');
--함수 호출의 결과를 출력하기 위한 더미 테이블:dual
select upper('sql Course') from dual;
select lower('sql Course') from dual;
select initcap('sql course') from dual;

select ename, upper(ename), lower(ename), initcap(ename)
from emp;

select*from emp
where upper(ename) = upper('scott');

--직원 이름 중에 'la'가 포함된 모든 직원들의 정보를 출력
select*from emp
where upper(ename) like upper('%la%');

select*from emp
where lower(ename) like lower('%la%');

--concat
select concat('Hello','World') from dual;

--substr(문자열, 시작인덱스, 문자갯수)
--세번째 argument인 잘라낼 문자 갯수를 전달하지 않는 경우에는
--문자열에서 시작인덱스부터 그 문자열의 끝까지 잘라냄
--Hello
--12345
select substr('HelloWorld',1,5) from dual;
select substr('HelloWorld',1,4) from dual;
select substr('HelloWorld',2,4) from dual;
select substr('HelloWorld',2) from dual;
select substr('http://www.google.com',8) from dual;

--length(문자열):글자수(문자의 갯수)를 리턴
select lengthb('Hello') from dual;
select lengthb('집에가지마 baby') from dual;
select length('Hello'), lengthb('Hello') from dual;
select length('한글'), lengthb('한글') from dual;

--emp 테이블에서 직원 이름이 6글자 이상인 직원들의 레코드를 출력
 select ename
 from emp
 where length(ename) >= 6;
 
 --instr함수
 select instr('HelloWorld','W') from dual;
 select instr('HelloWorld','w') from dual;
 select instr(lower('HelloWorld'),'w') from dual;
 select instr('HelloWorld','l') from dual;
 select instr('HelloWorld','l',5) from dual;
 
--LPAD/RPAD함수
select lpad('hello',10) from dual;
--공백을 왼쪽에 끼워 넣겠다
select Rpad('hello',10) from dual;
--공백을 오른쪽에 끼워 넣겠다

select lpad('hello',10,'*') from dual;
--마지막의 별표 문자열을 왼쪽에 끼워 넣겠다.
select Rpad('hello',10,'*') from dual;
--마지막의 별표 문자열을 오른쪽에 끼워 넣겠다.

select Rpad(substr('hello',1,1),length('hello'),'*') from dual;
select Rpad('h',5,'*') from dual;


-- Replace 함수:원본 문자열,바꾸고 싶은 문자, 바꿀 문자 (교체)
select replace('jack and jue','j','bl') from dual;

--Trim 함수: 잘라내기(모든 h를 제거하는 것이 아니고 양쪽끝에 있는 모든 h를 제거)
select trim('h' from 'hello hello ollehhhhhhh') from dual;
select trim(' ' from '    hello hello olleh      ') from dual;
select trim(' ' from '    hello    hello    olleh      ') from dual;


--숫자 관련된 함수
--round(): 반올림
select round(1234.5678,0), round(1234.5678,1),round(1234.5678,2),
      round(1234.5678,-1), round(1234.5678,-2)
from dual;

--trunc(): 버림
select trunc(1234.5678,0), trunc(1234.5678,1),trunc(1234.5678,2),
     trunc(1234.5678,-1), trunc(1234.5678,-2)
from dual;

-- mod(): 나눈 나머지를 계산
select mod(7, 3) from dual;
select 7 / 3 from dual;

--나눈 몫을 계산
select trunc(7/3) from dual;

--ceil():올림,floor():내림
select ceil(3.14), floor(3.14) from dual;
select ceil(-3.14), floor(-3.14) from dual;

--날짜 관련 함수
select sysdate from dual;
select add_months(sysdate,1) from dual;
select sysdate+1 from dual;

select sysdate+2 from dual;
select add_months(sysdate+2,1) from dual;

select months_between(sysdate, hiredate)from emp;
select months_between(hiredate, sysdate)from emp;

select round(sysdate, 'YYYY'), round(sysdate, 'Q')
from dual;

select trunc(sysdate, 'YYYY'), trunc(sysdate, 'Q')
from dual;


--데이터 타입 변환 함수
--to_char(); 문자열을 리턴 > 날짜 데이터를 입력 받아서 문자로 출력
--to_number(); 숫자를 리턴 > 문자열을 입력 받아서 숫자로 출력
--to_date(); 날짜를 리턴 > 문자열을 입력 받아서 날짜로 출력


--오라클에서 사칙연산자(+,-,*,/)는 숫자 타입에서만 사용 가능 
--(date 타입은 +, -가 가능)
select '1000'+'100' from dual;
--오라클은 숫자로 변환할 수 있는 문자열들인 경우에는
--묵시적으로 타입 변환을 수행한 후 사칙 연산 계산을 함.
select '1000'+'abc' from dual;
--숫자로 변환할 수 없는 문자열인 경우 사칙 연산을 하면 invalid number에러가 발생됨.

select '1,000'+'100'from dual; --invalid number 에러가 발생됨
select to_number('1,000','999,999')+ to_number('100','999')
from dual;

select to_number('1,000','9,999')+ to_number('100','999')
from dual;

select to_number('12,000','9,999')+ to_number('100','999')
from dual;

--날짜(date) 타입의 값은 SQL Developer의 환경설정에서 설정된 형식으로 출력됨
--도구 -> 환경설정 -> 데이터베이스 -> NLS(National Language Support)
--날짜 데이터를 원하는 형식으로 출력하고 싶을 때 to_char(날짜, 형식) 함수를 사용
select sysdate,
       to_char(sysdate, 'YY-MM-DD'),
       to_char(sysdate, 'PM HH:MI:SS'),
       to_char(sysdate, 'DY'),
       to_char(sysdate, 'DAY')
from dual;


-- to_date(문자열, 날짜형식)
select to_date('2019/08/29'),to_date('19/08/29') from dual;
select to_date('2019/08/29','YYYY/MM/DD'),
       to_date('19/08/29','YY/MM/DD'),
       to_date('99/08/29','YY/MM/DD'), 
       to_date('99/08/29','RR/MM/DD')

from dual;

select to_date('17:10:15','HH24:MI:SS')
from dual;

--nullvalue의 줄임말(nvl)
--nvl(변수,null을 대체할 값)
--nvl2(변수, null이 아닐 때 대체할 값, null일 때 대체할 값)

select comm, nvl(comm,'0'), nvl2(comm,'True','0') from emp;


