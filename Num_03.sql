/*
3. 
����(Permutation), ����(Combination)
a, b, c 3���� ���� �߿���
 (1) �ߺ��� ����ؼ� 2���� ���ڸ� ������� �����ؼ� ���
    (���) aa, ab, ac, ba, bb, bc, ca, cb, cc
 (2) �ߺ��� ������� �ʰ� 2���� ���ڸ� ������� �����ؼ� ���
    (���) ab, ac, ba, bc, ca, cb 
 (3) �ߺ��� ������� �ʰ� 2���� ���ڸ� �����ؼ� ���(������ �߿����� ����)
    (���) ab, ac, bc
 (4) 2���� ����(�ߺ� ����)�� ���(������ �߿����� ����)
    (���) aa, ab, ac, bb, bc, cc
*/

declare
  a varchar2;
  b varchar2;
  c varchar2;
  
begin 
   for i in a..c loop
    dbms_output.put_line(i);
   end loop;
   
end;
/