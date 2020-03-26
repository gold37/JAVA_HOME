show user;

select *
from dba_users;   -- sys �Ǵ� system�� ��ȸ�� �����ϴ�.

-- ���� ����Ŭ ������ ������ ����� (HR) ������ ��� ���̺� �� �� ��� ��ȸ�ϱ�
select * from tab;

select *
from departments;

select *
from employees;

desc departments;






                ----------------- *** ���̺� �����ϱ� ***---------------------3.23
drop table tbl_board purge;
                
create table tbl_board                -- �Խ��� �۾��� ���̺�
(boardno  number                       -- �� ��ȣ
, subject varchar2(2000)            -- �� ����               
, content Nvarchar2(2000)       -- �� ����                   
,userid varchar2(40)                   -- �۾��� ID
,registerday date                          -- �ۼ�����
,readcount number(10)               -- ��ȸ��
);


------ ** ���̺��� ������ ���Ŀ��� �ݵ�� �ڸ�Ʈ(�ּ�)�� �� �޾��ֵ������� !!!!! ** -------
select *
from user_tab_comments;

comment on table tbl_board 
is '�Խ��� �۾��� ���̺�';


------ ** ������ ���̺��� �÷����� �ݵ�� �ڸ�Ʈ(�ּ�)�� �� �޾��ֵ������� !!!!! ** -------
select *
from user_col_comments
where table_name = 'EMPLOYEES';  -- ���̺�� �� �빮�ڷ�!!

select *
from user_col_comments
where table_name = 'TBL_BOARD';

comment on column tbl_board.boardno 
is '�Խñ� ��ȣ(���ڷ� ���´�)';

comment on column tbl_board.subject
is '������';

comment on column tbl_board.content
is '�۳���';

comment on column tbl_board.userid
is '�Խñ� ����� ID';

comment on column tbl_board.registerday
is '�ۼ�����';

comment on column tbl_board.readcount
is '�� ��ȸ��(��ȸ�� ������ �ڽ��� �� ���̶�� ����X, �ٸ� ����� �� ���� ��ȸ�Ҷ��� ����O)';



----------- *** 1. tbl_board ���̺� �ӿ� ������ �Է��ϱ� *** -------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'Test��1', '�ȳ��ϼ���', 'jiwon', sysdate,0);
-- sysdate�� ���� �ð��� ������

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'Test��2', '�ݰ����ϴ�', 'taeyeon', sysdate,0);

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(3, 'Test��3', '�ǰ��ϼ���', 'getoutCorona', sysdate,0);

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(4, 'Test��4', '�����Ϸ�Ǽ���', 'goodDay', sysdate,0);

commit;




----------- *** 2. tbl_board ���̺� �ӿ� ����ִ� ��� ������ ��ȸ�ϱ� *** -------------
select boardno, subject, content, userid, registerday, readcount
from tbl_board ;

select *
from tbl_board ;

/*
        ==== �١ڡ١� select�� (Data Query Language)�� ó������ �١ڡ١� ====
        select �÷���1, �÷���2, ...       --��
        from ���̺��(�Ǵ� �� ��)        --��
        where ������                              --��   where �������� ���ϴ� ���� from ������ ������ ���̺��(�Ǵ� �� ��)���� ���ǿ� �����ϴ� ���� �޸𸮿� �ε����� �ۿø��� ���̴� !!!!!
        group by ��                                 --��
        having �׷��Լ� ������            --��
        order by ��                                  --��
        
*/

----- >>> ���� :  tbl_board ���̺��� �۹�ȣ�� 2�� �Խñ��� ��� ������ ��ȸ�ϼ���
select *
from tbl_board
where boardno=2;

----- >>> ���� :  tbl_board ���̺��� �۾����� id�� 'jiwon'�� �Խñ��� ��� ������ ��ȸ�ϼ���
select *
from tbl_board
where userid = 'jiwon';

----- >>> ���� :  tbl_board ���̺��� �۾����� id�� 'jiwon'�� �Խñ��� ������, �۾���ID, �ۼ����ڸ� ��ȸ�ϼ���
select subject, userid, registerday
from tbl_board
where userid='jiwon';


