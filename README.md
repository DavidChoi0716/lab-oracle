# Oracle DB 설치
-> 11g(유료), 11g xe (무료)
-> port 번호 ( 각각의 프로그램의 고유한 주소값 )
 
# SQL Developer 설치 


# 명령어
conn / as sysdba -> 관리자 계정 접속 (1)
conn system / oracle -> 관리자 계정 접속(2)
alter user hr account unlock identified by hr -> 계정을 풀고, 비밀번호를 hr로 설정

-> 작업이 안 될때 시작 창에 start base 클릭

-> Column/row
-> Primary Key
-> join
-> CRUD
-> select/insert/update/delete/create

NOSQL은 조금 다르게!

 -> <data type>
Varchar2
number
date
clob -> 최대 4GB (문자열 데이터 타입을 저장 가능)
blob -> 최대 4GB (음성, 이미지 파일 등)
 
같다: =
다르다: != , <>, ^=
논리 연산자: and or not

between A and B / IN 연산자 -> 속도가 느려서 잘 사용하지 않음 
sql의 인덱스도 사용가능 -> 인덱스를 사용해서 속도를 개선 
like 연산자 
