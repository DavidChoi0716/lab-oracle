/*
2. 
다음과 같은 수열을 피보나치 수열(Fibonacci numbers)라고 합니다.
1, 1, 2, 3, 5, 8, 13, 21, 34, ...
피보나치 수열은 다음과 같은 식으로 일반화할 수 있습니다.
f[1] = 1, f[2] = 1, 
f[n] = f[n-1] + f[n-2], n >= 3
피보나치 수열의 원소 20개를 출력하는 PL/SQL을 작성하세요.
이웃하는 피보나치 수의 비율은 황금비(golden ratio)라 불리는 수 1.61803...에 수렴함을 보이세요.
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