----------- ***  3. tbl_board ���̺� �ӿ� ����ִ� ������ �� ����(����)�ϱ� *** -------------
update tbl_board set subject = '����սô�',
                                       readcount = 120;
                                       
commit;

select *
from tbl_board;

update tbl_board set readcount = 0;

update tbl_board set subject='Test��1'
where boardno = 1;

update tbl_board set subject='Test��2'
where  boardno =2;

update tbl_board set subject='Test��3'
where  boardno =3;

---------- �ߺ� �� �Ѱ� �����ϱ� ------------
select rowid, boardno, subject
from tbl_board;

delete from tbl_board
where rowid = 'AAAE5vAAEAAAAFcAAA';

commit; 

select *
from tbl_board;

rollback;




-------commit �� ��ũ�� �����ϴ°�
update tbl_board set userid= 'ryujin'
where boardno  = 3;

select *
from tbl_board;
-------�����Ű�����ÿ��� rollback
rollback;



update tbl_board set content = '����սô�'
where boardno  = 3;





----------- ***  4. tbl_board ���̺� �ӿ� ����ִ� ��(row) �����ϱ� *** -------------
delete from tbl_board;
rollback;

delete from tbl_board
where boardno = 2;

select *
from tbl_board;


---Insert(�Է�), Update(����), Delete(����) ���� Data Manuplation Language(DML)�� (������ ���۾�)��� �θ���.
---DML���� ���� �� ��ũ�� ����(commit)���� ���(rollback)�� ���� ��������� �Ѵ�.

--select (�б�, ��ȸ) ���� Data Query Language(DQL)�� �̶�� �θ���.
--select (�б�, ��ȸ) ���� commit, rollback���� ���� ���谡 ����.





----------- ***  ���̺� ������ �÷����� default �ο��ϱ� *** ------------- 3.24

-- �Խ��� �۾��⸦ �Ҷ� �ۼ����ڿ� �� ��ȸ���� ����ڰ� �Է����� �ʴ��� �ڵ������� � ��(�⺻ ��default)�� �������� �ϰڴ�.

drop table tbl_board purge; --> ���̺� ����

create table tbl_board                                             -- �Խ��� �۾��� ���̺�
(boardno  number                                                    -- �� ��ȣ
, subject varchar2(2000)                                         -- �� ����               
, content Nvarchar2(2000)                                   -- �� ����                   
,userid varchar2(40)                                               -- �۾��� ID
,registerday date default sysdate                         -- �ۼ����� �⺻���� ����ð��� �ο���
,readcount number(10) default 0                         -- ��ȸ�� �⺻���� 0���� ��
);

-- Data Defination Language (DDL ������ ���Ǿ�) ���� �������� CREATE(����), DROP(����, ����),  ALTER(����), TRUNCATE(��� ���� ����)���� �ִ�.
-- DDL���� �����ϸ� �ڵ������� commit�� �ȴ�.

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'Test��1', '�ȳ��ϼ���', 'jiwon', sysdate,0);


insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'Test��2', '�ݰ����ϴ�', 'taeyeon', default, default);

insert into tbl_board (boardno, subject, content, userid)
values(3, 'Test��3', '�ǰ��ϼ���', 'getoutCorona');

-- ����-----------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(4, 'Test��4', '�����Ϸ�Ǽ���', 'goodDay');
--------------------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, content, userid)
values(4, '�����Ϸ�Ǽ���', 'goodDay');

commit;

select *
from tbl_board;

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'HAPPYDAY', 'Lunch Time~~~', 'taeyeon', default, default);




