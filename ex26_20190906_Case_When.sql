/* case~when 구문 > 크다, 작다는 비교할 수 없고, 같은지 여부만 비교할 수 있음.
(1)
case 비교대상
     when 값1 then 
          비교대상 = 값1을 만족할 때 실행할 문장;
     when 값2 then 
          비교대상 = 값1을 만족할 때 실행할 문장;
          
     ...
     else 비교대상이 위의 모든 값과 일치하지 않을 때 실행할 문장;
end case;
*/



set serveroutput on;
declare
   v_score number := 88;
begin
   case trunc(v_score,-1)
       when 100 then
            dbms_output.put_line('A');
       when 90 then
            dbms_output.put_line('A');
       when 80 then
            dbms_output.put_line('B');
       when 70 then
            dbms_output.put_line('C');
       else
            dbms_output.put_line('D');
   end case;
   
end;
/


set serveroutput on;
declare
   v_score number := 88;
begin
   case trunc(v_score/10,0)
       when 10 then
            dbms_output.put_line('A');
       when 9 then
            dbms_output.put_line('A');
       when 8 then
            dbms_output.put_line('B');
       when 7 then
            dbms_output.put_line('C');
       else
            dbms_output.put_line('D');
   end case;
   
end;
/



/* case~when 구문
(2)
case 
     when 조건식1 then
        조건식 1이 참일 때 실행할 문장;
     when 조건식2 then 
        조건식 2가 참일 때 실행할 문장;
          
     ...
     else 위의 모든 조건이 거짓일 때 실행할 문장;
end case;
*/

accept p_score prompt '받은 점수를 입력하셈.'; 

declare
   v_score number := &p_score;
  
begin

case 
     when v_score >= 90 then
         dbms_output.put_line('A');
         
     when v_score >= 80 then 
        dbms_output.put_line('B');
        
     when v_score >= 70 then      
        dbms_output.put_line('C');
        
     else 
        dbms_output.put_line('F');
        
end case;

end;
/

