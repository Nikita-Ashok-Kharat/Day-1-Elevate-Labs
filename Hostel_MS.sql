create database hostel;

use hostel;

create table hostel(hostel_id int auto_increment primary key,
name varchar(50) not null,
hostel_type varchar(10) not null,
no_of_rooms int not null,
no_of_students int not null,
capacity int not null,
facility varchar(50) not null);

create table room(room_id int primary key,
capacity int not null,
floor varchar(10) not null,
hostel_id int not null,
foreign key(hostel_id) references hostel(hostel_id));

create table mess(mess_id int primary key,name varchar(30) not null,
mess_type varchar(30) not null,
cost int not null);

create table student(prn_no varchar(20) primary key,
student_id int auto_increment not null unique,
stud_name varchar(40) not null,
stud_stream varchar(30) not null,
department varchar(30) not null,
addyear varchar(20) not null,
address varchar(50) not null,
phone_no numeric(10) not null,
email_id varchar(30) not null unique,
parents_no numeric(10) not null,
room_id int not null,
dob date not null,
gender varchar(10) not null,
blood_group varchar(20) not null,
joining_date date not null,
hostel_id int not null,
mess_id int not null,
foreign key(room_id) references room(room_id),
foreign key(hostel_id) references hostel(hostel_id),
foreign key(mess_id) references mess(mess_id));


create table staff(staff_id int auto_increment primary key,
staff_name varchar(40) not null,
phone_no numeric(10) not null,
address varchar(50) not null,
email_id varchar(30) not null,
salary int not null,
staff_role varchar(30) not null,
hostel_id int not null,
foreign key(hostel_id) references hostel(hostel_id));

create table furniture(id int auto_increment primary key,
fur_name varchar(40) not null,
room_id int not null,
count int not null,
fur_type varchar(30) not null,
foreign key(room_id) references room(room_id));

create table visitor(visitor_id int auto_increment primary key,
visitor_name varchar(40) not null,
phone_no numeric(10) not null);

create table rules(hostel_id int primary key,
opening_time varchar(10) not null,
closing_time varchar(10) not null,
mobile_permission varchar(5),
foreign key(hostel_id) references hostel(hostel_id));

alter table rules modify opening_time time not null;

alter table rules modify closing_time time not null;

create table fee(receipt_or_transaction_id varchar(30) primary key,
payment_mode varchar(20) not null,
fee_status varchar(20) not null,
date_of_payment date not null,
prn_no varchar(20) not null,
fees int not null,
foreign key(prn_no) references student(prn_no));

create table visiting(visitor_id int,
prn_no varchar(20),
visiting_date date not null,
entry_time time not null,
leave_time time not null,
relation varchar(25) not null,
primary key(visitor_id,prn_no),
foreign key(prn_no) references student(prn_no));

create table visitings(
visit_id int,
prn_no varchar(20),
visiting_date date not null,
entry_time time not null,
leave_time time not null,
relation varchar(25) not null,
primary key(visit_id),
foreign key(prn_no) references student(prn_no));

create table visitors(visitor_id int auto_increment primary key,
visitor_name varchar(40) not null,
prn_no varchar(20),
phone_no numeric(10) not null,
foreign key(prn_no) references visitings(prn_no));

DROP TABLE visiting;

DROP TABLE visitor;