----------- ***  ��������(constraint)�� ����Ͽ� ���̺� �����ϱ� *** -------------
/*
    >>> ��������(constraint) �� ���� <<<
    
    1. Primary key(�⺻Ű) : Primary key�� ������ �÷��� NULL ���� ������� ������, �ߺ��� ���� ���� �� ����.
                                              Primary key�� ���̺�� ���� 1���� ���� �����ϴ�.
                                             1�� �÷��� ���ؼ��� primary key(�⺻Ű)�� �� ���� Single Primary key ��� �θ���,
                                             ������ �÷��� ��� �ϳ��� Primary key�� ������� Composite (���� ) primary key��� �θ���.
                                             �������� �ִ밡 32�� �÷������� �����ϴ�. 
        
        
    2. Unique key : Unique key�� ������ �÷��� �ߺ��� ���� ���� �� ����.
                              ���̺�� 1�� �̻� ������ ������ �����ϴ�.
                              1�� �÷��� Unique key�� �ذ��� Single Unique key��� �θ���,
                              ������ �÷��� ��� �ϳ��� Unique key�� ����� ���� Composite Unique key��� �θ���.
                              �������� �ִ� 32�� �÷������� �����ϴ�.
                               Primary key�� �ٸ����� Unique key�� ������ �÷��� ���� NULL���� ����Ѵ�.
                               
                               
    3. NOT NULL : �ش� �÷��� not null�� �ο��ϸ� �� �÷����� null���� ������� �ʴ´�.        
    
    4. CHECK : � �÷��� ���� �� �ִ� ���� �˻��ϴ� ���������̴�.
                          ������� ������ ��Ÿ���� gender ��� �÷��� �ִ��Ҷ�, 
                          �����ڰ� gender �÷����� ������ 'M', 'm', 'W', 'w'  ���� ���� �� �ֵ��� �Ѵ�.
                          gender �÷��� ���� ���� �� �� ���� 'M', 'm', 'W', 'w' ���� �ƴ����� �˻��ؼ�
                          ������ �Է����ְ� Ʋ���� �ԷºҰ��ϵ��� �ؾ� �Ѵ�.
    
    5. FOREIGN KEY : �ܷ�Ű ( == ����Ű)
                                      FOREIGN KEY�� ���� ���Ἲ�� ���� ���Ǿ�����.
        
*/

drop table tbl_board purge; --> ���̺� ����

create table tbl_board                                            -- �Խ��� �۾��� ���̺�
(boardno  number  primary key                           -- �� ��ȣ   (=�÷�����(�÷�����) PRIMARY KEY)
,subject varchar2(2000)                                        -- �� ����               
,content Nvarchar2(2000)                                   -- �� ����                   
,userid varchar2(40)                                               -- �۾��� ID
,registerday date default sysdate                         -- �ۼ����� �⺻���� ����ð��� �ο���
,readcount number(10) default 0                         -- ��ȸ�� �⺻���� 0���� ��
);

-- ����-----------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(null, 'Test��1', '�ȳ��ϼ���', 'jiwon', sysdate,0);
--------------------------------------------------------------------------------------------------------------

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'Test��1', '�ȳ��ϼ���', 'jiwon', sysdate,0);

-- ����-----------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'HAPPYDAY', 'Lunch Time~~~', 'taeyeon', default, default);
--------------------------------------------------------------------------------------------------------------

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'HAPPYDAY', 'Lunch Time~~~', 'taeyeon', default, default);

desc tbl_board;



----------- ***  tbl_board ���̺� �����Ǿ��� �������� ��ȸ�غ���  *** -------------
select *
from user_constraints; --> ��� ���̺� ��ȸ

select *
from user_constraints
where table_name = 'TBL_BOARD';     ---> ����Ŭ�� �ٵ����Ͱ��ڸ�ŭ�� ��ҹ��ڸ� �����Ѵ�. 

/*
    CONSTRAINT_TYPE  ===> P �� ���ϴ� ���� Primary key�̴�.
*/

select *
from user_cons_columns ---> ���������� �ɸ� �÷��� ��ȸ
where table_name = 'TBL_BOARD';




----------- *** Composite(����) Primary key ����  *** -------------
drop table tbl_order purge;

create table tbl_order
(conid varchar2(20)                             -- �� ID
,productcode varchar2(40)                 -- ��ǰ�ڵ�
,orderdate date default sysdate         -- �ֹ����� 
,orderquantity number                          -- �ֹ���
,constraint PK_tbl_jumun primary key(conid, productcode,orderdate) -- ���̺���(���̺� ����) PRIMARY KEY
);

insert into tbl_order (conid,productcode,orderdate,orderquantity)
values('kim', 'swk', sysdate, 10);

