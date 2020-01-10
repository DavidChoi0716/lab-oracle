/* case~when ���� > ũ��, �۴ٴ� ���� �� ����, ������ ���θ� ���� �� ����.
(1)
case �񱳴��
     when ��1 then 
          �񱳴�� = ��1�� ������ �� ������ ����;
     when ��2 then 
          �񱳴�� = ��1�� ������ �� ������ ����;
          
     ...
     else �񱳴���� ���� ��� ���� ��ġ���� ���� �� ������ ����;
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



/* case~when ����
(2)
case 
     when ���ǽ�1 then
        ���ǽ� 1�� ���� �� ������ ����;
     when ���ǽ�2 then 
        ���ǽ� 2�� ���� �� ������ ����;
          
     ...
     else ���� ��� ������ ������ �� ������ ����;
end case;
*/

accept p_score prompt '���� ������ �Է��ϼ�.'; 

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

