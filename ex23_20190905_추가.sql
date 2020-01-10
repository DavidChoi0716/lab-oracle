set serveroutput on; --���ο� ��Ʈ ���

-- 1) �̸��� �Է¹޾Ƽ�
-- ���, �μ���ȣ�� �˻��ؼ�
-- ���, �̸�, �μ���ȣ�� ���

accept p_ename prompt '�̸��� �Է��ϼ���.';

declare
      v_empno number(4,0);
      v_deptno number(2,0);
begin
      select empno, deptno into v_empno, v_deptno from emp where upper(ename)= trim(upper('&p_ename'));
      
      dbms_output.put_line ('���:'||v_empno);
      dbms_output.put_line ('�̸�:'||'&p_ename');
      dbms_output.put_line ('�μ���ȣ:'||v_deptno);
      
end;
/



-- 2) �̸��� �Է¹޾Ƽ�
-- emp, dept ���̺��� ����ؼ�(JOIN))
-- 'SCOTT�� DALLAS�� RESEARCH�μ����� �ٹ��մϴ�.'�� ���� �������� ���


accept p_ename prompt '�̸��� �Է��ϼ���.';

declare
    v_e.ename varchar2(10);
    v_d.loc varchar2(13);
    v_e.dname varchar2(14);
    
begin
    select e.ename, d.loc, e.dname into v_e.ename, v_d.loc, v_e.dname  
    from emp e join dept d on 'e.dname' = 'd.dname'
    where e.ename = '&p_ename';
    
    dbms_output.put_line (v_e.ename || '��' || v_d.loc || '��' || v_e.dname || '�μ����� �ٹ��մϴ�.');
    
end;
/


accept p_name prompt '�̸��� �Է��ϼ���.';

declare
  v_ename varchar2(100) := '&p_name'; --�Է¹��� �̸��� �����ϴ� ����
  v_loc varchar2(13);  --�μ���ġ(loc)�� ������ ����
  v_dname varchar2(14);   -- �μ� �̸��� ������ ����
begin
 select d.dname, d.loc into v_dname, v_loc
 from emp e join dept d
 on e.deptno = d.deptno
 where upper(e.ename) = upper(trim(v_ename));
 
 dbms_output.put_line(v_ename || '��(��) ' || 
                      v_loc || ' �� ' ||
                      v_dname || '�μ����� �ٹ��մϴ�.');
 end;
 /
 
 
--Logic (��)
--1. ����� �̸�
--2. emp: deptno
--3. dept: loc, dname

accept p_name prompt '�̸��� �Է��ϼ���...';

declare
     v_ename varchar2(20) := upper(trim('&p_name'));
     v_dname varchar2(14);
     v_loc varchar2(13);
     v_deptno number(2);
     
begin
-- ��� �̸����� �� ����� �ٹ��ϴ� �μ� ��ȣ�� �˻�
 select deptno into v_deptno from emp where upper(ename) = v_ename;
 
 --�μ� ��ȣ�� ����ؼ� �μ��� �̸�, ��ġ�� �˻�
 select loc, dname into v_loc, v_dname from dept where deptno = v_deptno;
 
  --�˻��� ������ ȭ�鿡 ���
  dbms_output.put_line(v_ename || ':' || v_loc || ':' || v_dname);
  
end;
/
 

