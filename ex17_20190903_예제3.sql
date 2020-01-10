/*
1. 쇼핑몰에서 고객들의 정보를 저장할 customers 테이블을 만들려고 한다.
다음과 같은 구조의 테이블을 생성해 보자.
-테이블 이름: customers
-컬럼: customer_id(고객 아이디, 8 ~ 20 bytes의 문자열)
        customer_pw(고객 비밀번호, 8 ~ 20 bytes의 문자열)
        customer_email(고객 이메일, 100 bytes까지 가능한 문자열)
        customer_gender(고객 성별, 1자리 정수)
        customer_age(고객 나이, 3자리 정수)
- 제약 조건: PK는 customer_id
             customer_pw는 not null
             customer_gender는 0, 1, 2 중 하나만 가능
             customer_age는 0 ~ 200까지 가능, 기본값은 0
*/

create table customers1 (
            customer_id                 varchar2(20)              
                                          constraint pk1 primary key 
                                          constraint ch1 check ( lengthb(customer_id) >=8 ),            
            customer_pw                varchar2(20)              
                                           constraint nn1 not null 
                                           constraint ch2 check ( lengthb(customer_pw) >=8 ) , 
            customer_email             varchar2(100),               
            customer_gender           number(1,0)             
                                            constraint ch3 check ( customer_gender in (0,1,2) and customer_gender = trunc (customer_gender,0) ),
            customer_age                number(3,0)  default 0 
                                            constraint ch4 check ( customer_age between 0 and 200 )
);



create table customers2(
            customer_id                 varchar2(20)              
                                          primary key check ( lengthb(customer_id) >=8 ),            
            customer_pw                varchar2(20)              
                                           not null check ( lengthb(customer_pw) >=8 ), 
            customer_email             varchar2(100),               
            customer_gender           number(1,0)             
                                            check ( customer_gender in (0,1,2) ),
            customer_age                number(3,0)              default 0 
                                             check ( customer_age between 0 and 200 )
);



create table customers3 (
           customer_id                 varchar2(20), 
           customer_pw                 varchar2(20) constraint nn_pw not null,
           customer_email              varchar2(100),               
           customer_gender             number(1,0), 
           customer_age                number(3,0)                 default 0, 
           
           constraint pk_id primary key (customer_id), 
           constraint ch_id check ( lengthb(customer_id) >=8 ), 
           constraint ch_pw check ( lengthb(customer_pw) >=8 ),
           constraint ch_gender check ( customer_gender in (0,1,2) ),
           constraint ch_age check  ( customer_age between 0 and 200 )
);



/*
2. 쇼핑몰에서 사용할 주문(orders) 테이블을 만들려고 한다.
다음과 같은 구조의 테이블을 생성해 보자.
- 테이블 이름: orders
- 컬럼: order_id(주문 번호, 12자리 정수)
        order_date(주문 날짜)
        order_method(주문 방법, 8바이트 문자열)
        customer_id(주문 고객 아이디, 6자리 정수)
        order_status(주문 상태, 2자리 숫자)
        sales_rep_id(판매 사원 아이디, 6자리 정수)
- 제약조건: PK는 order_id
            order_date의 기본값은 현재 시간
            order_method는 'direct', 'online'만 입력 가능
            order_status 기본값은 0
*/

create table orders(
                    order_id                          number(12,0),
                    order_date                        date default sysdate,
                    order_method                      varchar2(8),
                    customer_id                       number(6,0),
                    order_status                      number(2,0) default 0,
                    sales_rep_id                      number(6,0),

                    constraint pk_orders primary key (order_id),
                    constraint ck_method check (order_method in ('direct','online'))
                  
);

/*
3. 쇼핑몰에서 고객이 주문한 상품 정보를 저장하는 order_items 테이블을 만들려고 한다. 다음과 같은 구조의 테이블을 생성해 보자.
-테이블 이름: order_items
-컬럼: order_id(주문번호, 12자리 정수)
        product_id(주문 상품 번호, 10자리 정수)
        quantity(주문 상품 수량, 4자리 정수)
        price(주문 상품의 가격, 10자리 정수)
- 제약 조건: PK(order_id, product_id)
               quantity의 기본값은 0        
*/


create table order_items(

                 order_id                            number(12),
                 product_id                          number(10),
                 quantity                            number(4) default 0,
                 price                               number(10),
                
                constraint pk_order_items primary key (order_id, product_id)
                
);


desc order_items;


--4.insert, update, delete 연습


insert into customers1 (customer_id, customer_pw)
values ('admin0000','admin1234' );

insert into customers1(customer_id, customer_pw, customer_gender)
values('##125678','pw123456', 0.5);

select*from customers1;


--customers1 테이블에서 성별의 값이 없는 고객의 성별을 2로 변경
update customers1
set customer_gender =2
where customer_gender is null;


insert into orders(order_id,customer_id)
values(100001,123456);

select*from orders;

--orders 테이블에서 sales_rep_id가 null인 곳을 100으로 수정
update orders
set sales_rep_id =100
where sales_rep_id is null;


--order_items 테이블에 레코드 insert
insert into order_items (order_id, product_id, quantity, price)
values(100000,1,3,1000);

insert into order_items (order_id, product_id, quantity, price)
values(100000,2,3,1500);

insert into order_items (order_id, product_id, quantity, price)
values(100001,123,10,10000);

select*from order_items;



-- orders, order_items 테이블에서 
-- 주문 번호, 주문 날짜, 상품 아이디, 상품 수량, 상품 가격을 조회

--Ansi방식
select o.order_id, o.order_date, i.product_id, i.quantity, i.price
from orders o join order_items i
on o.order_id = i.order_id;

--Oracle방식
select o.order_id, o.order_date, i.product_id, i.quantity, i.price
from orders o, order_items i
where o.order_id = i.order_id;


commit;

-- DML(Data Manipulation Lanaguage): insert, update, delete
-- commit을 명시적으로 수행한 경우에 데이터베이스에 영구히 저장
-- rollback을 사용해서 최종 commit 상태로 되돌릴 수도 있음.
select* from order_items;
delete from order_items;
rollback;
select* from order_items;

---DDL (Data Definition Language) : create, alter, truncate, drop
-- DDL 문장은 수행 후 자동으로 commit 됨.
truncate table order_items;
select* from order_items;
rollback;
select*from order_items;


--Transaction 시작
--insert into A
--update B

--create table

--중간 중간에 commit을 해 주는 게 좋음


drop table ex_emp2;
rollback;
select*from ex_emp2;



