/* loop or while_loop��, ���ǹ�
1. 
dbms_random.value() �Լ� �̿��ؼ�, �ֻ��� 2���� ������ �� ������ ���� (x, y) �������� ����ϴ� PL/SQL�� �ۼ��ϼ���. �ֻ��� 2���� ���� �������� �� ����� ���߼���.
(��� ����)
1��: (1, 4)
2��: (5, 2)
3��: (6, 6)
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

