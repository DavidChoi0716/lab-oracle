/*
ex 5. 
(1) �̸��� SCOTT �� ����� �̸��� �μ� ��ġ�� ����ϴ� SQL �ۼ�.

(2) �̸��� prompt�� �����, �ش����� �μ� ��ġ�� ����ϴ� PL/SQL �ۼ�. ��, �̸��� �ҹ��ڷ� �Է��ص� ����ǰ� �ۼ�.
(��)
�̸� �Է� ~ scott
SCOTT�� DALLAS���� �ٹ��մϴ�
*/

--(1)
select e.ename, d.loc 
from emp e, dept d
where e.deptno = d.deptno and e.ename = 'SCOTT';


--(2)
accept p_name prompt '�̸��� �Է��ϼ���.';

declare
  v_ename varchar2(100) := '&p_name'; --�Է¹��� �̸��� �����ϴ� ����
  v_loc varchar2(13);  --�μ���ġ(loc)�� ������ ����
 
begin
 select d.loc into v_loc
 from emp e join dept d
 on e.deptno = d.deptno
 where upper(e.ename) = upper(trim(v_ename));
 
 dbms_output.put_line(v_ename || '��(��) ' || 
                      v_loc || ' ���� �ٹ��մϴ�.'); 
                      
 end;
 /
