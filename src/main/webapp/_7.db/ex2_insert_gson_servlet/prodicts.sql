drop table products;
create table products(
	id			number(11),
	name		varchar2(50),
	price		number,
	maker		varchar2(30)
);

alter table products
add primary key(id);

select max(id) from products;

select * from products;
delete from products;

insert into products values(1,'ȫ�浿',1000,'��');

create table products_copy
as
select * from products;

delete PRODUCTS;