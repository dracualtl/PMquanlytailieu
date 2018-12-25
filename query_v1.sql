use [ManageDocumentOfLecturer]
 create table dbo.[student](
    [ID] [char](10) not null primary key, 
	[fullName] [nchar](50) not null,
	[dateOfBirth] [date] not null,
	[major] [nchar](50) not null,
	[college] [nchar](50) not null,
	[email] [nchar](50) not null,
	class char(10) not null,
	course numeric(10) not null
 )

create table dbo.projecttype(
    projecttypeID int not null primary key,
	projecttype nchar(20) not null
)

insert into dbo.projecttype--projecttypeID,projecttype)
--values (1,'nienluan'),(2,'tieuluan'),(3,'luanvan'),(4,'khac')
select 1,'nienluan' union all
select 2,'tieuluan' union all
select 3,'luanvan' union all
select 4,'khac'


 create table dbo.studentGroup(
    ID char(10) not null primary key,
	members varchar(255) not null,
	projectID char(10) not null --foreign key references dbo.project(ID)
)

create table dbo.project(
    ID char(10) not null primary key,
	projecttypeID int not null references projecttype(projecttypeID), 
	name nchar(50) not null,
	semester numeric(1) not null,
	yearCourse char(15) not null,
	--groupID char(10) not null foreign key references dbo.studentGroup(ID),
	instructor nchar(255) not null,
	score float(5) default -1,
	constraint project_pk unique (ID,projecttypeID)
	--subjectID nchar(50) not null foreign key references studentsubject(ID)
)

create table dbo.nienluan(
    ID char(10) not null primary key,
	projecttypeID  as 1 persisted,
	foreign key (ID,projecttypeID) references dbo.Project(ID,projecttypeID)
)

create table dbo.tieuluan(
    ID char(10) not null primary key,
	projecttypeID as 2 persisted,
	foreign key (ID,projecttypeID) references dbo.project(ID,projecttypeID)
)

create table dbo.luanvan(
    ID char(10) not null primary key,
	projecttypeID as 3 persisted,
	diem1 numeric(5),
	diem2 numeric(5),
	diem3 numeric(5),
	ID1 char(10),
	ID2 char(10),
	ID3 char(10),
	foreign key (ID,projecttypeID) references dbo.project(ID,projecttypeID)
)

create table dbo.examiner(
    ID char(10) not null primary key,
	name nchar(20) not null,
	occupation nchar(20) not null,
	phonenumber numeric(20)
)

create table dbo.intructor(
    ID char(10) not null primary key,
	name nchar(20) not null,
	occupation nchar(20) not null,
	phonenumber numeric(20),
	addresss varchar(60),
	projectID char(10) foreign key references dbo.project(ID) 
)

create table dbo.topic(
    ID char(10) not null primary key,
    name nchar(30) not null,
	times int not null
)

create table dbo.users(
    account varchar(20) not null primary key,
	passwords varchar(30) not null
)

create table dbo.studentscore(
    score numeric(5) not null,
	subjects varchar(30) not null,
	ID char(10) not null,
	semester numeric(2) not null,
	yearcourse numeric(5)  not null,
	CONSTRAINT PK_sds primary key (ID,subjects,semester,yearcourse),
	foreign key (ID) references dbo.student(ID)
)

create table dbo.materialtype(
    materialtypeID int not null primary key,
	materialtype nchar(20) not null
)

insert into dbo.materialtype--materialtypeID,materialtype)
--values (1,'nienluan'),(2,'tieuluan'),(3,'luanvan'),(4,'khac')
select 1,'excercise' union all
select 2,'exam' union all
select 3,'teaching document'

create table dbo.teachingmaterial(
    ID char(10) not null primary key,
    subjects varchar(30) not null,
	materialtypeID int not null,
	constraint teachingmaterial_pk unique (ID,materialtypeID)
)

create table dbo.excercise(
    ID char(10) not null primary key,
	materialtypeID as 1 persisted,
	author nchar(20) not null,
	copleteday date not null,
	foreign key (ID, materialtypeID) references dbo.teachingmaterial(ID,materialtypeID)
)

create table dbo.exam(
    ID char(10) not null primary key,
	materialtypeID as 1 persisted,
	examID char(10) not null,
	semester numeric(2) not null,
	yearcourse numeric(5) not null,
	foreign key (ID, materialtypeID) references dbo.teachingmaterial(ID,materialtypeID)
)