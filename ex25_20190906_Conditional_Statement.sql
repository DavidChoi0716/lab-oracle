/* ���ǹ� (Conditional Statement)
(1)
if ���ǽ�
then ���ǽ��� ���� �� ������ ����;
end if;
*/

--flowchart

set serveroutput on;

declare
     v_num number := 123 ;
begin

     dbms_output.put_line(v_num||'��');
     
     if mod(v_num,2) = 0
     then dbms_output.put_line('¦��');
     
     end if;
     
     if mod(v_num,2) = 1
     then dbms_output.put_line('Ȧ��');
     
     end if;

end;
/


/*
(2) 
if ���ǽ� 
then ���ǽ��� ���� �� ������ ����;
else ���ǽ��� ������ �� ������ ����;
end if;
*/

accept p_num prompt '���ڸ� �Է��ϼ���...';

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
if ���ǽ�1 then
   ���ǽ�1�� ���� �� ������ ����;
elsif ���ǽ�2 then
    ���ǽ�2�� ���� �� ������ ����;
elsif...
    ...
else
    ���� ��� ������ ������ �� ������ ����;
end if;
*/

accept p_num prompt '���ڸ� �Է��ϼ���...';

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

--�Է¹��� ���ڰ�
--1. ¦���̸�, 'even number'��� ���
--   (1) 4�� ����̸�, '4�� ���'��� ���
--   (2) �׷��� ������, '4�� ����� �ƴմϴ�.'��� ���
--2. Ȧ���̸�, 'odd number'��� ���


accept p_num prompt '���ڸ� �Է��ϼ���.'

declare

   v_num number := &p_num;
   
begin
 
   if mod(v_num,2) = 0 then
   dbms_output.put_line('even number');
   
         if mod(v_num,4) = 0 then
          dbms_output.put_line('4�� ���');
   
         else 
         dbms_output.put_line('4�� ����� �ƴմϴ�.');
         
         end if;
   
   else 
   dbms_output.put_line ('odd number');
   
   end if;

end;
/

select power(5,2) from dual;


--�ﰢ���� �� ���� ���̸� �Է�
--��Ÿ��� ������ �̿��ؼ�, �����ﰢ������ �ƴ����� ���
accept p_num1 prompt '�ﰢ���� �غ��� ���̸� �Է��ϼ���.';
accept p_num2 prompt '�ﰢ���� ������ ���̸� �Է��ϼ���.';
accept p_num3 prompt '�ﰢ���� ������ ���̸� �Է��ϼ���.';

begin
if power(&p_num1,2) + power(&p_num2,2) = power(&p_num3,2) then
dbms_output.put_line('�����ﰢ�� �Դϴ�.');
 
else
dbms_output.put_line ('�����ﰢ���� �ƴմϴ�.');

end if;

end;
/
 