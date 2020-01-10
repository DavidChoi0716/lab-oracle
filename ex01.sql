-- 주석(comment): 실행문장이 아닌 설명
select table_name from user_tables;

-- 테이블의 자료 타입 확인(desc:describe)
-- desc 테이블이름;
desc dept;

-- 오라클 자료 타입(data type)
-- number(전체자릿수,소숫점자릿수_없을 경우 생략가능):숫자 타입
-- varchar2(문자열길이): 가변 길이 문자열(variable-length characters/string) 타입 > 최대로 저장 가능한 문자열 길이
-- date: 시간(년/월/일 시/분/초) 정보를 저장하는 타입

desc emp;

--테이블의 전체 데이터(레코드) 출력
select*from emp;


