## 学习SQL连表查询


## 创建数据和插入数据
CREATE TABLE `Teacher` ( `ID` INTEGER PRIMARY KEY AUTOINCREMENT, `Name` TEXT, `T_ID` INTEGER, `Course` TEXT, `C_ID` INTEGER );

insert into Teacher (Name, T_ID, Course, C_ID) values ('赵老师', 100, '语文', 1000);
insert into Teacher (Name, T_ID, Course, C_ID) values ('王老师', 101, '数学', 1001);
insert into Teacher (Name, T_ID, Course, C_ID) values ('孙老师', 102, '英语', 1002);
insert into Teacher (Name, T_ID, Course, C_ID) values ('钱老师', 103, '美术', 1003);

CREATE TABLE `Student` ( `ID` INTEGER PRIMARY KEY AUTOINCREMENT, `Name` TEXT, `S_ID` INTEGER, `C_ID` INTEGER, `Score` REAL );


insert into Student (Name, S_ID, C_ID, Score) values ('小二', 201801, 1000, 89.5);
insert into Student (Name, S_ID, C_ID, Score) values ('小三', 201802, 1001, 55.5);
insert into Student (Name, S_ID, C_ID, Score) values ('小四', 201803, 1002, 74.5);
insert into Student (Name, S_ID, C_ID, Score) values ('小五', 201804, 1000, 63.5);
insert into Student (Name, S_ID, C_ID, Score) values ('小六', 201805, 1002, 51.5);
insert into Student (Name, S_ID, C_ID, Score) values ('小七', 201806, 1001, 82.5);


## inner join
## 查询会把table1中的每一行与table2中的每一行进行比较，找到所有满足连接条件的匹配对。
select S.Name, T.Name, T.Course, S.C_ID from Student as S inner join Teacher as T on S.C_ID = T.C_ID;

## 外连接，返回不仅包括符合连接条件的行，而且还包括左表（left join）、右表（right join）或两个连接表（full join）的所有数据行。
## SQLite只支持Left Join
## left join
select T.Name, T.Course, S.Name, S.Score from Teacher as T left join  Student as S on T.C_ID = S.C_ID;
select T.Name, T.Course, S.Name, S.Score from Student as S left join  Teacher as T on T.C_ID = S.C_ID;


## cross join
## 把第一个表的每一行与第二个表的每一行进行匹配，即笛卡尔积。两个输入表分别为x和y行，则结果有x*y行。
select T.Name, T.Course, S.Name, S.Score from Student as S cross join Teacher as T;
select T.Name, T.Course, S.Name, S.Score from Teacher as T cross join Student as S;