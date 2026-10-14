create database NishantS014python;
use NishantS014python;

create table Department
(
Dp_id int primary key,
D_name varchar(50) not null,
Dp_loc varchar(50),
Dp_hod varchar(20)
);

create table Doctor
(
D_id int primary key,
D_name varchar(50) not null,
D_spec varchar(50),
D_license varchar(20) unique,
Dp_id int,
foreign key (Dp_id) references Department(Dp_id)
);

create table Ward
(
W_num int primary key,
W_type varchar(20) check (W_type in ('General','VIP')),
W_charge decimal(10,2),
W_avail varchar(10) check (W_avail in ('Yes','No'))
);

create table Patient
(
P_id int primary key,
P_name varchar(50),
P_num varchar(13),
P_dob date,
D_id int,
W_num int default 101,
foreign key (D_id) references Doctor(D_id),
foreign key (W_num) references Ward(W_num)
);

create table Nurse
(
N_id int primary key,
N_name varchar(50) not null,
N_shift varchar(50),
N_dept varchar(50),
D_id int,
P_id int,
foreign key (D_id) references Doctor(D_id),
foreign key (P_id) references Patient(P_id)
);

create table Appointment
(
A_no int primary key,
A_date date not null,
D_id int,
P_id int,
foreign key (D_id) references Doctor(D_id),
foreign key (P_id) references Patient(P_id)
);

create table Prescription
(
Pr_no int primary key,
Pr_date date not null,
D_id int,
P_id int,
foreign key (D_id) references Doctor(D_id),
foreign key (P_id) references Patient(P_id)
);

create table Medicine
(
M_reg_no int primary key,
M_name varchar(50) not null,
M_price decimal(10,2),
M_stock int,
Pr_no int,
foreign key (Pr_no) references Prescription(Pr_no)
);

create table Bill
(
B_no int primary key,
B_amt decimal(10,2),
B_stat varchar(20) default 'Pending' check (B_stat in ('Paid','Unpaid','Pending')),
P_id int,
foreign key (P_id) references Patient(P_id)
);

create table Payment
(
Py_id int primary key,
Py_mode varchar(20) check (Py_mode in ('Online','Offline')),
Py_amt decimal(10,2),
P_id int,
foreign key (P_id) references Patient(P_id)
);

create table Online
(
Py_id int,
Gpay varchar(30),
foreign key (Py_id) references Payment(Py_id)
);
