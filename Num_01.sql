/* loop or while_loop문, 조건문
1. 
dbms_random.value() 함수 이용해서, 주사위 2개를 던졌을 때 나오는 눈을 (x, y) 형식으로 출력하는 PL/SQL을 작성하세요. 주사위 2개의 눈이 같아졌을 때 출력을 멈추세요.
(결과 예시)
1차: (1, 4)
2차: (5, 2)
3차: (6, 6)
*/

set serveroutput on;

declare

  x number;  
  y number; 
  
begin
    loop 
     x := trunc(dbms_random.value(1,7));
     y := trunc(dbms_random.value(1,7));
     
    dbms_output.put_line('('||x||','||y||')');
     
    exit when x = y; 
    
    end loop;
    
end;
/