insert into tbl_order (conid,productcode,orderdate,orderquantity)
values('kwak', 'swk', sysdate, 20);

insert into tbl_order (conid,productcode,orderdate,orderquantity)
values('kim', 'ypr', sysdate, 5);

insert into tbl_order (conid,productcode,orderdate,orderquantity)
values('kim', 'swk', sysdate, 30);

commit;

select *
from tbl_order;

select conid
            , productcode
            , to_char(orderdate, 'yyyy-mm-dd hh24:mi:ss') as �ֹ�����  --> alias (����)
            , orderquantity
from tbl_order;





----------- ***  tbl_order ���̺� �����Ǿ��� �������� ��ȸ�غ���  *** -------------

select *
from user_cons_columns
where table_name = 'TBL_ORDER';     ---> ����Ŭ�� �ٵ����Ͱ��ڸ�ŭ�� ��ҹ��ڸ� �����Ѵ�. 




----------- *** Unique key ����  *** -------------
-- �Ϲ������� Unique key�� �ĺ�Ű�� ���Ǿ�����.

drop table tbl_student PURGE;

    create table tbl_student(
    hakbun varchar2(20)  -- primary key         --> �÷�����(�÷� ����) primary key�� �ָ� �������Ǹ��� �ڵ������� sys_ ����� ��� �����Ǿ����Ƿ� �������� ������ ����������.
    ,jumin varchar2(13)  --unique                   
    ,name varchar2(30)
    ,constraint PK_tbl_student_hakbun primary key (hakbun)  --> ���̺���(���̺� ����) PRIMARY KEY
  --                      �� �������Ǹ��� �ִ� 30���ڱ����� �����ϹǷ� 30���� �̳����� �۸��� �ؾ��Ѵ�.
    ,constraint UQ_tbl_student_jumin unique (jumin) 
    );


select *
from user_constraints
where table_name = 'TBL_STUDENT';


select *
from user_cons_columns
where table_name = 'TBL_STUDENT';

truncate table tbl_student;           ---> DDL�� �̹Ƿ� �ڵ������� commit �Ǿ����Ƿ� ���� �� rollback �Ұ���!
--> tbl_student ���̺� ����� ��� ����� ������



insert into tbl_student(hakbun, jumin, name)
values('20200301' , '001230', '������');

insert into tbl_student(hakbun, jumin, name)
values('20200322' , '023289', '��Ƣ��');

insert into tbl_student(hakbun, jumin, name)
values('00197523' , null, '�踻��');                   --- ����Ŭ�� jumin �÷��� unique ������ �ɾ����� jumin �÷��� null�� ����Ѵٸ�, �������� ����  jumin �÷���  null�� �ο� ����
                                                                                --- ����ũ�μ���Ʈ���� MS-SQL Server ��ǰ�� null�� unique�� ���Ƿ� unique������ �ִ� �÷����� ������ 1���� �࿡ ���ؼ��� null�� ����Ѵ�.

insert into tbl_student(hakbun, jumin, name)
values('00197524' , null, '�踻��');

commit;

select *
from tbl_student;

desc tbl_student;






----------- *** NOT NULL ���� ����  *** -------------
-- �Ϲ������� not null ������ �ʼ� �Է»��׿� ���Ǿ�����.

drop table tbl_student PURGE;

    create table tbl_student(
    hakbun varchar2(20) 
    ,jumin varchar2(13)  not null  -- not null ������ �÷� ����(�÷� ����)���� �����.
    ,name varchar2(30) not null
    ,phone varchar2(20) null  -- ���� null �Ƚᵵ null�� ����Ѵٴ� �ǹ̸� ����
    ,constraint PK_tbl_student_hakbun primary key (hakbun)  
    ,constraint UQ_tbl_student_jumin unique (jumin) 
    );


select *
from user_constraints
where table_name = 'TBL_STUDENT';


select *
from user_cons_columns
where table_name = 'TBL_STUDENT';

truncate table tbl_student;           ---> DDL�� �̹Ƿ� �ڵ������� commit �Ǿ����Ƿ� ���� �� rollback �Ұ���!
--> tbl_student ���̺� ����� ��� ����� ������



