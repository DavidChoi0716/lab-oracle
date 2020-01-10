/*
3. 
순열(Permutation), 조합(Combination)
a, b, c 3개의 문자 중에서
 (1) 중복을 허락해서 2개의 문자를 순서대로 나열해서 출력
    (결과) aa, ab, ac, ba, bb, bc, ca, cb, cc
 (2) 중복을 허락하지 않고 2개의 문자를 순서대로 나열해서 출력
    (결과) ab, ac, ba, bc, ca, cb 
 (3) 중복을 허락하지 않고 2개의 문자를 선택해서 출력(순서는 중요하지 않음)
    (결과) ab, ac, bc
 (4) 2개의 문자(중복 가능)를 출력(순서는 중요하지 않음)
    (결과) aa, ab, ac, bb, bc, cc
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