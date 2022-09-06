create table mst_Designation
(
Designation_Id int not null auto_increment primary key,
Desigantion_Name varchar(100) not null,
created_date datetime default now(),
isActive bit default 1
);

create table mst_gender(
Gender_Id int not null auto_increment primary key,
Gender_Name varchar(100) not null,
created_date datetime default now(),
isActive bit default 1
);

create table mst_Nationality(
Country_Id int not null primary key,
Country_Name varchar(50) not null,
Nationality_Name varchar(50) not null,
created_date datetime default now(),
isActive bit default 1
);

create table mst_User
(
User_Id bigint not null auto_increment primary key,
User_First_Name varchar(50) not null,
User_Last_Name varchar(50) not null,
Gender_Id int not null,
Designation_Id int not null,
isActive bit default 1,
created_date datetime default now(),
foreign key(Gender_Id) references mst_gender(Gender_Id),
foreign key(Designation_Id) references mst_Designation(Designation_Id)
);


create table trn_User_mobile_Details
(
Mobile_Id int not null auto_increment primary key,
User_Id bigint not null,
Primary_phone bigint not null,
Secondary_Phone bigint not null,
Created_date datetime default now(),
Modified_date datetime default now(),
foreign key (User_Id) references mst_user(User_Id) 
);

create table trn_User_mailId
(
User_Mail_Id int not null auto_increment primary key,
User_Id bigint not null,
Primary_mail bigint not null,
Secondary_mail bigint not null,
Created_date datetime default now(),
Modified_date datetime default now(),
foreign key (User_Id) references mst_user(User_Id)   
);


create table trn_User_Address
(
Address_Id int not null auto_increment primary key,
door_no varchar(10) not null,
street_Name varchar(20) not null,
city varchar(20) not null,
State varchar(20) not null,
pincode int not null,
Country_Id int not null,
User_Id bigint not null,
Nationality_Id int not null,
Created_date datetime default now(),
Modified_date datetime default now(),
issame bit default 1,
foreign key (User_Id) references mst_user(User_Id),
foreign key (Country_Id) references mst_Nationality(Country_Id)
);


create table trn_User_present_Address
(
P_Address_Id int not null auto_increment primary key,
door_no varchar(10) not null,
street_Name varchar(20) not null,
city varchar(20) not null,
State varchar(20) not null,
pincode int not null,
Country_Id int not null,
User_Id bigint not null,
Nationality_Id int not null,
Created_date datetime default now(),
Modified_date datetime default now(),
foreign key (User_Id) references mst_user(User_Id),
foreign key (Country_Id) references mst_Nationality(Country_Id)
);


create table trn_Password(
Password_Id int not null primary key,
Password1 varchar(20) not null,
Password2 varchar(20) not null,
Password3 varchar(20) not null,
User_Id bigint not null,
Created_date datetime default now(),
Last_Modified_date datetime default now(),
foreign key (User_Id) references mst_user(User_Id)
);