insert into tbl_student(hakbun, jumin, name, phone)
values('20200301' , '001230', '������', '01054783320');

insert into tbl_student(hakbun, jumin, name, phone)
values('20200322' , '023289', '��Ƣ��', null);

insert into tbl_student(hakbun, jumin, name, phone)
values('00197523' , null, '�踻��');                  

insert into tbl_student(hakbun, jumin, name)
values('00197524' , null, '�踻��');

insert into tbl_student(hakbun, jumin, name)
values('00197524' , '123245', '�踻��');


commit;

select *
from tbl_student;

desc tbl_student;









----------- *** CHECK ���� ����  *** -------------
create table tbl_jikwon(
 jikno varchar2(10)
 , name varchar2(10) not null
 , email varchar2(50) not null
 , gender varchar2(1) not null
 , jik varchar2(10) default '���'            --����
,constraint PK_tbl_jikwon_jikno primary key(jikno)
,constraint UQ_tbl_jikwon_email unique (email)
,constraint CK_tbl_jikwon_genderl check ( gender in ('M', 'm', 'W', 'w') )
                                                                                     -- �� OR(�Ǵ�) �̶�� ��
                                                                                     -- gender �÷��� ���� �� �ִ� ���� 'M' �Ǵ� 'm' �Ǵ� 'W' �Ǵ� 'w'�� �����ϴ�.
 ,constraint CK_tbl_jikwon_jik check ( jik in ('����', '����', '����', '����', '�븮', '����', '���') )                                                                                    
 );
 
 
 insert into tbl_jikwon(jikno, name, email, gender, jik)
 values('1001', 'ȫ�浿', 'hongs@naver.com', 'M', '����');
 
 select *
 from tbl_jikwon;
 
 select *
 from user_constraints
 where table_name = 'TBL_JIKWON';
 --C (check ����)
 
 select *
 from user_cons_columns
 where table_name = 'TBL_JIKWON';
 
 
 
 
 
 
 ----------- *** FOREIGN KEY �ܷ�Ű(=����Ű) ����  *** -------------
 --�� ���̺��� drop �� ���� �ڽ� ���̺�(���� �Ϸ��� ���̺�)�� ���� �����ϰ�,
 --     �� ������ �θ� ���̺�(���� �޴� ���̺�)�� �����Ѵ�.
 
 drop table tbl_board purge;       --> �ڽ� ���̺� (���� �Ϸ��� ���̺�)   ==> ���� ����
 drop table tbl_member purge;   --> �θ� ���̺� (���� �޴� ���̺�)


create table tbl_member(            -- ȸ�� ���̺� (�Խ��� �۾��� ���̺��� ������ �޴� ���̺�)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,constraint PK_tbl_member_userid primary key (userid)      --> ������ �޾ƾ� �ϹǷ� userid�� primary key ������ ��
);


create table tbl_board                                                          -- �Խ��� �۾��� ���̺�
(boardno            number                                                       -- �� ��ȣ   (=�÷�����(�÷�����) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- �� ����               
,content            Nvarchar2(2000)     not null                    -- �� ����                   
,fk_userid           varchar2(40)            not null                    -- �۾��� ID
,registerday       date default sysdate                                  -- �ۼ����� �⺻���� ����ð��� �ο���
,readcount         number(10) default 0                                -- ��ȸ�� �⺻���� 0���� ��
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                      --> �ڽ� ���̺�
                                                            references tbl_member(userid)       --> �θ� ���̺�(���� �޴� ���̺�)
);   --> ���Ե� ȸ���� �� �� �� ����
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '����', '��', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '����', '����', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values (null , 'abcd', '���׸�', '�۹���', 'dongdong@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values (null , 'qwe1233', '�ƹ��ų�', '�ƹ��뷡', 'music@gmail.com');
 
 
 commit;
 
 select *
 from tbl_member;
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^��^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member �� ���� userid�� ������ ����
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '������', '���������� ', null);
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '�Ϸ簡 ������', '�Ϸ��Ϸ� ', 'jwon');
 
 desc tbl_board;
 
 select *
 from tbl_board;
 
 
 select A.boardno AS �۹�ȣ 
            , A.subject  AS ������ 
            , B.nickname AS �г���
            , to_char(A.registerday, 'yyyy-mm-dd hh24:mi:ss') AS �ۼ�����
            , A.readcount AS ��ȸ��
 from tbl_board A inner join tbl_member B  --> �۾��⸦ A�� �θ��� ȸ���� B�� �θ�����
 on A.fk_userid = B.userid;
 
 
 ----ȸ��Ż�� 
 delete from tbl_member
 where userid = 'jwon';     --> �ڽ� ���̺��� �����ϰ� �ֱ� ������ ���� �ȵ� 
 
 commit;
 
 
 
 
 
 ----------- *** FOREIGN KEY : ON DELETE CASCADE �ɼ� ����ϱ�  *** -------------
 drop table tbl_board purge;
 
 drop table tbl_member purge;
 
 
