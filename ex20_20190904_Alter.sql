--테이블 수정
--테이블의 컬럼 이름 변경
alter table ex02 rename column ex_id to eid;

--테이블의 컬럼 데이터 타입 변경
alter table ex02 modify ex_text varchar2(100);

--테이블의 새로운 컬럼 추가
alter table ex02 add ex_date date;

--테이블에서 컬럼 삭제
alter table ex02 drop column ex_date;  

--테이블 컬럼에 제약 조건 추가
alter table ex02
add constraint pk_ex02 primary key (eid);

--컬럼에 null 또는 중복된 값이 있는 경우는 PK 지정할 수 없음.

select*from ex02;

update ex02 set eid = 2 where eid is null;

--null 가능 컬럼에 not null 제약 조건 추가
alter table ex02
add constraint nn_ex02 check (ex_text is not null) ;

--컬럼에 지정된 제약 조건을 삭제
alter table ex02
drop constraint nn_ex02;

desc ex02;

--테이블 vs 사용자 계정
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