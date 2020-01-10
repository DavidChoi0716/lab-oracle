--PL/SQL�� ������ Ÿ��
--https://docs.oracle.com/cd/A91202_01/901_doc/appdev.901/a89856/03_types.htm
--1) Scalar(��Į��) Ÿ��: number, varchar2, date, ..
--2) Reference(����) Ÿ��: Ư�� ���̺��� ��(row) �Ǵ� ��(column)�� �����ϴ� Ÿ��
--   ���� ���� ���� data type ���� ���������� mix �Ǿ� �ִ� ��찡 �߻��� �� ����
--3) Compound(����) Ÿ��: collection(���ڸ� ���� �� ����), record(����) (20190909) 


-- �÷�(column) ���� Ÿ�� ������ ����: �����̸� ���̺��̸�.�÷��̸�%type := ��; 
-- (����Ŭ������ �ĺ��ڶ�� �θ�> identifier)
-- ��(row) ���� Ÿ�� ������ ����: �����̸� ���̺��̸�%rowtype := ��;
--���� �̸��� 30byte�� ���� �� ����

set serveroutput on;

declare 
  --dept ���̺��� �� �÷��� ������ ������ �� �ִ� ���� ����
   v_deptno dept.deptno%type := 10;
   v_dname dept.dname%type;
   v_loc dept.loc%type;

begin
  select dname, loc into v_dname, v_loc
  from dept 
  where deptno = v_deptno;

  DBMS_OUTPUT.put_line(v_deptno||':'||v_dname||':'||v_loc);

end;
/


declare
    -- emp ���̺��� ��(row)�� ��� ������ ������ �� �ִ� ������ ����
    v_emp7788 emp%rowtype;
begin
    select*into v_emp7788 from emp  where empno = 7788;
    dbms_output.put_line(v_emp7788.ename);
    dbms_output.put_line(v_emp7788.sal);
    dbms_output.put_line(v_emp7788.deptno);
    dbms_output.put_line(v_emp7788.hiredate);
end;
/