create table tbl_member(            -- ȸ�� ���̺� (�Խ��� �۾��� ���̺��� ������ �޴� ���̺�)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,constraint PK_tbl_member_userid primary key (userid)      --> ������ �޾ƾ� �ϹǷ� userid�� primary key ������ ��
);

 
 create table tbl_board                                                          -- �Խ��� �۾��� ���̺�
(boardno            number                                                       -- �� ��ȣ   (=�÷�����(�÷�����) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- �� ����               
,content            Nvarchar2(2000)     not null                    -- �� ����                   
,fk_userid           varchar2(40)            not null                    -- �۾��� ID
,registerday       date default sysdate                                  -- �ۼ����� �⺻���� ����ð��� �ο���
,readcount         number(10) default 0                                -- ��ȸ�� �⺻���� 0���� ��
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                            references tbl_member(userid) on delete cascade     
);   --> ���Ե� ȸ���� �� �� �� ����
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '����', '��', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '����', '����', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('dong' , 'abcd', '���׸�', '�۹���', 'dongdong@gmail.com');

 
 
 commit;
 rollback;
 
 select *
 from tbl_member;
 
select *
from tbl_board;
 
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^��^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member �� ���� userid�� ������ ����
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '������', '���������� ', 'jwon');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '�Ϸ簡 ������', '�Ϸ��Ϸ� ', 'dong');
 
 
 delete from tbl_member
 where userid = 'jwon';
 
 
 
 
 
 
 
 
 
 ----------- *** FOREIGN KEY : ON DELETE SET NULL �ɼ� ����ϱ�  *** -------------
 drop table tbl_board purge;
 
 drop table tbl_member purge;
 
 
create table tbl_member(            -- ȸ�� ���̺� (�Խ��� �۾��� ���̺��� ������ �޴� ���̺�)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,constraint PK_tbl_member_userid primary key (userid)      --> ������ �޾ƾ� �ϹǷ� userid�� primary key ������ ��
);

 
 create table tbl_board                                                          -- �Խ��� �۾��� ���̺�
(boardno            number                                                       -- �� ��ȣ   (=�÷�����(�÷�����) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- �� ����               
,content            Nvarchar2(2000)     not null                    -- �� ����                   
,fk_userid           varchar2(40)                                              -- �۾��� ID
,registerday       date default sysdate                                  -- �ۼ����� �⺻���� ����ð��� �ο���
,readcount         number(10) default 0                                -- ��ȸ�� �⺻���� 0���� ��
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                            references tbl_member(userid) on delete set null   
);   --> ���Ե� ȸ���� �� �� �� ����
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '����', '��', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '����', '����', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('dong' , 'abcd', '���׸�', '�۹���', 'dongdong@gmail.com');

 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('home' , 'ggogo', '������', '������', 'myhouse@gmail.com');
 
 
 commit;
 rollback;
 
 select *
 from tbl_member;
 
select *
from tbl_board;
 
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^��^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member �� ���� userid�� ������ ����
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '������', '���������� ', 'jwon');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '�Ϸ簡 ������', '�Ϸ��Ϸ� ', 'dong');
 
 
 delete from tbl_member
 where userid = 'jwon';
 
 
 
 
 
 
  ----------- *** FOREIGN KEY ������ � �θ� ���̺� ���� ����(delete)�� �Ұ��� ��� delete�� ���� �ʰ� update�� ó���ؼ� delete ȿ���� �������� �ϱ� *** -------------
  
  drop table tbl_board purge;
 
 drop table tbl_member purge;
 
 
