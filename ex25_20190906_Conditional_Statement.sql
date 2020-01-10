/* 조건문 (Conditional Statement)
(1)
if 조건식
then 조건식이 참일 때 실행할 문장;
end if;
*/

--flowchart

set serveroutput on;

declare
     v_num number := 123 ;
begin

     dbms_output.put_line(v_num||'은');
     
     if mod(v_num,2) = 0
     then dbms_output.put_line('짝수');
     
     end if;
     
     if mod(v_num,2) = 1
     then dbms_output.put_line('홀수');
     
     end if;

end;
/


/*
(2) 
if 조건식 
then 조건식이 참일 때 실행할 문장;
else 조건식이 거짓일 때 실행할 문장;
end if;
*/

accept p_num prompt '숫자를 입력하세요...';

declare

  v_test number := &p_num;
  
begin

  if mod(v_test, 2) = 1 then
   dbms_output.put_line('odd number');
   
  else
   dbms_output.put_line('even number');
   
  end if;
   dbms_output.put_line('End PL/SQL');
  
end;
/

/*
(3) 
if 조건식1 then
   조건식1이 참일 때 실행할 문장;
elsif 조건식2 then
    조건식2이 참일 때 실행할 문장;
elsif...
    ...
else
    위의 모든 조건이 거짓일 때 실행할 문장;
end if;
*/

accept p_num prompt '숫자를 입력하세요...';

declare
  
  v_score number := &p_num;
  

begin

   if v_score >= 90 then
   dbms_output.put_line ('A');
   
   elsif v_score >= 80 then
   dbms_output.put_line ('B');
   
   elsif v_score >= 70 then
   dbms_output.put_line ('C');
   
   else
   dbms_output.put_line ('F');
   
   end if;

    
end;
/

--입력받은 숫자가
--1. 짝수이면, 'even number'라고 출력
--   (1) 4의 배수이면, '4의 배수'라고 출력
--   (2) 그렇지 않으면, '4의 배수가 아닙니다.'라고 출력
--2. 홀수이면, 'odd number'라고 출력


accept p_num prompt '숫자를 입력하세요.'

declare

   v_num number := &p_num;
   
begin
 
   if mod(v_num,2) = 0 then
   dbms_output.put_line('even number');
   
         if mod(v_num,4) = 0 then
          dbms_output.put_line('4의 배수');
   
         else 
         dbms_output.put_line('4의 배수가 아닙니다.');
         
         end if;
   
   else 
   dbms_output.put_line ('odd number');
   
   end if;

end;
/

select power(5,2) from dual;


--삼각형의 세 변의 길이를 입력
--피타고라스 정리를 이용해서, 직각삼각형인지 아닌지를 출력
accept p_num1 prompt '삼각형의 밑변의 길이를 입력하세요.';
accept p_num2 prompt '삼각형의 높이의 길이를 입력하세요.';
accept p_num3 prompt '삼각형의 빗변의 길이를 입력하세요.';

begin
if power(&p_num1,2) + power(&p_num2,2) = power(&p_num3,2) then
dbms_output.put_line('직각삼각형 입니다.');
 
else
dbms_output.put_line ('직각삼각형이 아닙니다.');

end if;

end;
/
 