/*
2. 
������ ���� ������ �Ǻ���ġ ����(Fibonacci numbers)��� �մϴ�.
1, 1, 2, 3, 5, 8, 13, 21, 34, ...
�Ǻ���ġ ������ ������ ���� ������ �Ϲ�ȭ�� �� �ֽ��ϴ�.
f[1] = 1, f[2] = 1, 
f[n] = f[n-1] + f[n-2], n >= 3
�Ǻ���ġ ������ ���� 20���� ����ϴ� PL/SQL�� �ۼ��ϼ���.
�̿��ϴ� �Ǻ���ġ ���� ������ Ȳ�ݺ�(golden ratio)�� �Ҹ��� �� 1.61803...�� �������� ���̼���.
f[n+1] / f[n] ~ 1.61803...
*/
set serveroutput on;

declare
  type NumberArray is table of number index by pls_integer;
  cnt constant number := 20;
  fibo NumberArray;
  ratio NumberArray;
   
begin
  fibo(1) := 1;
  fibo(2) := 1;
  for i in 3..cnt loop
    fibo(i) := fibo(i-1) + fibo(i-2);
  end loop;
  
  for i in 1..cnt loop
    dbms_output.put(fibo(i) || ' ');
  end loop;
  dbms_output.new_line;
  
  for i in 1..(cnt-1) loop
    ratio(i) := fibo(i+1) / fibo(i);
    dbms_output.put_line(ratio(i));
  end loop;
end;
/