create table tbl_member(            -- ȸ�� ���̺� (�Խ��� �۾��� ���̺��� ������ �޴� ���̺�)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,status              number(1)                default 1              -- status �÷� ���� 1�̸� ��� ������ ���·� ���� (�����ڳ����� ���)
                                                                                           -- status �÷� ���� 0�̸� ��� �Ұ����� ���·� ����
,constraint PK_tbl_member_userid primary key (userid)      --> ������ �޾ƾ� �ϹǷ� userid�� primary key ������ ��
,constraint CK_tbl_member_status check ( status in (1,0) )
);

 
 create table tbl_board                                                          -- �Խ��� �۾��� ���̺�
(boardno            number                                                       -- �� ��ȣ   (=�÷�����(�÷�����) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- �� ����               
,content            Nvarchar2(2000)     not null                    -- �� ����                   
,fk_userid           varchar2(40)            not null                    -- �۾��� ID
,registerday       date default sysdate                                  -- �ۼ����� �⺻���� ����ð��� �ο���
,readcount         number(10) default 0                                -- ��ȸ�� �⺻���� 0���� ��
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                            references tbl_member(userid)
);   --> ���Ե� ȸ���� �� �� �� ����
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '����', '��', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '����', '����', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('dong' , 'abcd', '���׸�', '�۹���', 'dongdong@gmail.com');

 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('home' , 'ggogo', '������', '������', 'myhouse@gmail.com');
 
 
 commit;
 rollback;
 
 select *
 from tbl_member;
 
select *
from tbl_board;
 
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^��^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member �� ���� userid�� ������ ����
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '������', '���������� ', 'jwon');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '�Ϸ簡 ������', '�Ϸ��Ϸ� ', 'dong');
 
 
 delete from tbl_member
 where userid = 'jwon';         --> ���� ���Ἲ ������ ���� 
 -- ���� ���� -
--  ORA-02292: integrity constraint (HR.PK_TBL_BOARD_USERID) violated - child record found
 
 
 ---- **ȸ�� Ż�� update�� ó���ϰڴ� 
 ---- ȸ�� Ż���� ������ Ż�� �� ���̻� �α����� ���� �ʵ��ϸ� ���ָ� ��
 update tbl_member set status = 0
 where userid = 'jwon';
 
 commit;
 
 
 select count(*)
 from tbl_member
 where status = 1 and userid = 'jwon' and pwd = '8888';
 
 select *
 from tbl_member
 where status =1  and userid = 'dong' and pwd = 'abcd';
 
 select *
 from tbl_member
 where status = 1;
 
 select count(*)
 from tbl_member;       --> �� ����� �˷���
 
 select count (*)
 from tbl_member
 where status = 1;
 
 
 
 
  ----------- *** �� �ϱ��Ұ� !!!!!! *** -------------
            --case when then else end
  ----------------------------------------------------------
  
  select 1+2
  from dual; --> �������̺�
  
  select case 5+2 
              when 3 then '5+2=3�Դϴ�'   --> 5+2�� 3�� ����? ���ٶ�� '����'����ض�
              when 7 then '5+2=7�Դϴ�'
              else '�𸣰ڽ��ϴ�'
              end
  from dual ;
  
  
    select case 5+2 
              when 3 then '5+2=3�Դϴٷ���'   --> 5+2�� 3�� ����? ���ٶ�� '����'����ض�
              when 7 then '5+2=7�Դϴٶ���'
              else '�𸣰ڽ��ϴ�'
              end AS ����1,
              
              case 
              when ( 10 > 20 ) then '10�� 20���� Ů�ϴ�'
              when ( 'a' = 'b' ) then 'a�� b�� �����ϴ�'
              else '�����'
              end AS ����2
  from dual ;
  
  
  select case (  select count(*)
                            from tbl_member
                            where status = 1 and userid = 'jwon' and pwd = '8888')
                            when 1 then '�α��� ����'
                            else '�α��� ����'
                            end AS �α��νõ�
  from dual;