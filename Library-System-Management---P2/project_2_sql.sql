--Librery manegment system project -2
--creating branch table

drop table  if exists Branch;
create table Branch(
branch_id varchar(10) primary key,
manager_id varchar(10),
branch_address	varchar(70),
contact_no varchar(10)
)
drop table  if exists employee;
create table employee(
emp_id varchar(25) primary key,	
emp_name varchar(25),
position varchar(25),
salary int,
branch_id varchar(25) --fk

)
drop table if exists book;
create table book(
isbn varchar(20) primary key,	
book_title varchar(60),
category varchar(20),
rental_price float,
status varchar(20),
author varchar(40),
publisher varchar(50)
)
drop table if exists members;
create table members(
member_id varchar(20) primary key ,
member_name varchar(20),
member_address varchar(80),
reg_date DATE

)
drop table if exists issued_status;
create table issued_status(
issued_id varchar(10) primary key, --fk
issued_member_id varchar(10), --fk
issued_book_name varchar(80),
issued_date	DATE,
issued_book_isbn varchar(30),	--fk
issued_emp_id varchar(10) --fk
)
drop table if exists return_status;
create table return_status(
return_id varchar(10) primary key,
issued_id varchar(10), --fk
return_book_name varchar(70),
return_date date,
return_book_isbn varchar(20)
)

--FOREIGN KEY
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references book(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employee(emp_id);

alter table employee
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);

