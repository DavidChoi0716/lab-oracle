/*
1. ���θ����� ������ ������ ������ customers ���̺��� ������� �Ѵ�.
������ ���� ������ ���̺��� ������ ����.
-���̺� �̸�: customers
-�÷�: customer_id(�� ���̵�, 8 ~ 20 bytes�� ���ڿ�)
        customer_pw(�� ��й�ȣ, 8 ~ 20 bytes�� ���ڿ�)
        customer_email(�� �̸���, 100 bytes���� ������ ���ڿ�)
        customer_gender(�� ����, 1�ڸ� ����)
        customer_age(�� ����, 3�ڸ� ����)
- ���� ����: PK�� customer_id
             customer_pw�� not null
             customer_gender�� 0, 1, 2 �� �ϳ��� ����
             customer_age�� 0 ~ 200���� ����, �⺻���� 0
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
2. ���θ����� ����� �ֹ�(orders) ���̺��� ������� �Ѵ�.
������ ���� ������ ���̺��� ������ ����.
- ���̺� �̸�: orders
- �÷�: order_id(�ֹ� ��ȣ, 12�ڸ� ����)
        order_date(�ֹ� ��¥)
        order_method(�ֹ� ���, 8����Ʈ ���ڿ�)
        customer_id(�ֹ� �� ���̵�, 6�ڸ� ����)
        order_status(�ֹ� ����, 2�ڸ� ����)
        sales_rep_id(�Ǹ� ��� ���̵�, 6�ڸ� ����)
- ��������: PK�� order_id
            order_date�� �⺻���� ���� �ð�
            order_method�� 'direct', 'online'�� �Է� ����
            order_status �⺻���� 0
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
3. ���θ����� ���� �ֹ��� ��ǰ ������ �����ϴ� order_items ���̺��� ������� �Ѵ�. ������ ���� ������ ���̺��� ������ ����.
-���̺� �̸�: order_items
-�÷�: order_id(�ֹ���ȣ, 12�ڸ� ����)
        product_id(�ֹ� ��ǰ ��ȣ, 10�ڸ� ����)
        quantity(�ֹ� ��ǰ ����, 4�ڸ� ����)
        price(�ֹ� ��ǰ�� ����, 10�ڸ� ����)
- ���� ����: PK(order_id, product_id)
               quantity�� �⺻���� 0        
*/


create table order_items(

                 order_id                            number(12),
                 product_id                          number(10),
                 quantity                            number(4) default 0,
                 price                               number(10),
                
                constraint pk_order_items primary key (order_id, product_id)
                
);


desc order_items;


--4.insert, update, delete ����


insert into customers1 (customer_id, customer_pw)
values ('admin0000','admin1234' );

insert into customers1(customer_id, customer_pw, customer_gender)
values('##125678','pw123456', 0.5);

select*from customers1;


--customers1 ���̺��� ������ ���� ���� ���� ������ 2�� ����
update customers1
set customer_gender =2
where customer_gender is null;


insert into orders(order_id,customer_id)
values(100001,123456);

select*from orders;

--orders ���̺��� sales_rep_id�� null�� ���� 100���� ����
update orders
set sales_rep_id =100
where sales_rep_id is null;


--order_items ���̺� ���ڵ� insert
insert into order_items (order_id, product_id, quantity, price)
values(100000,1,3,1000);

insert into order_items (order_id, product_id, quantity, price)
values(100000,2,3,1500);

insert into order_items (order_id, product_id, quantity, price)
values(100001,123,10,10000);

select*from order_items;



-- orders, order_items ���̺��� 
-- �ֹ� ��ȣ, �ֹ� ��¥, ��ǰ ���̵�, ��ǰ ����, ��ǰ ������ ��ȸ

--Ansi���
select o.order_id, o.order_date, i.product_id, i.quantity, i.price
from orders o join order_items i
on o.order_id = i.order_id;

--Oracle���
select o.order_id, o.order_date, i.product_id, i.quantity, i.price
from orders o, order_items i
where o.order_id = i.order_id;


commit;

-- DML(Data Manipulation Lanaguage): insert, update, delete
-- commit�� ��������� ������ ��쿡 �����ͺ��̽��� ������ ����
-- rollback�� ����ؼ� ���� commit ���·� �ǵ��� ���� ����.
select* from order_items;
delete from order_items;
rollback;
select* from order_items;

---DDL (Data Definition Language) : create, alter, truncate, drop
-- DDL ������ ���� �� �ڵ����� commit ��.
truncate table order_items;
select* from order_items;
rollback;
select*from order_items;


--Transaction ����
--insert into A
--update B

--create table

--�߰� �߰��� commit�� �� �ִ� �� ����


drop table ex_emp2;
rollback;
select*from ex_emp2;



