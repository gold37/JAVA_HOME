show user;

select *
from dba_users;   -- sys 또는 system만 조회가 가능하다.

-- 현재 오라클 서버에 접속한 사용자 (HR) 소유의 모든 테이블 및 뷰 목록 조회하기
select * from tab;

select *
from departments;

select *
from employees;

desc departments;






                ----------------- *** 테이블 생성하기 ***---------------------3.23
drop table tbl_board purge;
                
create table tbl_board                -- 게시판 글쓰기 테이블
(boardno  number                       -- 글 번호
, subject varchar2(2000)            -- 글 제목               
, content Nvarchar2(2000)       -- 글 내용                   
,userid varchar2(40)                   -- 글쓴이 ID
,registerday date                          -- 작성일자
,readcount number(10)               -- 조회수
);


------ ** 테이블을 생성한 이후에는 반드시 코멘트(주석)를 꼭 달아주도록하자 !!!!! ** -------
select *
from user_tab_comments;

comment on table tbl_board 
is '게시판 글쓰기 테이블';


------ ** 생성된 테이블의 컬럼에도 반드시 코멘트(주석)를 꼭 달아주도록하자 !!!!! ** -------
select *
from user_col_comments
where table_name = 'EMPLOYEES';  -- 테이블명 꼭 대문자로!!

select *
from user_col_comments
where table_name = 'TBL_BOARD';

comment on column tbl_board.boardno 
is '게시글 번호(숫자로 들어온다)';

comment on column tbl_board.subject
is '글제목';

comment on column tbl_board.content
is '글내용';

comment on column tbl_board.userid
is '게시글 사용자 ID';

comment on column tbl_board.registerday
is '작성일자';

comment on column tbl_board.readcount
is '글 조회수(조회수 증가는 자신이 쓴 글이라면 증가X, 다른 사람이 쓴 글을 조회할때만 증가O)';



----------- *** 1. tbl_board 테이블 속에 데이터 입력하기 *** -------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'Test글1', '안녕하세요', 'jiwon', sysdate,0);
-- sysdate는 현재 시각을 보여줌

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'Test글2', '반갑습니다', 'taeyeon', sysdate,0);

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(3, 'Test글3', '건강하세요', 'getoutCorona', sysdate,0);

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(4, 'Test글4', '좋은하루되세요', 'goodDay', sysdate,0);

commit;




----------- *** 2. tbl_board 테이블 속에 들어있는 모든 데이터 조회하기 *** -------------
select boardno, subject, content, userid, registerday, readcount
from tbl_board ;

select *
from tbl_board ;

/*
        ==== ☆★☆★ select문 (Data Query Language)문 처리순서 ☆★☆★ ====
        select 컬럼명1, 컬럼명2, ...       --⑤
        from 테이블명(또는 뷰 명)        --①
        where 조건절                              --②   where 조건절이 뜻하는 것은 from 다음에 나오는 테이블명(또는 뷰 명)에서 조건에 만족하는 행을 메모리에 로딩시켜 퍼올리는 것이다 !!!!!
        group by 절                                 --③
        having 그룹함수 조건절            --④
        order by 절                                  --⑥
        
*/

----- >>> 문제 :  tbl_board 테이블에서 글번호가 2인 게시글의 모든 정보를 조회하세요
select *
from tbl_board
where boardno=2;

----- >>> 문제 :  tbl_board 테이블에서 글쓴이의 id가 'jiwon'인 게시글의 모든 정보를 조회하세요
select *
from tbl_board
where userid = 'jiwon';

----- >>> 문제 :  tbl_board 테이블에서 글쓴이의 id가 'jiwon'인 게시글의 글제목, 글쓴이ID, 작성일자를 조회하세요
select subject, userid, registerday
from tbl_board
where userid='jiwon';


----------- ***  3. tbl_board 테이블 속에 들어있는 데이터 값 변경(수정)하기 *** -------------
update tbl_board set subject = '퇴근합시다',
                                       readcount = 120;
                                       
commit;

select *
from tbl_board;

update tbl_board set readcount = 0;

update tbl_board set subject='Test글1'
where boardno = 1;

update tbl_board set subject='Test글2'
where  boardno =2;

update tbl_board set subject='Test글3'
where  boardno =3;

---------- 중복 행 한개 삭제하기 ------------
select rowid, boardno, subject
from tbl_board;

delete from tbl_board
where rowid = 'AAAE5vAAEAAAAFcAAA';

commit; 

select *
from tbl_board;

rollback;




-------commit 은 디스크에 저장하는거
update tbl_board set userid= 'ryujin'
where boardno  = 3;

select *
from tbl_board;
-------저장시키지마시오는 rollback
rollback;



update tbl_board set content = '퇴근합시다'
where boardno  = 3;





----------- ***  4. tbl_board 테이블 속에 들어있는 행(row) 삭제하기 *** -------------
delete from tbl_board;
rollback;

delete from tbl_board
where boardno = 2;

select *
from tbl_board;


---Insert(입력), Update(수정), Delete(삭제) 문을 Data Manuplation Language(DML)문 (데이터 조작어)라고 부른다.
---DML문은 실행 후 디스크에 저장(commit)할지 취소(rollback)을 할지 결정해줘야 한다.

--select (읽기, 조회) 문을 Data Query Language(DQL)문 이라고 부른다.
--select (읽기, 조회) 문은 commit, rollback과는 전혀 관계가 없다.





----------- ***  테이블 생성시 컬럼값에 default 부여하기 *** ------------- 3.24

-- 게시판 글쓰기를 할때 작성일자와 글 조회수는 사용자가 입력하지 않더라도 자동적으로 어떤 값(기본 값default)이 들어오도록 하겠다.

drop table tbl_board purge; --> 테이블 삭제

create table tbl_board                                             -- 게시판 글쓰기 테이블
(boardno  number                                                    -- 글 번호
, subject varchar2(2000)                                         -- 글 제목               
, content Nvarchar2(2000)                                   -- 글 내용                   
,userid varchar2(40)                                               -- 글쓴이 ID
,registerday date default sysdate                         -- 작성일자 기본값은 현재시각을 부여함
,readcount number(10) default 0                         -- 조회수 기본값은 0으로 함
);

-- Data Defination Language (DDL 데이터 정의어) 문의 종류에는 CREATE(생성), DROP(제거, 삭제),  ALTER(변경), TRUNCATE(모든 행을 삭제)등이 있다.
-- DDL문을 실행하면 자동적으로 commit이 된다.

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'Test글1', '안녕하세요', 'jiwon', sysdate,0);


insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'Test글2', '반갑습니다', 'taeyeon', default, default);

insert into tbl_board (boardno, subject, content, userid)
values(3, 'Test글3', '건강하세요', 'getoutCorona');

-- 오류-----------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(4, 'Test글4', '좋은하루되세요', 'goodDay');
--------------------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, content, userid)
values(4, '좋은하루되세요', 'goodDay');

commit;

select *
from tbl_board;

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'HAPPYDAY', 'Lunch Time~~~', 'taeyeon', default, default);




----------- ***  제약조건(constraint)을 사용하여 테이블 생성하기 *** -------------
/*
    >>> 제약조건(constraint) 의 종류 <<<
    
    1. Primary key(기본키) : Primary key로 지정된 컬럼은 NULL 값을 허용하지 않으며, 중복된 값도 가질 수 없다.
                                              Primary key는 테이블당 오직 1개만 생성 가능하다.
                                             1개 컬럼에 대해서만 primary key(기본키)를 준 것은 Single Primary key 라고 부르고,
                                             여러개 컬럼을 묶어서 하나의 Primary key를 만든것을 Composite (복합 ) primary key라고 부른다.
                                             여러개는 최대가 32개 컬럼까지만 가능하다. 
        
        
    2. Unique key : Unique key로 지정된 컬럼은 중복된 값을 가질 수 없다.
                              테이블당 1개 이상 여러개 생성이 가능하다.
                              1개 컬럼에 Unique key를 준것은 Single Unique key라고 부르고,
                              여러개 컬럼을 묶어서 하나의 Unique key를 만드는 것을 Composite Unique key라고 부른다.
                              여러개는 최대 32개 컬럼까지만 가능하다.
                               Primary key와 다른점은 Unique key로 설정된 컬럼에 대해 NULL값을 허락한다.
                               
                               
    3. NOT NULL : 해당 컬럼에 not null을 부여하면 그 컬럼에는 null값을 허락하지 않는다.        
    
    4. CHECK : 어떤 컬럼에 들어올 수 있는 값을 검사하는 제약조건이다.
                          예를들어 성별을 나타내는 gender 라는 컬럼이 있다할때, 
                          개발자가 gender 컬럼에는 오로지 'M', 'm', 'W', 'w'  값만 들어올 수 있도록 한다.
                          gender 컬럼에 값을 넣을 때 그 값이 'M', 'm', 'W', 'w' 인지 아닌지를 검사해서
                          맞으면 입력해주고 틀리면 입력불가하도록 해야 한다.
    
    5. FOREIGN KEY : 외래키 ( == 참조키)
                                      FOREIGN KEY는 참조 무결성을 위해 사용되어진다.
                                      참조 무결성은 어떤 컬럼에 값을 입력하든지 또는 수정할때 그 값은 FOREIGN KEY가 참조하는 컬럼(부모 테이블)의 데이터값만 입력 또는 수정이 가능하다.
                                      참조받는 테이블(부모 테이블)이 먼저 생성돼야한다. 
                                      FOREIGN KEY가 참조하는 컬럼은 NOT NULL이어야 하고, 고유한 값만 들어와야 한다. ( ex) Primary key 또는 NOT NULL이면서 Unique key )
        
*/

drop table tbl_board purge; --> 테이블 삭제

create table tbl_board                                            -- 게시판 글쓰기 테이블
(boardno  number  primary key                           -- 글 번호   (=컬럼레벨(컬럼수준) PRIMARY KEY)
,subject varchar2(2000)                                        -- 글 제목               
,content Nvarchar2(2000)                                   -- 글 내용                   
,userid varchar2(40)                                               -- 글쓴이 ID
,registerday date default sysdate                         -- 작성일자 기본값은 현재시각을 부여함
,readcount number(10) default 0                         -- 조회수 기본값은 0으로 함
);

-- 오류-----------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(null, 'Test글1', '안녕하세요', 'jiwon', sysdate,0);
--------------------------------------------------------------------------------------------------------------

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'Test글1', '안녕하세요', 'jiwon', sysdate,0);

-- 오류-----------------------------------------------------------------------------------------------------
insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(1, 'HAPPYDAY', 'Lunch Time~~~', 'taeyeon', default, default);
--------------------------------------------------------------------------------------------------------------

insert into tbl_board (boardno, subject, content, userid, registerday, readcount)
values(2, 'HAPPYDAY', 'Lunch Time~~~', 'taeyeon', default, default);

desc tbl_board;



----------- ***  tbl_board 테이블에 생성되어진 제약조건 조회해보기  *** -------------
select *
from user_constraints; --> 모든 테이블 조회

select *
from user_constraints
where table_name = 'TBL_BOARD';     ---> 오라클은 ☆데이터값★만큼은 대소문자를 구분한다. 

/*
    CONSTRAINT_TYPE  ===> P 가 뜻하는 말은 Primary key이다.
*/

select *
from user_cons_columns ---> 제약조건이 걸린 컬럼명 조회
where table_name = 'TBL_BOARD';




----------- *** Composite(복합) Primary key 예제  *** -------------
drop table tbl_order purge;

create table tbl_order
(conid varchar2(20)                             -- 고객 ID
,productcode varchar2(40)                 -- 제품코드
,orderdate date default sysdate         -- 주문일자 
,orderquantity number                          -- 주문량
,constraint PK_tbl_jumun primary key(conid, productcode,orderdate) -- 테이블레벨(테이블 수준) PRIMARY KEY
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
            , to_char(orderdate, 'yyyy-mm-dd hh24:mi:ss') as 주문일자  --> alias (별명)
            , orderquantity
from tbl_order;





----------- ***  tbl_order 테이블에 생성되어진 제약조건 조회해보기  *** -------------

select *
from user_cons_columns
where table_name = 'TBL_ORDER';     ---> 오라클은 ☆데이터값★만큼은 대소문자를 구분한다. 




----------- *** Unique key 예제  *** -------------
-- 일반적으로 Unique key는 후보키로 사용되어진다.

drop table tbl_student PURGE;

    create table tbl_student(
    hakbun varchar2(20)  -- primary key         --> 컬럼레벨(컬럼 수준) primary key를 주면 제약조건명은 자동적으로 sys_ 블라블라 라고 생성되어지므로 유지보수 관리가 불편해진다.
    ,jumin varchar2(13)  --unique                   
    ,name varchar2(30)
    ,constraint PK_tbl_student_hakbun primary key (hakbun)  --> 테이블레벨(테이블 수준) PRIMARY KEY
  --                      ▲ 제약조건명은 최대 30글자까지만 가능하므로 30글자 이내에서 작명을 해야한다.
    ,constraint UQ_tbl_student_jumin unique (jumin) 
    );


select *
from user_constraints
where table_name = 'TBL_STUDENT';


select *
from user_cons_columns
where table_name = 'TBL_STUDENT';

truncate table tbl_student;           ---> DDL문 이므로 자동적으로 commit 되어지므로 실행 후 rollback 불가능!
--> tbl_student 테이블에 저장된 모든 행들을 삭제함



insert into tbl_student(hakbun, jumin, name)
values('20200301' , '001230', '덕복희');

insert into tbl_student(hakbun, jumin, name)
values('20200322' , '023289', '덕튀순');

insert into tbl_student(hakbun, jumin, name)
values('00197523' , null, '김말희');                   --- 오라클은 jumin 컬럼에 unique 제약을 걸었지만 jumin 컬럼이 null을 허락한다면, 여러개의 행이  jumin 컬럼에  null값 부여 가능
                                                                                --- 마이크로소프트사의 MS-SQL Server 제품은 null도 unique로 보므로 unique제약이 있는 컬럼에는 오로지 1개의 행에 대해서만 null을 허락한다.

insert into tbl_student(hakbun, jumin, name)
values('00197524' , null, '김말희');

commit;

select *
from tbl_student;

desc tbl_student;






----------- *** NOT NULL 제약 예제  *** -------------
-- 일반적으로 not null 제약은 필수 입력사항에 사용되어진다.

drop table tbl_student PURGE;

    create table tbl_student(
    hakbun varchar2(20) 
    ,jumin varchar2(13)  not null  -- not null 제약은 컬럼 레벨(컬럼 수준)으로 만든다.
    ,name varchar2(30) not null
    ,phone varchar2(20) null  -- 굳이 null 안써도 null을 허락한다는 의미를 가짐
    ,constraint PK_tbl_student_hakbun primary key (hakbun)  
    ,constraint UQ_tbl_student_jumin unique (jumin) 
    );


select *
from user_constraints
where table_name = 'TBL_STUDENT';


select *
from user_cons_columns
where table_name = 'TBL_STUDENT';

truncate table tbl_student;           ---> DDL문 이므로 자동적으로 commit 되어지므로 실행 후 rollback 불가능!
--> tbl_student 테이블에 저장된 모든 행들을 삭제함



insert into tbl_student(hakbun, jumin, name, phone)
values('20200301' , '001230', '덕복희', '01054783320');

insert into tbl_student(hakbun, jumin, name, phone)
values('20200322' , '023289', '덕튀순', null);

insert into tbl_student(hakbun, jumin, name, phone)
values('00197523' , null, '김말희');                  

insert into tbl_student(hakbun, jumin, name)
values('00197524' , null, '김말희');

insert into tbl_student(hakbun, jumin, name)
values('00197524' , '123245', '김말희');


commit;

select *
from tbl_student;

desc tbl_student;









----------- *** CHECK 제약 예제  *** -------------
create table tbl_jikwon(
 jikno varchar2(10)
 , name varchar2(10) not null
 , email varchar2(50) not null
 , gender varchar2(1) not null
 , jik varchar2(10) default '사원'            --직급
,constraint PK_tbl_jikwon_jikno primary key(jikno)
,constraint UQ_tbl_jikwon_email unique (email)
,constraint CK_tbl_jikwon_genderl check ( gender in ('M', 'm', 'W', 'w') )
                                                                                     -- ▲ OR(또는) 이라는 뜻
                                                                                     -- gender 컬럼에 들어올 수 있는 값은 'M' 또는 'm' 또는 'W' 또는 'w'만 가능하다.
 ,constraint CK_tbl_jikwon_jik check ( jik in ('사장', '전무', '부장', '과장', '대리', '주임', '사원') )                                                                                    
 );
 
 
 insert into tbl_jikwon(jikno, name, email, gender, jik)
 values('1001', '홍길동', 'hongs@naver.com', 'M', '과장');
 
 select *
 from tbl_jikwon;
 
 select *
 from user_constraints
 where table_name = 'TBL_JIKWON';
 --C (check 제약)
 
 select *
 from user_cons_columns
 where table_name = 'TBL_JIKWON';
 
 
 
 
 
 
 ----------- *** FOREIGN KEY 외래키(=참조키) 예제  *** -------------
 --※ 테이블을 drop 할 때는 자식 테이블(참조 하려는 테이블)을 먼저 제거하고,
 --     그 다음에 부모 테이블(참조 받는 테이블)을 제거한다.
 
 drop table tbl_board purge;       --> 자식 테이블 (참조 하려는 테이블)   ==> 먼저 지움
 drop table tbl_member purge;   --> 부모 테이블 (참조 받는 테이블)


create table tbl_member(            -- 회원 테이블 (게시판 글쓰기 테이블에서 참조를 받는 테이블)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,constraint PK_tbl_member_userid primary key (userid)      --> 참조를 받아야 하므로 userid에 primary key 제약을 둠
);


create table tbl_board                                                          -- 게시판 글쓰기 테이블
(boardno            number                                                       -- 글 번호   (=컬럼레벨(컬럼수준) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- 글 제목               
,content            Nvarchar2(2000)     not null                    -- 글 내용                   
,fk_userid           varchar2(40)            not null                    -- 글쓴이 ID
,registerday       date default sysdate                                  -- 작성일자 기본값은 현재시각을 부여함
,readcount         number(10) default 0                                -- 조회수 기본값은 0으로 함
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                      --> 자식 테이블
                                                            references tbl_member(userid)       --> 부모 테이블(참조 받는 테이블)
);   --> 가입된 회원만 글 쓸 수 있음
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '워니', '왕', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '지니', '여왕', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values (null , 'abcd', '동그리', '멍뭉이', 'dongdong@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values (null , 'qwe1233', '아무거나', '아무노래', 'music@gmail.com');
 
 
 commit;
 
 select *
 from tbl_member;
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^ㅁ^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member 에 없는 userid기 때문에 오류
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '빙수야', '먹으러가자 ', null);
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '하루가 빠르다', '하루하루 ', 'jwon');
 
 desc tbl_board;
 
 select *
 from tbl_board;
 
 
 select A.boardno AS 글번호 
            , A.subject  AS 글제목 
            , B.nickname AS 닉네임
            , to_char(A.registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자
            , A.readcount AS 조회수
 from tbl_board A inner join tbl_member B  --> 글쓰기를 A라 부르고 회원을 B라 부르겠음
 on A.fk_userid = B.userid;
 
 
 ----회원탈퇴 
 delete from tbl_member
 where userid = 'jwon';     --> 자식 테이블에서 참조하고 있기 때문에 삭제 안됨 
 
 commit;
 
 
 
 
 
 ----------- *** FOREIGN KEY : ON DELETE CASCADE 옵션 사용하기  *** -------------
 drop table tbl_board purge;
 
 drop table tbl_member purge;
 
 
create table tbl_member(            -- 회원 테이블 (게시판 글쓰기 테이블에서 참조를 받는 테이블)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,constraint PK_tbl_member_userid primary key (userid)      --> 참조를 받아야 하므로 userid에 primary key 제약을 둠
);

 
 create table tbl_board                                                          -- 게시판 글쓰기 테이블
(boardno            number                                                       -- 글 번호   (=컬럼레벨(컬럼수준) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- 글 제목               
,content            Nvarchar2(2000)     not null                    -- 글 내용                   
,fk_userid           varchar2(40)            not null                    -- 글쓴이 ID
,registerday       date default sysdate                                  -- 작성일자 기본값은 현재시각을 부여함
,readcount         number(10) default 0                                -- 조회수 기본값은 0으로 함
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                            references tbl_member(userid) on delete cascade     
);   --> 가입된 회원만 글 쓸 수 있음
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '워니', '왕', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '지니', '여왕', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('dong' , 'abcd', '동그리', '멍뭉이', 'dongdong@gmail.com');

 
 
 commit;
 rollback;
 
 select *
 from tbl_member;
 
select *
from tbl_board;
 
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^ㅁ^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member 에 없는 userid기 때문에 오류
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '빙수야', '먹으러가자 ', 'jwon');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '하루가 빠르다', '하루하루 ', 'dong');
 
 
 delete from tbl_member
 where userid = 'jwon';
 
 
 
 
 
 
 
 
 
 ----------- *** FOREIGN KEY : ON DELETE SET NULL 옵션 사용하기  *** -------------
 drop table tbl_board purge;
 
 drop table tbl_member purge;
 
 
create table tbl_member(            -- 회원 테이블 (게시판 글쓰기 테이블에서 참조를 받는 테이블)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,constraint PK_tbl_member_userid primary key (userid)      --> 참조를 받아야 하므로 userid에 primary key 제약을 둠
);

 
 create table tbl_board                                                          -- 게시판 글쓰기 테이블
(boardno            number                                                       -- 글 번호   (=컬럼레벨(컬럼수준) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- 글 제목               
,content            Nvarchar2(2000)     not null                    -- 글 내용                   
,fk_userid           varchar2(40)                                              -- 글쓴이 ID
,registerday       date default sysdate                                  -- 작성일자 기본값은 현재시각을 부여함
,readcount         number(10) default 0                                -- 조회수 기본값은 0으로 함
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                            references tbl_member(userid) on delete set null   
);   --> 가입된 회원만 글 쓸 수 있음
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '워니', '왕', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '지니', '여왕', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('dong' , 'abcd', '동그리', '멍뭉이', 'dongdong@gmail.com');

 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('home' , 'ggogo', '집가자', '집순이', 'myhouse@gmail.com');
 
 
 commit;
 rollback;
 
 select *
 from tbl_member;
 
select *
from tbl_board;
 
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^ㅁ^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member 에 없는 userid기 때문에 오류
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '빙수야', '먹으러가자 ', 'jwon');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '하루가 빠르다', '하루하루 ', 'dong');
 
 
 delete from tbl_member
 where userid = 'jwon';
 
 
 
 
 
 
  ----------- *** FOREIGN KEY 때문에 어떤 부모 테이블 행의 삭제(delete)가 불가한 경우 delete로 하지 않고 update로 처리해서 delete 효과를 가지도록 하기 *** -------------
  
  drop table tbl_board purge;
 
 drop table tbl_member purge;
 
 
create table tbl_member(            -- 회원 테이블 (게시판 글쓰기 테이블에서 참조를 받는 테이블)
userid               varchar2(20)           
,pwd                 varchar2(30)           not null
,name              varchar2(20)           not null
,nickname        varchar2(20)           not null
,email               varchar2(50)
,status              number(1)                default 1              -- status 컬럼 값이 1이면 사용 가능한 상태로 보자 (개발자끼리의 약속)
                                                                                           -- status 컬럼 값이 0이면 사용 불가능한 상태로 보자
,constraint PK_tbl_member_userid primary key (userid)      --> 참조를 받아야 하므로 userid에 primary key 제약을 둠
,constraint CK_tbl_member_status check ( status in (1,0) )
);

 
 create table tbl_board                                                          -- 게시판 글쓰기 테이블
(boardno            number                                                       -- 글 번호   (=컬럼레벨(컬럼수준) PRIMARY KEY)
,subject              varchar2(2000)        not null                    -- 글 제목               
,content            Nvarchar2(2000)     not null                    -- 글 내용                   
,fk_userid           varchar2(40)            not null                    -- 글쓴이 ID
,registerday       date default sysdate                                  -- 작성일자 기본값은 현재시각을 부여함
,readcount         number(10) default 0                                -- 조회수 기본값은 0으로 함
,constraint PK_tbl_board_boardno primary key(boardno)
,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                            references tbl_member(userid)
);   --> 가입된 회원만 글 쓸 수 있음
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jiwonnee' , '7777', '워니', '왕', 'wannie@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('jwon' , '8888', '지니', '여왕', 'jwjw@gmail.com');
 
 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('dong' , 'abcd', '동그리', '멍뭉이', 'dongdong@gmail.com');

 insert into tbl_member(userid, pwd, name, nickname, email)
 values ('home' , 'ggogo', '집가자', '집순이', 'myhouse@gmail.com');
 
 
 commit;
 rollback;
 
 select *
 from tbl_member;
 
select *
from tbl_board;
 
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (1, 'HELLO', 'Welcome^ㅁ^!!', 'jiwonnee');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (2, 'Sleep', 'Haamm...... ', 'Zzz');    ---> tbl_member 에 없는 userid기 때문에 오류
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (3, '빙수야', '먹으러가자 ', 'jwon');
 
 insert into tbl_board(boardno, subject, content, fk_userid)
 values (4, '하루가 빠르다', '하루하루 ', 'dong');
 
 
 delete from tbl_member
 where userid = 'jwon';         --> 참조 무결성 때문에 오류 
 -- 오류 보고 -
--  ORA-02292: integrity constraint (HR.PK_TBL_BOARD_USERID) violated - child record found
 
 
 ---- **회원 탈퇴 update로 처리하겠다 
 ---- 회원 탈퇴의 목적은 탈퇴 후 더이상 로그인이 되지 않도록만 해주면 됨
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
 from tbl_member;       --> 행 몇개인지 알려줌
 
 select count (*)
 from tbl_member
 where status = 1;
 
 
 
 
  ----------- *** 꼭 암기할것 !!!!!! *** -------------
            --case when then else end
  ----------------------------------------------------------
  
  select 1+2
  from dual; --> 가상테이블
  
  select case 5+2 
              when 3 then '5+2=3입니다'   --> 5+2가 3과 같니? 같다라면 '문구'출력해라
              when 7 then '5+2=7입니다'
              else '모르겠습니다'
              end
  from dual ;
  
  
    select case 5+2 
              when 3 then '5+2=3입니다롱이'   --> 5+2가 3과 같니? 같다라면 '문구'출력해라
              when 7 then '5+2=7입니다람쥐'
              else '모르겠습니다'
              end AS 예제1,
              
              case 
              when ( 10 > 20 ) then '10은 20보다 큽니다'
              when ( 'a' = 'b' ) then 'a는 b와 같습니다'
              else '몰라요'
              end AS 예제2
  from dual ;
  
  
  select case (  select count(*)
                            from tbl_member
                            where status = 1 and userid = 'jwon' and pwd = '8888')
                            when 1 then '로그인 성공'
                            else '로그인 실패'
                            end AS 로그인시도
  from dual;
  
  
  
  
  
  
    ----------- *** 제약조건의 조회 *** -------------3.25
    select *
    from user_constraints
    where table_name = 'TBL_JIKWON';
    
    
    select *
    from user_constraints
    where table_name = 'TBL_MEMBER';
    
    select *
    from user_constraints
    where table_name = 'TBL_BOARD';
    /*
    
    P -- Primary key
    U -- Unique key
    C -- Check 
    C -- NOT NULL
    R -- (reference key) Foreign key
    
    
    */
    
    
      
    ----------- *** 컬럼 조회 *** -------------
    select *
    from user_cons_columns
    where table_name = 'TBL_JIKWON';
    
    select *
    from user_cons_columns
    where table_name = 'TBL_MEMBER';
    
    
    select *
    from user_cons_columns
    where table_name = 'TBL_BOARD';
    
    
     ----------- *** TBL_JIKWON 테이블에 존재하는 CHECK제약 내용 변경하기 *** -------------
     -------- 제약 조건을 변경하려면 변경해주는 명령어가 없기때문에 기존 제약조건을 삭제하고 새로 만들어야한다.
        
    ----------- *** 제약조건 삭제하기 *** -------------
    alter table tbl_jikwon
    drop constraint CK_TBL_JIKWON_JIK;
    ----------- *** 제약조건 추가하기 *** -------------
    alter table tbl_jikwon
    add constraint CK_TBL_JIKWON_JIK
    check ( jik in('사장', '전무', '상무', '부장', '과장', '대리', '사원'));
    
    
    ----------- *** NOT NULL제약조건 삭제하기1 *** -------------
    alter table tbl_jikwon 
    drop constraint SYS_C007019;
    ----------- *** NOT NULL제약조건 추가하기 *** -------------
    alter table tbl_jikwon
    add constraint NN_TBL_JIKWON_EMAIL email not null;
    --오류 보고 -
    --ORA-02263: need to specify the datatype for this column
    --02263. 00000 -  "need to specify the datatype for this column"
    alter table tbl_jikwon
    modify email not null;
    
    
     ----------- *** NOT NULL제약조건 삭제하기2 *** -------------
    alter table tbl_jikwon
    modify email not null;
     ----------- *** NOT NULL제약조건 추가하기 *** -------------
    alter table tbl_jikwon
    modify email constraint NN_TBL_JIKWON_EMAIL not null;   --> SYS 블라블라 보기싫어서 이름 바꿈
    
     ----------- *** Primary key 제약조건 삭제하기 *** -------------
    alter table tbl_member
    drop constraint PK_TBL_MEMBER_USERID;    --자식 테이블의 foreign key가 참조중이라 못 지움
    --오류 보고 -
    --ORA-02273: this unique/primary key is referenced by some foreign keys
    --02273. 00000 -  "this unique/primary key is referenced by some foreign keys"
    alter table tbl_board
    drop constraint PK_TBL_BOARD_USERID; -- 자식 테이블의  foreign key(R) 삭제
    
    alter table tbl_member
    drop constraint PK_TBL_MEMBER_USERID; -- 이제 부모테이블의 primary key삭제 됨
    
    -- 부모거 안지우고 한번에 삭제 하는 방법 ▼
    ----------- *** Primary key 제약조건 추가하기 *** -------------
    alter table tbl_member
    add constraint PK_TBL_MEMBER_USERID primary key (userid);
    ----------- *** Foreign key 제약조건 추가하기 *** -------------
    alter table tbl_board
    add constraint  PK_TBL_BOARD_USERID foreign key (fk_userid) references tbl_member (userid);
    
    ----------- *** Primary key 제약조건 삭제하기 *** -------------
    alter table tbl_member
    drop constraint PK_TBL_MEMBER_USERID cascade; 
    -- cascade를 적어주면 tbl_member 테이블의 "PK_TBL_MEMBER_USERID" Primary key를 참조하고 있는 모든 자식테이블의 Foreign key를 먼저 삭제함
    -- 그다음 tbl_member 테이블의 "PK_TBL_MEMBER_USERID" Primary key를 삭제함
    
    
    
    
    
    ----------- *** 제약조건 이름 변경하기 *** -------------    
    alter table tbl_member
    rename constraint SYS_C007112 to nn_tbl_member_pwd;
    
    alter table tbl_member
    rename constraint PK_TBL_MEMBER_USERID to PK_TBL_MEMBER;
    
    --** 제약조건 이름은 중복을 허락하지 않고 반드시 고유해야한다 **   



    
    ----------- *** 제약조건 비활성화하기 *** -------------     
    alter table tbl_jikwon
    disable constraint CK_TBL_JIKWON_JIK;
    --제약조건 CK_TBL_JIKWON_JIK가 drop이 아니라서 그대로 남아있지만 status 가 disabled로 됨. 대위, 소위, 중위 이런거 다 들어올 수 있음
    
    ----------- *** 제약조건 활성화하기 *** -------------       
    alter table tbl_jikwon
    enable constraint CK_TBL_JIKWON_JIK;
    
    
    
    
    ----------- *** 테이블 속에 컬럼 추가하기 *** -------------       
    select *
    from tbl_board;
    
    -- tbl_board 테이블에 passwd 컬럼을 추가하겠다
    alter table tbl_board
    add passwd varchar2(20);
    
    -- tbl_board 테이블에 passwd 컬럼을 NOT NULL로 추가하겠다
    alter table tbl_board
    add passwd varchar2(20) not null;   --> 창과 방패같은 모순. 만들자마자 비번 생성돼야한다????
    --오류 보고 -
    --ORA-01758: table must be empty to add mandatory (NOT NULL) column
    --01758. 00000 -  "table must be empty to add mandatory (NOT NULL) column"
    alter table tbl_board
    add passwd varchar2(20) default ' ' not null;
    
    ----------- *** 테이블 속에 컬럼 삭제하기 *** -------------       
    -- tbl_board 테이블에 passwd 컬럼을 삭제하겠다    
    alter table tbl_board
    drop column passwd ;
    
    desc tbl_board;

    
    ----------- *** 어떤 테이블 행의 갯수가 아주 많은 대용량 테이블인 경우 컬럼 삭제하기 *** -------------       
    -- 일반적으로 업무시간에는 데이터베이스의 사용빈도가 높다. 
    -- 컬럼을 삭제한다라는 말은 실제 데이터가 저장된 파일에 접근하여 데이터를 삭제한다라는 말
    -- 그런데 위와 같은 조건의 경우라면 컬럼 삭제 시간이 오래 걸린다
    -- 그래서 업무시간에는 컬럼이 안보이도록 만들어버리고 삭제는 업무 이외 시간에 한다.
    alter table tbl_board 
    set unused (passwd);
    -- 또는
    alter table tbl_board 
    set unused column passwd;
    
    desc tbl_board;     --> 꼼수 사라져있음
    
    select *
    from user_unused_col_tabs;      --> unused 되어진 해당 테이블명 및 갯수 조회
    
    alter table tbl_board
    drop unused columns;    --> 실제 디스크 파일에서 컬럼 데이터 삭제 ( 이용자가 가장 적은 새벽시간에 함 )
    
    
    
    
    
    ----------- *** 컬럼명 변경하기 *** -------------        
    select *
    from tbl_jikwon;
    
    -- tbl_jikwon 테이블의 jik 이라는 컬럼명을 spot(직위)로 변경하겠다
    alter table tbl_jikwon
    rename column jik to spot;
    
    desc tbl_jikwon;
    -- SPOT            VARCHAR2(10) 
    
     ----------- *** 컬럼의 크기(사이즈) 변경하기 *** -------------        
    alter table tbl_jikwon
    modify spot varchar2(20);
    
    desc tbl_jikwon;
    --SPOT            VARCHAR2(20) 
    
    alter table tbl_jikwon
    modify spot varchar2(16);
    --SPOT            VARCHAR2(16) 
    
    alter table tbl_jikwon
    modify spot varchar2(2);
    --오류 보고 -
    --ORA-01441: cannot decrease column length because some value is too big
    --01441. 00000 -  "cannot decrease column length because some value is too big"
    -- 기존에 입력되어진 데이터 값(4byte)보다 작게는 안됨
    
    
    
    
     ----------- *** 테이블명 변경하기 *** -------------           
     -- tbl_jikwon 이라는 테이블명을 tbl_sawon 이라는 이름으로 변경하겠다
     rename tbl_jikwon to tbl_sawon;
     
     ----------- *** 테이블 삭제하기 *** -------------           
     select *
     from tbl_board;
     
     select *
     from tab;  --> 현재 오라클 서버에 접속한 table,과 view의 목록
     
     drop table tbl_board;
     
     select *
     from "BIN$O68iBhY9RZGq/Owef+NPuw==$0";     --> 휴지통에 있는 걸로 보는거
     
     drop table tbl_sawon;
     
     drop table tbl_member;
     
      ----------- *** 테이블 영구 삭제하기 *** -------------    
     drop table tbl_sawon purge;
     
     ----------- *** 휴지통에 저장된 정보 조회하기 *** -------------        
     select *
     from user_recyclebin;
     
     ----------- *** 휴지통에 저장된 특정 테이블 복원하기 *** -------------        
    flashback table TBL_SAWON to before drop; --> drop하기 전 상태로 가라

    select *
    from tbl_sawon;
     
     ----------- *** 휴지통에 저장된 특정 테이블 영구삭제하기 *** -------------      
     purge table "BIN$GNDFRsBbStaUoqJrGxTXlQ==$0";  --> orgianl_name 이 tbl_sawon인 object_name
     
     ----------- *** 휴지통에 저장된 모든 테이블 영구삭제하기 *** ------------- 
    purge recyclebin;
     
     
     ----------- *** Index (인덱스) *** ------------- 
     
     
     
     ----------- *** View (뷰) *** ------------- 
     
     
     
     
     ----------- *** Sequence (시퀀스) *** ------------- 
     -- Sequence란 ?
     -- 어떤 컬럼에 숫자값을 부여하고자 할때 숫자값이 입력될때마다 자동으로 증가 되도록 할때 사용된다. ex) 은행 대기번호표, 게시판 글 번호 
     
     select *
     from tbl_board;
     
    create table tbl_board                                                        -- 게시판 글쓰기 테이블
    (boardno            number                                                       -- 글 번호   (=컬럼레벨(컬럼수준) PRIMARY KEY)
    ,subject              varchar2(2000)        not null                    -- 글 제목               
    ,content            Nvarchar2(2000)     not null                    -- 글 내용                   
    ,fk_userid           varchar2(40)            not null                    -- 글쓴이 ID
    ,registerday       date default sysdate                                  -- 작성일자 기본값은 현재시각을 부여함
    ,readcount         number(10) default 0                                -- 조회수 기본값은 0으로 함
    ,constraint PK_tbl_board_boardno primary key(boardno)
    ,constraint PK_tbl_board_userid foreign key (fk_userid)                   
                                                                references tbl_member(userid)
    ); 

    select default_tablespace
    from user_users;  -- tablespace 저장 경로 : USERS
    
    create sequence seq_boardno
    start with 1    --> 첫번째 값 1로 주겠음. 첫 게시글 번호 1
    increment by 1   --> 증가치 2로 주겠음. 다음 게시글 번호 2
    maxvalue 5
    minvalue 1      --> minvalue는 start with 값 보다 작거나 같아야한다. 크면 오류 발생!
    cycle
    nocache; --> 메모리에 저장시켜두겠다 cache 안시키겠다 nocache
    
    drop sequence seq_boardno;
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '첫번째 글쓰기', '안녕하세요1', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '두번째 글쓰기', '안녕하세요2', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '세번째 글쓰기', '안녕하세요3', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '네번째 글쓰기', '안녕하세요4', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '다섯번째 글쓰기', '안녕하세요5', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '여섯번째 글쓰기', '안녕하세요6', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '일곱번째 글쓰기', '안녕하세요7', 'jwon');
    
    select *
    from tbl_board;
    
    rollback;
    
    select *
    from tbl_member;
    
    alter table tbl_board
    drop primary key;--> 어차피 Primary key는 1개 밖에 없으므로 이렇게 해도 됨

    
     ----------- *** 생성되어진 sequence 정보 조회하기 *** -------------     
    select *
    from user_sequences;
    
     ----------- 시퀀스 seq_boardno를 사용할대 다음번에 들어올 값은 얼마일까?
     select last_number
     from user_sequences
     where sequence_name = 'SEQ_BOARDNO';
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '여덟번째 글쓰기', '안녕하세요8', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '아홉번째 글쓰기', '안녕하세요9', 'jwon');    
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno.nextval, '열번째 글쓰기', '안녕하세요10', 'jwon');        
    
    commit;
    
    select *
    from tbl_board;
    
    
    
    
    create sequence seq_boardno2
    start with 1    --> 첫번째 값 1로 주겠음. 첫 게시글 번호 1
    increment by 1   --> 증가치 2로 주겠음. 다음 게시글 번호 2
    nomaxvalue 
    nominvalue  
    nocycle
    nocache; 
    
    drop sequence seq_boardno2;   
    
    select *
    from tbl_board;
    
    truncate table tbl_board; ---> tbl_board에 있는 모든 행들을 몽땅 다 지우겠다
    
    alter table tbl_board
    add constraint PK_tbl_board_boardno primary key(boardno);     --> 아까 cycle 돌리려고 지웠던 Primary key 다시 만듬
    
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '첫번째 글쓰기', '안녕하세요1', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '두번째 글쓰기', '안녕하세요2', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '세번째 글쓰기', '안녕하세요3', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '네번째 글쓰기', '안녕하세요4', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '다섯번째 글쓰기', '안녕하세요5', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '여섯번째 글쓰기', '안녕하세요6', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '일곱번째 글쓰기', '안녕하세요7', 'jwon');
   
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '여덟번째 글쓰기', '안녕하세요8', 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '아홉번째 글쓰기', '안녕하세요9', 'jwon');    
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values(seq_boardno2.nextval, '열번째 글쓰기', '안녕하세요10', 'jwon');        
       
    
    commit;
    
    
    
    
    
     ----------- *** 오라클 사용자 생성 및 관리 *** ------------- 
     -- 오라클 사용자 생성 및 관리는 system 계정이나 또는 sys 계정에서 작업을 한다.
     -- sys에서 작업한것 .sql로 간다
     
     
     
     
     ----------- *** ROLE (역할) *** ------------- 
    --sys로부터 부여받은 시스템권한(System Privilege)이 무엇인지 조회
    select *
    from user_sys_privs;
     /*
    CREATE VIEW
    UNLIMITED TABLESPACE
    CREATE DATABASE LINK
    CREATE SEQUENCE
    CREATE SESSION
    ALTER SESSION
    CREATE SYNONYM 
    --> CREATE TABLE없는데 여태 어떻게 만들어왔을까??? ROLE 때문에 ~~
     */
      
    --sys로부터 부여받은 ROLE이 무엇인지 조회- 
     select *
     from user_role_privs;
     /*
     CONNECT
     RESOURCE
     */
     
     
    --부여받은 CONNECT에게 부여되어진 시스템 권한(System Privilege)이 무엇인지 조회
    select *
    from role_sys_privs
    where role = 'CONNECT';
    /*
    CREATE SESSION
    */
     
    --부여받은 RESOURCE에게 부여되어진 시스템 권한(System Privilege)이 무엇인지 조회
    select *
    from role_sys_privs
    where role = 'RESOURCE';
    /*
    CREATE SEQUENCE
    CREATE TRIGGER
    CREATE CLUSTER
    CREATE PROCEDURE
    CREATE TYPE
    CREATE OPERATOR
    CREATE TABLE
    CREATE INDEXTYPE
    -->   CREATE TABLE 요기있지롱 
    */
    
    
    
     
     ----------- *** Synonym (동의어) *** ------------- 
     
     --> sampleuser1에서 작업한것 .sql로 간다
     grant select on employees to sampleuser1;      --> hr이 employees 테이블에 대해서 select만 할 수 있도록 sampleuser1에게 권한을 주는 것.
     
     
     
     
     
     
     
     
     
        select *
        from dictionary;
        -- 또는
        select *
        from dict;  
     
        select *
        from dictionary
        where lower(comments) like '%privilege%';
        
        select *
        from USER_SYS_PRIVS;
     
     
     
     
     
     
     
     
     
     
     
     
     --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     
     -- SQL (Structure Query Language)  : 정형화된 질의어
     
     -----  *** NULL 처리하기 *** ----- √

    select '안녕?'
    from dual;
    
    -- * NVL1 -- 
    select null, nvl('안녕?', '오늘 점심은 연어덮밥') -- ☆★ nvl1은 1이 널이 아니면 1 출력
                       , nvl(null, '맛있다')   -- 1이 널이면 2 출력
    from dual;     
    
    -- * NVL2 -- 
    select null, nvl2('안녕?', '오늘 점심은 연어덮밥', '도보 10분') -- ☆★  nvl2는 1이 널이 아니면 2 출력
                       , nvl2(null, '맛있다', '또먹자')   -- 1이 널이면 3 출력
    from dual;     
    
    /*
        NULL은 존재하지않는 것이므로
        비교연산 ( = 같다, != <> ^= 같지않다, 크다>작다, >=, <= )을 할 수 없다.
        또한 NULL에 사칙연산(+,-,*,/)을 해주면 그 결과는 무조건 NULL이 된다.
      
    */
    select 5+2, 5-2, 5/2 
    from dual;
    --7, 3, 2.5
    select 5+NULL, 5-NULL, 5*NULL, 5/NULL
    from dual;
    --null null null null
    
    select *
    from employees;
     
    desc employees;
    /*
        EMPLOYEE_ID           => 사원번호
        FIRST_NAME              => 이름
        LAST_NAME               => 성     
        EMAIL                           => 이메일
        PHONE_NUMBER      => 연락처       
        HIRE_DATE                 => 입사일자
        JOB_ID                         => 직종아이디
        SALARY                       => 기본급여
        COMMISSION_PCT   => 수당 퍼센테이지
        MANAGER_ID            => 사수 사원번호  
        DEPARTMENT_ID     => 부서번호
    
    */
    
    -------------------------------------------------------------------------------------------------------------------------
    사원번호            사원명         기본급여            수당퍼센테이지         월급(기본급여+수당)
    -------------------------------------------------------------------------------------------------------------------------     
     select employee_id as 사원번호
                , first_name || ' ' || last_name 사원명
                , salary "기본 급여" --> alias에 공백주고싶으면 "쌍따옴표"를 꼭 써야한다.
                , commission_pct as 수당퍼센테이지     
                , nvl ( salary + (salary*commission_pct) , salary ) as 월급1       --> null이 아니라면 1출력 null 이라면 2출력
                , nvl2 (commission_pct,  salary+(salary*commission_pct), salary) as 월급2
     from employees;
     
     select *
     from employees;
     
     --employees 테이블에서 부서번호 30번에 근무하는 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where department_id = 30;
     
    --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내세요
    --null은 존재하지 않기 때문에 = 을 사용할 수 없고 대신에 is를 사용한다.
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where department_id is null;        
     
    --employees 테이블에서 수당퍼센테이지가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내세요     
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
              , commission_pct as 수당퍼센테이지
    from employees
    where commission_pct is null;        
   
    --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내되 부서번호의 오름차순으로 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where commission_pct is null
    order by department_id asc; --> asc 생략 가능

     --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내되 부서번호의 오름차순으로 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where commission_pct is null
    order by 부서번호;       
    
    --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내되 부서번호의 내림차순으로 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where commission_pct is null
    order by department_id desc;
 
 
      --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내되 사원명의 오름차순으로 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where commission_pct is null
    order by 사원명;          
    
    --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내되 사원명의 오름차순으로 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where commission_pct is null
    order by 2 asc;  --> select에 있는 2번째 컬럼(사원명)
    
     --employees 테이블에서 부서번호가 null인 사원들의 사원번호, 사원명, 월급, 부서번호를 나타내되 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서 월급의 내림차순으로 나타내세요
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , salary as 월급
              , department_id as 부서번호
    from employees
    where commission_pct is null
    order by 4 asc, 3 desc; --> asc 생략 가능 4,3 desc은 둘 다 desc을 뜻하는게 아님

     --employees 테이블에서 월급(기본급여+수당금액)이 10000보다 큰 사원들만 사원번호, 사원명, 월급, 부서번호를 나타내되 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서 월급의 내림차순으로 나타내세요    
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , nvl ( salary + (salary*commission_pct) , salary ) as 월급
              , department_id as 부서번호
    from employees
    where nvl ( salary + (salary*commission_pct) , salary )>10000
    order by 4 asc, 3 desc; 
    
     --employees 테이블에서 부서번호가 50번 부서가 아닌 사원들만 사원번호, 사원명, 월급, 부서번호를 나타내되 부서번호의 오름차순으로 정렬한 후 동일한 부서번호내에서 월급의 내림차순으로 나타내세요 
     select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , nvl ( salary + (salary*commission_pct) , salary ) as 월급
              , department_id as 부서번호
    from employees
    where department_id != 50        -- 또는 department_id ^= 50 또는 department_id <> 50
    order by 4 asc, 3 desc;    
    
        
    select employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , nvl ( salary + (salary*commission_pct) , salary ) as 월급
              , department_id as 부서번호
    from employees
    where nvl(department_id, -9999) != 50        --부서번호가 null인 Kimberely Grant도 출력
    order by 4 asc, 3 desc;
    -- 정렬할 때 null은 존재하지않는 값이므로 가장 큰 값으로 간주한다.
    -- MS사 MS-SQL Server는 정렬할 때 null은 존재하지 않는 값이므로 가장 작은것으로 간주한다.
     
     
     
     
     
    ----- *** OR, AND, NOT, IN 연산자에 대해 알아보자 *** ----- 
    -- 연산자의 우선순위 
    -- ==>  괄호 (  )   >    NOT    >   AND    >   OR
    
    
    -- employees테이블에서 80번 부서에 근무하는 사원들 중 월급이 10000 이상인 사원들에 대해서 부서번호, 사원번호, 사원명, 월급을 나타내되 월급의 내림차순으로 출력하세요.
    select department_id as 부서번호 
              , employee_id as 사원번호 
              , first_name || ' ' || last_name as 사원명
              , nvl ( salary + (salary*commission_pct) , salary ) as 월급
    from employees
    where department_id = 80 
                 and 
                 nvl(salary + (salary*commission_pct), salary) >= 10000        --navl(salary + (salar*commission_pct), salary)
    order by 4 desc;
    
    
   -- employees테이블에서 50번, 80번 부서에 근무하는 사원들에 대해서 부서번호, 사원번호, 사원명, 월급을 나타내되 월급의 내림차순으로 출력하세요.   
   select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급
   from employees
   where department_id = 50
                or
                department_id = 80
    order by 1,4 desc;
     
     
    -- employees테이블에서 50번, 80번 부서에 근무하는 사원들 중 월급이 8000이상인 사원에 대해서 부서번호, 사원번호, 사원명, 월급을 나타내되 월급의 내림차순으로 출력하세요.    
   select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
    from employees
    where department_id = 50
                 or
                 department_id = 80
                 and
                 nvl(salary + (salary*commission_pct), salary) >= 8000          ---> or 와 and가 있을 때 and가 우선임. 그래서 부서번호 80번의 8천 이상인 사람들을 먼저 뽑고 그 다음에 50번인 사람들을 월급에 상관없이 전부 뽑아냄
    order by 1,4 desc;                 
    -- ※ AND와 OR가 혼용되어지면 우선순위가 높은 AND부터 먼저한다  !! 
    
    -- 연산자의 우선순위는 괄호 ( ) 가 제일 높다.
    
   select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
    from employees
    where (department_id = 50
                 or
                 department_id = 80)
                 and
                 nvl(salary + (salary*commission_pct), salary) >= 8000     
    order by 1,4 desc;     









--3.27
select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
from employees
where department_id in (50, 80)
             and
             nvl(salary + (salary*commission_pct), salary) >= 8000     
order by 1,4 desc;     

desc employees;
    
 -- employees테이블에서 50번, 80번 부서에 근무하지않는 사원들 중 월급이 4000이상인 사원에 대해서
 -- 부서번호, 사원번호, 사원명, 월급을 나타내되 월급의 내림차순으로 출력하세요. + null인 사원도 출력      
select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
 from employees
 where nvl(department_id, -1) != 50      --> department_id칼럼은 null값을 허용하기 때문에 null 조회가능
              and
              nvl(department_id, -1)  !=80
              and
              nvl(salary + (salary*commission_pct), salary) >= 4000
order by 1, 4 desc;

--또는

select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
 from employees
 where not ( nvl(department_id, -1) = 50      --> department_id칼럼은 null값을 허용하기 때문에 null 조회가능
              or
              nvl(department_id, -1) =80 )
              and
              nvl(salary + (salary*commission_pct), salary) >= 4000
order by 1, 4 desc;

--또는

select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
 from employees
 where not nvl(department_id, -1) in (50, 80)
              and
              nvl(salary + (salary*commission_pct), salary) >= 4000
order by 1, 4 desc;

--또는

select department_id as 부서번호 
          , employee_id as 사원번호 
          , first_name || ' ' || last_name as 사원명
          , nvl ( salary + (salary*commission_pct) , salary ) as 월급    
 from employees
 where nvl(department_id, -1) not in (50, 80)
              and
              nvl(salary + (salary*commission_pct), salary) >= 4000
order by 1, 4 desc;



----- *** === 범위 연산자 === *** -----
--      >       <       >=      <=
--      between A and B             -->  A와 B는 숫자타입 이외에도 문자타입, 날짜타입 모든 것을 사용할 수 있다.

-- employees 테이블에서 기본급여가 3000부터 6000까지인 사원들만  사원번호, 사원명, 기본급여를 나타내세요
select employee_id as 사원번호
            ,first_name || ' ' || last_name as 사원명
            ,salary as 기본급여
from employees
where  3000  >= salary and salary <= 6000
order by salary;

--또는

select employee_id as 사원번호
            ,first_name || ' ' || last_name as 사원명
            ,salary as 기본급여
from employees
where salary between 3000  and 6000
order by salary;


select employee_id as 사원번호
            ,first_name as 사원명
            ,salary as 기본급여
from employees
where 'E' <= first_name and first_name <= 'Tz'
order by first_name;




----- *** === char와 varchar2는 비슷하지만 다르다. 현업에서는 varchar2를 많이 쓰기 때문에 웬만하면 char 대신 varchar2를 쓰는것이 유지보수에 편하다. === *** -----

create table tbl_temp (
name1        char(20)           --> 고정크기. 무조건 10byte를 씀
,name2       varchar2(20)   --> 가변크기. 실제 데이터 크기만큼 잡힌다. 최대 10byte
);

drop table tbl_temp purge;

delete from tbl_temp;

insert into tbl_temp(name1, name2) values ('홍길동', '홍길동');   --> char는 20바이트 나머지를 공백으로 채우기 때문에 조회했을 때 이름 뒤에 공백이 나옴. 
insert into tbl_temp(name1, name2) values ('김개똥 ', '김개똥 ');
insert into tbl_temp(name1, name2) values ('아무개  ', '아무개  ');

commit;

select *
from tbl_temp;

select *
from tbl_temp
where name2 = '홍길동';    
-- 홍길동

select *
from tbl_temp
where name2 = '홍길동 '; -- 공백 한개 있는 홍길동
-- 안나옴

select *
from tbl_temp
where name1 = '홍길동 ';  -- 공백 한개 있는 홍길동
-- 홍길동

select *
from tbl_temp
where name1 = '홍길동                                 ';  -- 공백 많이 있는 홍길동
-- 홍길동
--> 이로써 char는 정확한 데이터를 출력하지 못하고 낭비가 심하다는것을 알 수 있다

select *
from tbl_temp
where name2 = '김개똥';
-- 안나옴

select *
from tbl_temp
where name2 = '김개똥 ';  -- 공백 한개 있는 김개똥
-- 김개똥

-- 그럼 char는 언제 쓸까? 
-- 고정형 크기를 가지는 데이터에 주로 사용된다!  ex) 주민번호 13자리, 핸드폰번호 11자리 그래도 웬만하면 char대신 varchar2 사용을 권장한다.
-- 왜? 검색할때도 정확하게 값을 넣었을 때 보여줘야하니까!
where jubun = '9708251222014                        '       --> char(13)하면 검색됨
where jubun = '9708251222014                        '       --> varchar2(13)하면 검색안됨





----- *** employees 테이블에 주민번호 (jubun) 컬럼 추가하기 *** -----
alter table employees 
add jubun varchar2(13) default ' ' not null;


----- *** employees 테이블에 주민번호 (jubun) 컬럼에 unique 제약 추가하기 *** -----
alter table employees
add constraint UQ_employees_jubun unique (jubun);
--오류 보고 -
--ORA-01735: invalid ALTER TABLE option
--01735. 00000 -  "invalid ALTER TABLE option"
--> 이미 default로 값이 공백이 들어와 있기 때문에 unique할 수 없음 ( unique는 고유해야하는데 다 같은 공백을 가지고 있으니까 )

alter table employees 
modify jubun null; --> jubun을 다시 null로 바꿔줌

update employees set jubun = null; --> 공백들어있던 곳을 null로 변경함

select *
from employees;



update employees set jubun = '6010151234567'
where employee_id = 100;

update employees set jubun = '8510151234567'
where employee_id = 101;

update employees set jubun = '6510152234567'
where employee_id = 102;

update employees set jubun = '7510151234567'
where employee_id = 103;

update employees set jubun = '6110152234567'
where employee_id = 104;

update employees set jubun = '6510151234567'
where employee_id = 105;

update employees set jubun = '6009201234567'
where employee_id = 106;

update employees set jubun = '0803153234567'
where employee_id = 107;

update employees set jubun = '0712154234567'
where employee_id = 108;

update employees set jubun = '8810151234567'
where employee_id = 109;

update employees set jubun = '8908152234567'
where employee_id = 110;

update employees set jubun = '9005052234567'
where employee_id = 111;

update employees set jubun = '6610151234567'
where employee_id = 112;

update employees set jubun = '6710151234567'
where employee_id = 113;

update employees set jubun = '6709152234567'
where employee_id = 114;

update employees set jubun = '6110151234567'
where employee_id = 115;

update employees set jubun = '6009301234567'
where employee_id = 116;

update employees set jubun = '6110152234568'
where employee_id = 117;

update employees set jubun = '7810151234567'
where employee_id = 118;

update employees set jubun = '7909151234567'
where employee_id = 119;

update employees set jubun = '7702152234567'
where employee_id = 120;

update employees set jubun = '7009151234567'
where employee_id = 121;

update employees set jubun = '7111011234567'
where employee_id = 122;

update employees set jubun = '8010131234567'
where employee_id = 123;

update employees set jubun = '8110191234567'
where employee_id = 124;

update employees set jubun = '9012132234567'
where employee_id = 125;

update employees set jubun = '9406251234567'
where employee_id = 126;

update employees set jubun = '9408252234567'
where employee_id = 127;

update employees set jubun = '9204152234567'
where employee_id = 128;

update employees set jubun = '8507251234567'
where employee_id = 129;

update employees set jubun = '6511111234567'
where employee_id = 130;

update employees set jubun = '0010153234567'
where employee_id = 131;

update employees set jubun = '0005254234567'
where employee_id = 132;

update employees set jubun = '0110194234567'
where employee_id = 133;

update employees set jubun = '0412154234567'
where employee_id = 134;

update employees set jubun = '0503253234567'
where employee_id = 135;

update employees set jubun = '9510012234567'
where employee_id = 136;

update employees set jubun = '9510021234567'
where employee_id = 137;

update employees set jubun = '9610041234567'
where employee_id = 138;

update employees set jubun = '9610052234567'
where employee_id = 139;

update employees set jubun = '7310011234567'
where employee_id = 140;

update employees set jubun = '7310092234567'
where employee_id = 141;

update employees set jubun = '7510121234567'
where employee_id = 142;

update employees set jubun = '7612012234567'
where employee_id = 143;

update employees set jubun = '7710061234567'
where employee_id = 144;

update employees set jubun = '7810052234567'
where employee_id = 145;

update employees set jubun = '6810251234567'
where employee_id = 146;

update employees set jubun = '6811062234567'
where employee_id = 147;

update employees set jubun = '6712052234567'
where employee_id = 148;

update employees set jubun = '6011251234567'
where employee_id = 149;

update employees set jubun = '6210062234567'
where employee_id = 150;

update employees set jubun = '6110191234567'
where employee_id = 151;

update employees set jubun = '5712062234567'
where employee_id = 152;

update employees set jubun = '5810231234567'
where employee_id = 153;

update employees set jubun = '6311051234567'
where employee_id = 154;

update employees set jubun = '6010182234567'
where employee_id = 155;

update employees set jubun = '6110191234569'
where employee_id = 156;

update employees set jubun = '6210112234567'
where employee_id = 157;

update employees set jubun = '6311132234567'
where employee_id = 158;

update employees set jubun = '8511112234567'
where employee_id = 159;

update employees set jubun = '8710131234567'
where employee_id = 160;

update employees set jubun = '8710072234567'
where employee_id = 161;

update employees set jubun = '9010171234567'
where employee_id = 162;

update employees set jubun = '9112072234567'
where employee_id = 163;

update employees set jubun = '9110241234567'
where employee_id = 164;

update employees set jubun = '9212251234567'
where employee_id = 165;

update employees set jubun = '9310232234567'
where employee_id = 166;

update employees set jubun = '9811151234567'
where employee_id = 167;

update employees set jubun = '9810252234567'
where employee_id = 168;

update employees set jubun = '9910301234567'
where employee_id = 169;

update employees set jubun = '0910153234567'
where employee_id = 170;

update employees set jubun = '1011153234567'
where employee_id = 171;

update employees set jubun = '1006153234567'
where employee_id = 172;

update employees set jubun = '1111154234567'
where employee_id = 173;

update employees set jubun = '1209103234567'
where employee_id = 174;

update employees set jubun = '1207154234567'
where employee_id = 175;

update employees set jubun = '0906153234567'
where employee_id = 176;

update employees set jubun = '0812113234567'
where employee_id = 177;

update employees set jubun = '9810132234567'
where employee_id = 178;

update employees set jubun = '8712111234567'
where employee_id = 179;

update employees set jubun = '8310012234567'
where employee_id = 180;

update employees set jubun = '6510191234567'
where employee_id = 181;

update employees set jubun = '6510221234567'
where employee_id = 182;

update employees set jubun = '6510232234567'
where employee_id = 183;

update employees set jubun = '8512131234567'
where employee_id = 184;

update employees set jubun = '8510182234567'
where employee_id = 185;

update employees set jubun = '7510192234567'
where employee_id = 186;

update employees set jubun = '8512192234567'
where employee_id = 187;

update employees set jubun = '9511151234567'
where employee_id = 188;

update employees set jubun = '7509302234567'
where employee_id = 189;

update employees set jubun = '8510161234567'
where employee_id = 190;

update employees set jubun = '9510192234567'
where employee_id = 191;

update employees set jubun = '0510133234567'
where employee_id = 192;

update employees set jubun = '0810194234567'
where employee_id = 193;

update employees set jubun = '0910183234567'
where employee_id = 194;

update employees set jubun = '1010134234567'
where employee_id = 195;

update employees set jubun = '9510032234567'
where employee_id = 196;

update employees set jubun = '9710181234567'
where employee_id = 197;

update employees set jubun = '9810162234567'
where employee_id = 198;

update employees set jubun = '7511171234567'
where employee_id = 199;

update employees set jubun = '7810172234567'
where employee_id = 200;

update employees set jubun = '7912172234567'
where employee_id = 201;

update employees set jubun = '8611192234567'
where employee_id = 202;

update employees set jubun = '7810252234567'
where employee_id = 203;

update employees set jubun = '7803251234567'
where employee_id = 204;

update employees set jubun = '7910232234567'
where employee_id = 205;

update employees set jubun = '8010172234567'
where employee_id = 206;

commit;


----- *** employees 테이블의 주민번호(jubun) 컬럼에 not null 제약 추가하기 *** -----
alter table employees
modify jubun constraint NN_EMPLOYEES_JUBUN not null;

desc employees;

select *
from employees;










----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                        ####              단일행 함수              ####
/*

                ※ 단일행 함수의 종류
                
                1. 문자함수
                2. 숫자함수
                3. 날짜함수
                4. 변환함수
                5. 기타함수

*/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    -- >       >>     1. 문자함수       <<
    -- 1.1 substr : 문자열 중 특정문자 또는 문자열의 특정 일부분을 선택해올때 사용한다.
    
    select 'KH정보교육원'
                ,substr('KH정보교육원', 3, 2)       --> 3번째 글자부터('정') 2글자를 뽑아라 
                ,substr('KH정보교육원', 3)           --> 3번째 글자부터('정') 끝까지 뽑아라 
    from dual;
    
    -- 주민번호             성별              
    select jubun as 주민번호
                ,substr(jubun, 7,1) as 성별
    from employees ;
    
    select *
    from employees;
    
    -- employees 테이블에서 '여자'만 사원번호, 사원명, 주민번호를 나타내세요
    select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호
    from employees
    where substr(jubun, 7, 1) = '2'
                 or
                 substr(jubun, 7, 1) = '4';
                 
    -- 또는               
    
    select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호
    from employees
    where substr(jubun, 7, 1) in ('2', '4');          
    
    -- employees 테이블에서 1990년대에 태어난 사원들만 사원번호, 사원명, 주민번호를 나타내세요
    select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호
    from employees
    where '90'  <=  substr(jubun, 1,2) and substr(jubun, 1,2) <= '99';
    
  -- 또는  
    select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호
    from employees
    where substr(jubun, 1,1) = '9';    
    
    -- 또는
    select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호
    from employees
    where substr(jubun, 1,2) between '90' and '99';            
    
    -- employees 테이블에서 1990년 ~ 1995년 사이에 태어난 여자들의 사원번호, 사원명, 주민번호를 나타내세요
     select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호
    from employees
    where  substr(jubun, 7, 1) in ('2')
                  and
                  substr(jubun, 1,2) between '90' and '95';     
                  
                  

    ---- *** === like 연산자 === *** -----
    select *
    from employees
    where department_id = 30;
    
    select *
    from employees
    where department_id like 30;
    
    /*
        like 연산자와 함께 사용되어지는 %와 _를 wild character라고 부른다.
        %의 뜻은 글자가 있든지 없든지 관계없다라는 말이고, 
        _의 뜻은 반드시 아무글자 1개만을 뜻하는 것이다. 
        
    */
    
    select employee_id as 사원번호,
                first_name || ' ' || last_name as 사원명,
                jubun as 주민번호    
    from employees 
    where jubun like '90____2%'  --> 앞에는 무조건 90으로 시작해서 7번째가 2인것
                or         --> like에는 in 쓸 수 없고 or를 쓸 수 있다.
                jubun like '91____2%'
                or
                jubun like '92____2%'
                or
                jubun like '93____2%'
                or
                jubun like '94____2%'
                or
                jubun like '95____2%';


  -- employees 테이블에서 이름의 첫글자가 J로 시작하는 사원들만 사원번호, 이름, 성, 기본급여를 나타내세요.
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like 'J%';
    
  -- employees 테이블에서 이름의 첫글자가 s로 끝나는 사원들만 사원번호, 이름, 성, 기본급여를 나타내세요.    
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like '%s';
    
  -- employees 테이블에서 이름에 ee가 들어가는 사원의 사원번호, 이름, 성, 기본급여를 나타내세요.        
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like '%ee%';
    
  -- employees 테이블에서 이름에 e가 최소 2개 이상 들어가는 사원의 사원번호, 이름, 성, 기본급여를 나타내세요.        
    select employee_id, first_name, last_name, salary
    from employees
    where first_name like '%e%e%';    
    
  -- employees 테이블에서 성에 F로 시작하면서 e가 들어가는 사원의 사원번호, 이름, 성, 기본급여를 나타내세요.        
    select employee_id, first_name, last_name, salary
    from employees
    where last_name like 'F_e%';    
        
    
    
  -- *** like 연산자와 함께 사용되어지는 % 와 _ 는 어떤 뜻을 가지고 있는 wild character 인데 이러한 wild character 를 없애보자 *** --
  create table tbl_watch
  (watchname   Nvarchar2(10)
  ,bigo        Nvarchar2(100)
  );
  
  insert into tbl_watch(watchname, bigo)
  values('금시계', '순금 99.99% 함유 고급시계');
  
  insert into tbl_watch(watchname, bigo)
  values('은시계', '고객만족도 99.99점 획득한 고급시계');
  
  commit;
  
  select *
  from tbl_watch;
  
  -- tbl_watch 테이블에서 bigo 컬럼에 99.99% 라는 글자가 들어있는 행만 추출하세요 --
  
  select *
  from tbl_watch
  where bigo like '%99.99\%%' escape '\';   --> escape 해놓은 문자 '\' 다음에 나오는 글자 1개만 wild character 기능에서 탈출시킨다(빠진다.)
                                                                    -- ▲ 꼭 \ 아니더라도 다른거 해도 됨 (웬만하면 숫자, 문자보다는 특수기호 추천)
  
  
  
  
   --- **** 1.2  instr : 어떤 문자열에서 명명된 문자의 위치를 알려주는 것 **** --
   
  select instr('KH정보교육원 국가정보원 정보문화사', '정보', 1, 1)
      -- 'KH정보교육원 국가정보원 정보문화사' 에서 '정보'가 나온 위치를 찾는데
      -- 출발점은 1 번째부터 1번째로 나오는 '정보'의 위치를 알려달라는 말이다. 
      
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', 1, 2)
      -- 'KH정보교육원 국가정보원 정보문화사' 에서 '정보'가 나온 위치를 찾는데
      -- 출발점은 1 번째부터 2번째로 나오는 '정보'의 위치를 알려달라는 말이다.
      
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', 4, 1)
      -- 'KH정보교육원 국가정보원 정보문화사' 에서 '정보'가 나온 위치를 찾는데
      -- 출발점은 4 번째부터 1번째로 나오는 '정보'의 위치를 알려달라는 말이다.
      
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', 4, 3)
      -- 'KH정보교육원 국가정보원 정보문화사' 에서 '정보'가 나온 위치를 찾는데
      -- 출발점은 4 번째부터 3번째로 나오는 '정보'의 위치를 알려달라는 말인데 없기 때문에 0이 나옴
      
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', 1)
      -- 출발점은 생략할 수 없는데 정보의 위치는 생략이 가능한데 생략시 자동으로 1번째 위치를 알려줌
      
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', 4)
      
      
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', -1, 1)
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', -1, 2)
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', -4, 1)
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', -4, 3)
      ,  instr('KH정보교육원 국가정보원 정보문화사', '정보', -1)

  from dual;
  
  
  --- **** 1.3  reverse : 어떤 문자열을 거꾸로 보여주는 것이다. **** --
  select 'ORACLE',  reverse('ORACLE')
        ,'대한민국', reverse('대한민국') --> 한글을 거꾸로 보여주면 깨짐
        , reverse(reverse('대한민국'))
  from dual;
  
  
  
  -- [퀴즈] --
  create table tbl_files
  (fileno      number(3)
  ,filepath    varchar2(200)
  );
  
  insert into tbl_files(fileno, filepath)
  values(1, 'c:\myDocuments\resume.hwp');
  
  insert into tbl_files(fileno, filepath)
  values(2, 'd:\mymusic.mp3');
  
  insert into tbl_files(fileno, filepath)
  values(3, 'c:\myphoto\2019\09\face.jpg');
  
  commit;
  
  select *
  from tbl_files;
  
  -- 아래와 같이 나오도록 하세요. --
 /* 
  ---------------------------
    파일번호    파일명
  --------------------------- 
       1	   resume.hwp
       2	   mymusic.mp3
       3	   face.jpg
  ----------------------------
 */
  
  select fileno as 파일번호,
  reverse (substr(reverse (filepath), 1, instr(reverse (filepath), '\', 1)-1)) as 파일명
  from tbl_files;
  
  select fileno,
  substr(reverse (filepath), 1)
  from tbl_files;
  
  select fileno,
              reverse (filepath),
              instr (reverse(filepath), '\', 1, 1)-1,
              substr(reverse(filepath), 1, instr(reverse(filepath), '\', 1,1)-1),
              reverse(substr(reverse (filepath), 1, instr(reverse(filepath), '\', 1,1)-1))
  from tbl_files;

  select fileno,
  (substr(reverse (filepath), 1, instr(reverse (filepath), '\', 1) -1))
  from tbl_files;
  
  
  -- reverse 안쓰고 출력하기
  
  select fileno,
              filepath,
              instr(filepath, '\', -1)+1,
              substr(filepath, instr(filepath, '\', -1)+1)
  from tbl_files;
  
  select fileno,
  substr((filepath),instr((filepath), '\', -1, 1)+1)
  from tbl_files;
  

--- *** 1.4  lpad : 왼쪽부터 문자를 자리채움
--- *** 1.5  rpad : 오른쪽부터 문자를 자리채움
 select lpad('정보교육원', 20, '*')
       --  20byte를 확보해서 거기에 '정보교육원'을 넣습니다. 
       --  넣은후 빈공간(10byte)이 있으면 왼쪽부터 * 로 채워라. 
       
      , rpad('정보교육원', 20, '*')
       --  20byte를 확보해서 거기에 '정보교육원'을 넣습니다. 
       --  넣은후 빈공간(10byte)이 있으면 오른쪽부터 * 로 채워라. 
 from dual;
 
 
 --- *** 1.6  ltrim : 왼쪽부터 문자를 제거한다.
 --- *** 1.7  rtrim : 오른쪽부터 문자를 제거한다.
 select ltrim('abbbcccddaaabTadssdebbwrwe', 'abcd')     --> 글자 abcd를 준게 아니라 a 또는 b 또는 c 또는 d가 있으면 제거하라는 뜻
      -- Tadssdebbwrwe
      
      , rtrim('abdwsdcddSaddaabbccdd', 'abcd')
      -- abdwsdcddS
 from dual;
 
 select 'KH' || '              정보         교육원'
      , 'KH' || ltrim('              정보         교육원')
      
      , 'KH              ' || '정보         교육원'
      , rtrim('KH              ') || '정보         교육원'
      
      , 'KH' || '        정보          ' || '교육원'
      , 'KH' || trim('        정보          ') || '교육원' --> 그냥 trim은 양쪽에 있는 공백을 제거함
 from dual;
 
 
 --- *** 1.8  translate *** ---
 select translate('010-3456-7890' --> 이 문자열에서 
                              ,'0123456789' --> 이런 문자가 있으면
                              ,'영일이삼사오육칠팔구') --> 숫자를 한글로 바꿔라(1:1 맵핑이 돼야함)
 from dual;
 
 
 --- *** 1.9  replace *** ---
 select replace('KH정보교육원 교육진흥원 서울교육대학교' --> 이 문자열에서
                           ,'교육' --> 이 글자를
                           ,'education') --> 얘로 바꿔라
 from dual;  


  /*
     1.10  upper    -- 전부 대문자로 변환
     1.12  lower    -- 전부 소문자로 변환
     1.13  initcap  -- 단어별로 첫글자만 대문자 나머지는 소문자로 변환
  */
  --- *** 오라클은 데이터값 만큼은 대,소문자를 구분을 합니다. *** ---
  select employee_id, first_name, last_name
  from employees
  where upper(first_name) = upper('john');
  
  select employee_id, first_name, last_name
  from employees
  where lower(first_name) = lower('JOHN');
  
  select employee_id, first_name, last_name
  from employees
  where initcap(first_name) = initcap('John');
  
  select 'kOrEA seOUL'
       , upper('kOrEA seOUL')   -- 전부 대문자로 변환
       , lower('kOrEA seOUL')   -- 전부 소문자로 변환
       , initcap('kOrEA seOUL') -- 단어별로 첫글자만 대문자 나머지는 소문자로 변환
  from dual;
  
  select first_name, lower(first_name), upper(first_name)
  from employees;
  

  --3.31
  
    /*
        1.14    length      --> 문자열의 길이를 알려주는 것
    */
    
    select length('KH정보교육원')
    from dual;
    
    select *
    from tbl_board;
    
    select *
    from user_sequences;    -- 시퀀스 확인하기
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values (seq_boardno2.nextval, '아침이 밝았습니다 ^-^ 짹짹짹', '오늘도 화이팅' , 'jwon');
    
    insert into tbl_board (boardno, subject, content, fk_userid)
    values (seq_boardno2.nextval, '둥근해가 떴습니다 자리에서 일어나서 기지개를피고 아침햇살을 맞이합시다~', '오늘도 화이팅' , 'jwon');
  
    commit;  
  
    select boardno, subject,
                case     
                when  length(subject) > 17   then  substr(subject, 1, 17)   ||  '...'       
                else    subject
                end as 기사제목
    from tbl_board
    order by boardno desc;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   -- //////////////////////////////////////////////////////////////////////// 퀴즈
   
   select *
   from employees;
   
   desc employees;
   
   select employee_id as 사원번호,
               first_name || ' ' || last_name as 사원명,
               salary as 기본급여,
               salary*commission_pct as 수당,
               nvl ( salary + (salary*commission_pct) , salary ) as 월급    
    from employees
    where  commission_pct > 0
    order by 1 asc, 5 desc;


/*
문제 1. 
employees 테이블에서 커미션을 받는 사원들만 
사원번호, 사원명, 기본급여, 수당, 월급을 
사원번호로 오름차순 정렬후, 월급의 내림차순으로 정렬하여 나타내세요.

------------------------------------------------------
사원번호    사원명            	기본급여 수당     월급
------------------------------------------------------
145	    John Russell	14000	5600	19600
146	    Karen Partners	13500	4050	17550
147	    Alberto Errazuriz	12000	3600	15600
148	    Gerald Cambrault	11000	3300	14300
149	    Eleni Zlotkey	10500	2100	12600
150	    Peter Tucker	10000	3000	13000
151	    David Bernstein	9500	2375	11875
152	    Peter Hall	        9000	2250	11250
153	    Christopher Olsen	8000	1600	9600
154	    Nanette Cambrault	7500	1500	9000
155	    Oliver Tuvault	7000	1050	8050
156	    Janette King	10000	3500	13500
157	    Patrick Sully	9500	3325	12825
158	    Allan McEwen	9000	3150	12150
159	    Lindsey Smith	8000	2400	10400
160	    Louise Doran	7500	2250	9750
161	    Sarath Sewall	7000	1750	8750
162	    Clara Vishney	10500	2625	13125
163	    Danielle Greene	9500	1425	10925
164	    Mattea Marvins	7200	720	7920
165	    David Lee	        6800	680	7480
166	    Sundar Ande	        6400	640	7040
167	    Amit Banda	        6200	620	6820
168	    Lisa Ozer	        11500	2875	14375
169	    Harrison Bloom	10000	2000	12000
170	    Tayler Fox	        9600	1920	11520
171	    William Smith	7400	1110	8510
172	    Elizabeth Bates	7300	1095	8395
173	    Sundita Kumar	6100	610	6710
174	    Ellen Abel	        11000	3300	14300
175	    Alyssa Hutton	8800	2200	11000
176	    Jonathon Taylor	8600	1720	10320
177	    Jack Livingston	8400	1680	10080
178	    Kimberely Grant	7000	1050	8050
179	    Charles Johnson	6200	620	6820
*/


select department_id as 부서번호,
            first_name || ' ' || last_name as 사원명,
            jubun as 주민번호,
            salary as 기본급여
from employees
where substr(jubun, 7, 1) = '1'
             and
             commission_pct is null
             or
             substr(jubun, 7, 1) = '3'
             and
             commission_pct is null
order by 1 asc, 2 asc;



/*
문제 2. 
employees 테이블에서 커미션이 없는 사원들중 남자직원들만 
부서번호, 사원명, 주민번호, 기본급여를 
부서번호로 오름차순 정렬후, 사원명의 오름차순으로 정렬하여 나타내세요.

-------------------------------------------------------
부서번호    사원명             주민번호        기본급여
-------------------------------------------------------
30	    Alexander Khoo	6110151234567	3100
30	    Guy Himuro	        7810151234567	2600
30	    Karen Colmenares	7909151234567	2500
30	    Shelli Baida	6009301234567	2900
50	    Adam Fripp	        7009151234567	8200
50	    Curtis Davies	7510121234567	3100
50	    Douglas Grant	7511171234567	2600
50	    Irene Mikkilineni	9406251234567	2700
50	    James Marlow	0010153234567	2500
50	    Jean Fleaur	        6510191234567	3100
50	    Joshua Patel	7310011234567	2500
50	    Kelly Chung	        9511151234567	3800
50	    Kevin Feeney	9710181234567	3000
50	    Kevin Mourgos	8110191234567	5800
50	    Ki Gee	        0503253234567	2400
50	    Laura Bissot	8507251234567	3300
50	    Martha Sullivan	6510221234567	2500
50	    Mozhe Atkinson	6511111234567	2800
50	    Nandita Sarchand	8512131234567	4200
50	    Payam Kaufling	7111011234567	7900
50	    Peter Vargas	7710061234567	2500
50	    Renske Ladwig	9510021234567	3600
50	    Samuel McCain	0910183234567	3200
50	    Sarah Bell	        0510133234567	4000
50	    Shanta Vollman	8010131234567	6500
50	    Stephen Stiles	9610041234567	3200
50	    Timothy Gates	8510161234567	2900
60	    Alexander Hunold	7510151234567	9000
60	    David Austin	6510151234567	4800
60	    Diana Lorentz	0803153234567	4200
60	    Valli Pataballa	6009201234567	4800
70	    Hermann Baer	7803251234567	10000
90	    Neena Kochhar	8510151234567	17000
90	    Steven King	        6010151234567	24000
100	    Daniel Faviet	8810151234567	9000
100	    Jose Manuel Urman	6610151234567	7800
100	    Luis Popp	        6710151234567	6900
*/

select  department_id as 부서번호,
             first_name || ' ' || last_name as 사원명,
             nvl ( salary + (salary*commission_pct) , salary ) as 월급
from  employees
where nvl (department_id , -1) not in (30,50,60,80,100)
order by 1 asc, 3 desc;
  
/*
문제 3. 
employees 테이블에서 부서번호 30,50,60,80,100 번 부서에 근무하지 않는 사원들만 
부서번호, 사원명, 월급을 
부서번호로 오름차순 정렬후, 월급의 내림차순으로 정렬하여 나타내세요.

---------------------------------------
부서번호     사원명               월급
---------------------------------------
10	     Jennifer Whalen	  4400
20	     Michael Hartstein	  13000
20	     Pat Fay	          6000
40	     Susan Mavris	  6500
70	     Hermann Baer	  10000
90	     Steven King	  24000
90	     Neena Kochhar	  17000
90	     Lex De Haan	  17000
110	     Shelley Higgins	  12008
110	     William Gietz	  8300
(null)	     Kimberely Grant	  8050
*/
  
select department_id as 부서번호,
            first_name || ' ' || last_name as 사원명,
            nvl(salary + (salary*commission_pct) , salary ) as 월급
from employees
where department_id is not null
             and
             nvl( salary + (salary*commission_pct) , salary ) between 8000 and 8999
order by 1 asc, 3 desc;


/*
문제 4. 
employees 테이블에서 부서번호가 존재하는 사원들중 월급이 8000 이상 8999 이하인 사원들만 
부서번호, 사원명, 월급을 
부서번호로 오름차순 정렬후, 월급의 내림차순으로 정렬하여 나타내세요.

------------------------------------------
부서번호        사원명               월급
------------------------------------------
50	        Adam Fripp	    8200
50	        Matthew Weiss	    8000
80	        Sarath Sewall	    8750
80	        William Smith	    8510
80	        Elizabeth Bates	    8395
80	        Oliver Tuvault	    8050
100	        John Chen	    8200
110	        William Gietz	    8300
*/

select first_name || ' ' || last_name as 사원명,
            jubun as 주민번호
from employees
where substr(jubun, 4, 1) in ('3', '9') 
            and
            substr(jubun, 7, 1) in ('1', '3')
order by 1 asc;


select *
from employees;
/*
문제 5. 
employees 테이블에서 3월과 9월에 태어난 남자 사원들만 
사원명, 주민번호를 
사원명의 오름차순으로 정렬하여 나타내세요.

----------------------------------
사원명               주민번호
----------------------------------
Adam Fripp	    7009151234567
Diana Lorentz	    0803153234567
Ellen Abel	    1209103234567
Hermann Baer	    7803251234567
Karen Colmenares    7909151234567
Ki Gee	            0503253234567
Shelli Baida	    6009301234567
Valli Pataballa	    6009201234567
*/

select first_name || ' ' || last_name as 사원명,
            jubun as 주민번호,
            case substr(jubun, 7, 1)
            when '1' then '남'
            when '3' then '남'
            else '여'
            end as 성별
from employees
where nvl(department_id, -1) in (30,50);

  
/*
문제 6. 
employees 테이블에서 부서번호 30번, 50번에 근무하는 사원들만 
사원명, 주민번호, 성별을 나타내세요.
성별은 '남' 또는 '여'라고 나타낸다.

----------------------------------------------------
부서번호    사원명             주민번호        성별
----------------------------------------------------
30	    Den Raphaely        6709152234567	여
30	    Alexander Khoo      6110151234567	남
30	    Shelli Baida	6009301234567	남
30	    Sigal Tobias	6110152234568	여
30	    Guy Himuro	        7810151234567	남
30	    Karen Colmenares	7909151234567	남
50	    Matthew Weiss	7702152234567	여
50	    Adam Fripp	        7009151234567	남
50	    Payam Kaufling	7111011234567	남
50	    Shanta Vollman	8010131234567	남
50	    Kevin Mourgos	8110191234567	남
50	    Julia Nayer	        9012132234567	여
50	    Irene Mikkilineni	9406251234567	남
50	    James Landry	9408252234567	여
50	    Steven Markle	9204152234567	여
50	    Laura Bissot	8507251234567	남
50	    Mozhe Atkinson	6511111234567	남
50	    James Marlow	0010153234567	남
50	    TJ Olson	        0005254234567	여
50	    Jason Mallin	0110194234567	여
50	    Michael Rogers	0412154234567	여
50	    Ki Gee	        0503253234567	남
50	    Hazel Philtanker	9510012234567	여
50	    Renske Ladwig	9510021234567	남
50	    Stephen Stiles	9610041234567	남
50	    John Seo	        9610052234567	여
50	    Joshua Patel	7310011234567	남
50	    Trenna Rajs	        7310092234567	여
50	    Curtis Davies	7510121234567	남
50	    Randall Matos	7612012234567	여
50	    Peter Vargas	7710061234567	남
50	    Winston Taylor	8310012234567	여
50	    Jean Fleaur	        6510191234567	남
50	    Martha Sullivan	6510221234567	남
50	    Girard Geoni	6510232234567	여
50	    Nandita Sarchand	8512131234567	남
50	    Alexis Bull	        8510182234567	여
50	    Julia Dellinger	7510192234567	여
50	    Anthony Cabrio	8512192234567	여
50	    Kelly Chung	        9511151234567	남
50	    Jennifer Dilly	7509302234567	여
50	    Timothy Gates	8510161234567	남
50	    Randall Perkins	9510192234567	여
50	    Sarah Bell	        0510133234567	남
50	    Britney Everett	0810194234567	여
50	    Samuel McCain	0910183234567	남
50	    Vance Jones	        1010134234567	여
50	    Alana Walsh	        9510032234567	여
50	    Kevin Feeney	9710181234567	남
50	    Donald OConnell	9810162234567	여
50	    Douglas Grant	7511171234567	남

*/


select first_name || ' ' || last_name as 사원명,
            substr(jubun, 1,6) ||
            translate (substr(jubun, 7,13), '0123456789', '*******')  as 주민번호,
            case substr(jubun, 7, 1)
            when '1' then '남'
            when '3' then '남'
            else '여'
            end as 성별
from employees
where nvl(department_id, -1) in (30,50);


/*
문제 7. 
employees 테이블에서 부서번호 30번, 50번에 근무하는 사원들만 
사원명, 주민번호, 성별을 나타내세요.
성별은 '남' 또는 '여'라고 나타낸다. 그리고 주민번호는 생년월일만 기재해주고 나머지는 마스킹('*')처리해서 보여준다.

------------------------------------------------------------
부서번호        사원명             주민번호            성별
------------------------------------------------------------
30	        Den Raphaely	    670915*******	여
30	        Alexander Khoo	    611015*******	남
30	        Shelli Baida	    600930*******	남
30	        Sigal Tobias	    611015*******	여
30	        Guy Himuro	    781015*******	남
30	        Karen Colmenares    790915*******	남
50	        Matthew Weiss	    770215*******	여
50	        Adam Fripp	    700915*******	남
50	        Payam Kaufling	    711101*******	남
50	        Shanta Vollman	    801013*******	남
50	        Kevin Mourgos	    811019*******	남
50	        Julia Nayer	    901213*******	여
50	        Irene Mikkilineni   940625*******	남
50	        James Landry	    940825*******	여
50	        Steven Markle	    920415*******	여
50	        Laura Bissot	    850725*******	남
50	        Mozhe Atkinson	    651111*******	남
50	        James Marlow	    001015*******	남
50	        TJ Olson	    000525*******	여
50	        Jason Mallin	    011019*******	여
50	        Michael Rogers	    041215*******	여
50	        Ki Gee	            050325*******	남
50	        Hazel Philtanker    951001*******	여
50	        Renske Ladwig	    951002*******	남
50	        Stephen Stiles	    961004*******	남
50	        John Seo	    961005*******	여
50	        Joshua Patel	    731001*******	남
50	        Trenna Rajs	    731009*******	여
50	        Curtis Davies	    751012*******	남
50	        Randall Matos	    761201*******	여
50	        Peter Vargas	    771006*******	남
50	        Winston Taylor	    831001*******	여
50	        Jean Fleaur	    651019*******	남
50	        Martha Sullivan	    651022*******	남
50	        Girard Geoni	    651023*******	여
50	        Nandita Sarchand    851213*******	남
50	        Alexis Bull	    851018*******	여
50	        Julia Dellinger	    751019*******	여
50	        Anthony Cabrio	    851219*******	여
50	        Kelly Chung	    951115*******	남
50	        Jennifer Dilly	    750930*******	여
50	        Timothy Gates	    851016*******	남
50	        Randall Perkins	    951019*******	여
50	        Sarah Bell	    051013*******	남
50	        Britney Everett	    081019*******	여
50	        Samuel McCain	    091018*******	남
50	        Vance Jones	    101013*******	여
50	        Alana Walsh	    951003*******	여
50	        Kevin Feeney	    971018*******	남
50	        Donald OConnell	    981016*******	여
50	        Douglas Grant	    751117*******	남
*/

select *
from employees;

select first_name || ' ' || last_name as 사원명,
            phone_number as 공개연락처,
            substr(phone_number, 1, instr(phone_number,'.', 1, 1))
            || lpad('*',instr(phone_number, '.', 1, 2) - instr(phone_number, '.', 1,1)-1,'*')
            || substr(phone_number, instr(phone_number, '.', 1, 2)) as 비공개연락처
from employees
where department_id = 90;

/*
문제 8. 
employees 테이블에서 90번 부서에 근무하는 사원들만 아래와 같이
사원명, 공개연락처, 비공개연락처를 나타내세요.
여기서 비공개연락처란? 국번을 * 로 마스킹처리 한것을 말한다.

---------------------------------------------
사원명          공개연락처      비공개연락처
---------------------------------------------
Steven King	515.123.4567	515.***.4567
Neena Kochhar	515.123.4568	515.***.4568
Lex De Haan	515.123.4569	515.***.4569
*/

 
select first_name || ' ' || last_name as 사원명,
            phone_number as 공개연락처,
            substr(phone_number, 1, instr(phone_number,'.', 1, 1))
            || lpad('*',instr(phone_number, '.', 1, 2) - instr(phone_number, '.', 1,1)-1,'*')
            || substr(phone_number, instr(phone_number, '.', 1, 2) ,instr(phone_number, '.', 1, 3)-instr(phone_number, '.', 1, 2))
            || translate(substr(phone_number,  instr(phone_number, '.',1,3)), '0123456789', '************')
            as 비공개연락처
from employees
where department_id = 80;

select *
from employees;

/*
문제 9. 
employees 테이블에서 80번 부서에 근무하는 사원들만 아래와 같이
사원명, 공개연락처, 비공개연락처를 나타내세요.
여기서 비공개연락처란? 첫번째 국번과 마지막 개별번호를 * 로 마스킹처리 한것을 말한다.

---------------------------------------------------------------
사원명               공개연락처               비공개연락처
---------------------------------------------------------------
John Russell	    011.44.1344.429268	    011.**.1344.******
Karen Partners	    011.44.1344.467268	    011.**.1344.******
Alberto Errazuriz   011.44.1344.429278	    011.**.1344.******
Gerald Cambrault    011.44.1344.619268	    011.**.1344.******
Eleni Zlotkey	    011.44.1344.429018	    011.**.1344.******
Peter Tucker	    011.44.1344.129268	    011.**.1344.******
David Bernstein	    011.44.1344.345268	    011.**.1344.******
Peter Hall	    011.44.1344.478968	    011.**.1344.******
Christopher Olsen   011.44.1344.498718	    011.**.1344.******
Nanette Cambrault   011.44.1344.987668	    011.**.1344.******
Oliver Tuvault	    011.44.1344.486508	    011.**.1344.******
Janette King	    011.44.1345.429268	    011.**.1345.******
Patrick Sully	    011.44.1345.929268	    011.**.1345.******
Allan McEwen	    011.44.1345.829268	    011.**.1345.******
Lindsey Smith	    011.44.1345.729268	    011.**.1345.******
Louise Doran	    011.44.1345.629268	    011.**.1345.******
Sarath Sewall	    011.44.1345.529268	    011.**.1345.******
Clara Vishney	    011.44.1346.129268	    011.**.1346.******
Danielle Greene     011.44.1346.229268	    011.**.1346.******
Mattea Marvins	    011.44.1346.329268	    011.**.1346.******
David Lee	    011.44.1346.529268	    011.**.1346.******
Sundar Ande	    011.44.1346.629268	    011.**.1346.******
Amit Banda	    011.44.1346.729268	    011.**.1346.******
Lisa Ozer	    011.44.1343.929268	    011.**.1343.******
Harrison Bloom	    011.44.1343.829268	    011.**.1343.******
Tayler Fox	    011.44.1343.729268	    011.**.1343.******
William Smith	    011.44.1343.629268	    011.**.1343.******
Elizabeth Bates	    011.44.1343.529268	    011.**.1343.******
Sundita Kumar	    011.44.1343.329268	    011.**.1343.******
Ellen Abel	    011.44.1644.429267	    011.**.1644.******
Alyssa Hutton	    011.44.1644.429266	    011.**.1644.******
Jonathon Taylor	    011.44.1644.429265	    011.**.1644.******
Jack Livingston	    011.44.1644.429264	    011.**.1644.******
Charles Johnson	    011.44.1644.429262	    011.**.1644.******
*/  

select department_id AS 부서번호
     , first_name || ' ' || last_name AS 사원명
     , phone_number AS 공개연락처

     , substr(phone_number, 1, instr(phone_number,'.',1,1)) 
    || lpad('*', instr(phone_number,'.',1,2)-instr(phone_number,'.',1,1)-1, '*')

    || case 
       when instr(phone_number,'.',1,3) > 0 
       then substr(phone_number, instr(phone_number,'.',1,2), instr(phone_number,'.',1,3)-instr(phone_number,'.',1,2))
       else ''
       end
    || translate(substr(phone_number, instr(phone_number,'.',-1,1)), '0123456789', '**********')
    AS 비공개연락처
from employees
where department_id in (80,90);


/*
문제 10. (난이도 상)
employees 테이블에서 80번, 90번 부서에 근무하는 사원들만 아래와 같이
부서번호, 사원명, 공개연락처, 비공개연락처를 나타내세요.
여기서 비공개연락처란? 첫번째 국번과 마지막 개별번호를 * 로 마스킹처리 한것을 말한다.

------------------------------------------------------------------------------
부서번호        사원명              공개연락처               비공개연락처
------------------------------------------------------------------------------  
80	        John Russell	    011.44.1344.429268	    011.**.1344.******
80	        Karen Partners	    011.44.1344.467268	    011.**.1344.******
80	        Alberto Errazuriz   011.44.1344.429278	    011.**.1344.******
80	        Gerald Cambrault    011.44.1344.619268	    011.**.1344.******
80	        Eleni Zlotkey	    011.44.1344.429018	    011.**.1344.******
80	        Peter Tucker	    011.44.1344.129268	    011.**.1344.******
80	        David Bernstein	    011.44.1344.345268	    011.**.1344.******
80	        Peter Hall	    011.44.1344.478968	    011.**.1344.******
80	        Christopher Olsen   011.44.1344.498718	    011.**.1344.******
80	        Nanette Cambrault   011.44.1344.987668	    011.**.1344.******
80	        Oliver Tuvault	    011.44.1344.486508	    011.**.1344.******
80	        Janette King	    011.44.1345.429268	    011.**.1345.******
80	        Patrick Sully	    011.44.1345.929268	    011.**.1345.******
80	        Allan McEwen	    011.44.1345.829268	    011.**.1345.******
80	        Lindsey Smith	    011.44.1345.729268	    011.**.1345.******
80	        Louise Doran	    011.44.1345.629268	    011.**.1345.******
80	        Sarath Sewall	    011.44.1345.529268	    011.**.1345.******
80	        Clara Vishney	    011.44.1346.129268	    011.**.1346.******
80	        Danielle Greene	    011.44.1346.229268	    011.**.1346.******
80	        Mattea Marvins	    011.44.1346.329268	    011.**.1346.******
80	        David Lee	    011.44.1346.529268	    011.**.1346.******
80	        Sundar Ande	    011.44.1346.629268	    011.**.1346.******
80	        Amit Banda	    011.44.1346.729268	    011.**.1346.******
80	        Lisa Ozer	    011.44.1343.929268	    011.**.1343.******
80	        Harrison Bloom	    011.44.1343.829268	    011.**.1343.******
80	        Tayler Fox	    011.44.1343.729268	    011.**.1343.******
80	        William Smith	    011.44.1343.629268	    011.**.1343.******
80	        Elizabeth Bates	    011.44.1343.529268	    011.**.1343.******
80	        Sundita Kumar	    011.44.1343.329268	    011.**.1343.******
80	        Ellen Abel	    011.44.1644.429267	    011.**.1644.******
80	        Alyssa Hutton	    011.44.1644.429266	    011.**.1644.******
80	        Jonathon Taylor	    011.44.1644.429265	    011.**.1644.******
80	        Jack Livingston	    011.44.1644.429264	    011.**.1644.******
80	        Charles Johnson	    011.44.1644.429262	    011.**.1644.******
90	        Steven King	    515.123.4567	    515.***.****
90	        Neena Kochhar	    515.123.4568	    515.***.****
90	        Lex De Haan	    515.123.4569	    515.***.****
*/


  
 -- ////////////////////////////////////////////////////////////////////////
 
 
 
 
 
 
 
 
 
 
    -- >       >>     2. 숫자함수       <<
    
    --  *** 2.1     mod     ==> 나머지를 구해주는 함수
    
    select   5/2  -- 2.5
                , mod (5,2) as 나머지  -- 1
                , truncate (5/2) as 몫 -- 2      소수를 잘라내버리고 정수만 보여줌
    from dual;
    
    
    --  *** 2.2     round     ==> 반올림 해주는 함수
    select 94.547,
                round(94.547) as 반올림,    -- 95
                round(94.547, 1) ,   -- 94.5 소수부 첫째자리만 보이겠다
                round(94.547, 2) ,    -- 94.55 소수부 둘째자리까지만 보이겠다
                round(94.547, -1) ,   -- 90 10자리까지 보여라
                round(94.547, -2)     -- 100  
    from dual;
    
    
        --  *** 2.3     trunc     ==> 절삭 해주는 함수
    select 94.547,
                trunc(94.547) ,       -- 94     정수부 1자리까지만 보여주고 나머지는 잘라라
                trunc(94.547, 1) ,   -- 94.5      소수부 첫째자리까지만 보이고 나머지는 잘라라
                trunc(94.547, 2) ,    -- 94.54 
                trunc(94.547, -1) ,   -- 90 정수부 첫째자리까지만 보이고 나머지는 잘라라
                trunc(94.547, -2)     -- 0 
    from dual;
    
    
    
create table tbl_sungjuk
(hakbun   varchar2(20) 
,name     varchar2(20)
,kor      number(3)
,eng      number(3)
,math     number(3)
);

insert into tbl_sungjuk(hakbun, name, kor, eng, math)
values('KH001','한석규', 90, 92, 93);

insert into tbl_sungjuk(hakbun, name, kor, eng, math)
values('KH002','두석규', 100, 100, 100);

insert into tbl_sungjuk(hakbun, name, kor, eng, math)
values('KH003','세석규', 71, 72, 73);

insert into tbl_sungjuk(hakbun, name, kor, eng, math)
values('KH004','네석규', 89, 87, 81);

insert into tbl_sungjuk(hakbun, name, kor, eng, math)
values('KH005','오석규', 60, 50, 40);

insert into tbl_sungjuk(hakbun, name, kor, eng, math)
values('KH006','육석규', 80, 81, 87);

commit;

select *
from tbl_sungjuk;

-- [퀴즈] tbl_sungjuk 을 사용하여 아래와 같이 나오도록 하세요.

------------------------------------------------------------------------------------------------------------
    학번    성명   국어  영어  수학   총점   평균(반올림하여 소수부 첫째자리까지 보여준다.)   학점(A, B, C, D, F)
    + A학점이라면 별5개
    
    
select hakbun as 학번,
            name as 성명,
            kor as 국어,
            eng as 영어,
            math as 수학,
            kor+eng+math as 총점,
            round((kor+eng+math)/3, 1) as 평균,
            case   when round((kor+eng+math)/3, 1) >= 90  then 'A'
                        when round((kor+eng+math)/3, 1) >= 80  then 'B'
                        when round((kor+eng+math)/3, 1) >= 70  then 'C'
                        when round((kor+eng+math)/3, 1) >= 60  then 'D'
                        else  'F'
                        end as 학점,
         /* 또는               
          case trunc(round((kor+eng+math)/3, 1) -1) / 10
                    when 10 then 'A'
                    when 9 then 'A'
                    when 8 then 'B'
                    when 7 then 'C'
                    when 6 then 'D'
                    else 'F'
                    end as 학점
        */
         case when round((kor+eng+math)/3, 1) >= 90  then '*****'
                    when round((kor+eng+math)/3, 1) >= 80  then '****'
                    when round((kor+eng+math)/3, 1) >= 70  then '***'
                    when round((kor+eng+math)/3, 1) >= 60  then '**'
                    else  '*'
                    end as 성취도
         /* 또는
         case when  (trunc(round((kor+eng+math)/3, 1), -1) / 10) /2 >= 4.5  then '*****'
                    when (trunc(round((kor+eng+math)/3, 1), -1) / 10) /2 >= 4.0  then '****'
                    when (trunc(round((kor+eng+math)/3, 1), -1) / 10) /2  >= 3.5  then '***'
                    when (trunc(round((kor+eng+math)/3, 1), -1) / 10) /2  >= 3.0  then '**'
                    else  '*'
                    end as 성취도
         */
from tbl_sungjuk;
    
    
    
    
    
 -- *** 2.4  power : 거듭제곱 *** --- 
 select 2*2*2*2*2, power(2,5)
 from dual;
 
 -- *** 2.5  sqrt : 제곱근 *** ---
 select sqrt(4), sqrt(16), sqrt(2), sqrt(3)
 from dual;
 
 -- *** 2.6  sin, cos, tan, asin, acos, atan *** --
 select sin(90), cos(90), tan(90),
       asin(0.3), acos(0.3), atan(0.3)
 from dual;
 
 -- *** 2.7  log *** --
 select log(10, 100)
 from dual;
 
 
 -- *** 2.8  ceil, floor *** -- 나중에 게시판 만들기 paging 할 때 쓰임 ☆★
 select ceil(10.1), ceil(10.9), ceil(10.0), ceil(10)
 from dual;
 -- ceil(숫자) ==> 숫자가 소수부가 0 이 아닌 경우  ==> 숫자보다 큰 최소의 정수
 --                          숫자가 소수부가 0 인 경우      ==> 자신의 숫자를 정수로 나타내어준다. 
 
 select floor(10.1), floor(10.9), floor(10.0), floor(10)
 from dual;
 -- floor(숫자) ==> 숫자가 소수부가 0 이 아닌 경우  ==> 숫자보다 작은 최대의 정수
 --                숫자가 소수부가 0 인 경우      ==> 자신의 숫자를 정수로 나타내어준다. 
 
 
 -- *** 2.9  sign(수식)  ==> 수식의 결과가 양수이라면 1, 
 --                         수식의 결과가 음수이라면 -1,
 --                         수식의 결과가 0이라면 0 으로 나타내어준다.
 select sign(5-2), sign(2-5), sign(5-5)
 from dual;
 
 -- *** 2.10  ascii , chr   *** --
 select ascii('A'), ascii('a'), ascii('0'), ascii(' ')
 from dual;
 --       65	       97	       48	        32
 
 select chr(65), chr(97), chr(48), chr(32)
 from dual;
 --       A	       a	     0	    ' '    
    
    
    -- >       >>     3. 날짜 함수       <<
               
--- *** 현재 시각을 알려주는 것 *** ---
select sysdate, current_date, localtimestamp, current_timestamp, systimestamp
from dual;
-- 날짜타입의 기본적인 표현방식은 RR/MM/DD 이다.
-- RR은 00~49는 2000~2049 이고, 50~99는 1950~1999 이다.

select *
from v$timezone_names;

select sysdate
     , extract(year from sysdate) AS "현재년도"
     , extract(month from sysdate) AS "현재월"
     , extract(day from sysdate) AS "현재일"
from dual; 

select systimestamp
     , extract(hour from systimestamp)+9 AS "현재시간"  -- 오라클 시간으로 계산하기때문에 우리나라 시간에 맞추기위해 +9해줌
     , extract(minute from systimestamp) AS "현재분"
     , extract(second from systimestamp) AS "현재초"
from dual; 


select 123,  -- 오른쪽 맞춤은 숫자
            '123', sysdate  -- 왼쪽 맞춤은 문자 아니면 날짜
from dual;

select 001, '001', 
            to_number('001') -- 문자를 숫자로 바꿔줌
from dual;

select 123-3, '123'- 3  -- to_number 안해도 빼기 되는 이유는 오라클에서 자동 형변환 해주기 때문 
from dual;





-----[ 퀴즈 ] 
-- 1. 사원번호       사원명         주민번호            성별          현재나이(현재년도 - 태어난년도 +1)

select employee_id as 사원번호
            ,first_name || ' ' || last_name as 사원명
            ,jubun as 주민번호
            ,case substr(jubun, 7, 1)
            when '1' then '남'
            when '3' then '남'
            else '여'
            end as 성별
            ,to_number(substr(jubun, 1,2)) + 
            case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end as 태어난년도,
            extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1
            -- 2020 - (90 + 1900) +1
from employees;












-- ========== *** inline View *** =============

-----[ 퀴즈 ] 
-- 2. employees 테이블에서 연령대가 20대와 40대인 사원들만 아래와 같이 나오도록 하세요.
--      사원번호       사원명         주민번호            성별          현재나이(현재년도 - 태어난년도 +1)

-- 뷰 사용하기 ☆★☆★☆★☆★ 현업에 나가면 엄~~~~~~청나게 많이 쓸거래
select V.employee_id AS 사원번호,
            -- first_name || ' ' || last_name --> view에는 이런 컬럼이 없음
             V.ename as 사원명,
             V.jubun as 주민번호,
             V.gender as 성별,
             V.age as 나이
FROM
(
        select employee_id 
                    ,first_name || ' ' || last_name as ENAME
                    ,jubun 
                    ,case substr(jubun, 7, 1)
                    when '1' then '남'
                    when '3' then '남'
                    else '여'
                    end as GENDER
                    ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                    from employees
) V -- 이때 V를  inline View 라고 부른다.  View는 테이블은 아니지만 테이블로 간주하는 것이다.
where trunc(V.age, -1) in (20,40)
order by V.age asc;

-- 또는 V. 생략 가능
select employee_id AS 사원번호,
             ename as 사원명,
             jubun as 주민번호,
             gender as 성별,
             age as 나이
FROM
(
        select employee_id 
                    ,first_name || ' ' || last_name as ENAME
                    ,jubun 
                    ,case substr(jubun, 7, 1)
                    when '1' then '남'
                    when '3' then '남'
                    else '여'
                    end as GENDER
                    ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                    from employees
) V 
where trunc(age, -1) in (20,40)
order by age asc;


-----[ 퀴즈 ] 
-- 2. employees 테이블에서 연령대가 20대와 40대인 여자 사원들만 아래와 같이 나오도록 하세요.
--      사원번호       사원명         주민번호            성별          현재나이(현재년도 - 태어난년도 +1)

select employee_id AS 사원번호,
             ename as 사원명,
             jubun as 주민번호,
             gender as 성별,
             age as 나이
FROM
(
        select employee_id 
                    ,first_name || ' ' || last_name as ENAME
                    ,jubun 
                    ,case substr(jubun, 7, 1)
                    when '1' then '남'
                    when '3' then '남'
                    else '여'
                    end as GENDER
                    ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                    from employees
) V 
where trunc(age, -1) in (20,40)
             and
             gender = '여'
order by age asc;


-- ***** === 날짜 + 숫자(숫자의 단위는 일수)    ==> 날짜(RR/MM/DD)    === *****
-- ***** === 날짜 - 숫자(숫자의 단위는 일수)     ==> 날짜(RR/MM/DD)    === *****
select sysdate -1,  -- 어제
             sysdate,       -- 오늘
             sysdate +1     -- 내일
from dual;

select  to_char ( sysdate -1,  'yyyy-mm-dd hh24:mi:ss' ) as 어제시각,
              to_char ( sysdate,  'yyyy-mm-dd hh24:mi:ss' ) as 오늘시각,   
              to_char ( sysdate +1,  'yyyy-mm-dd hh24:mi:ss' ) as 내일시각
from dual;          

-- 1일 = 24시간 = 24*60분 = 24*60*60초
--[퀴즈] 현재일로부터 1일 2시간 3분 4초 뒤를 나타내세요
select to_char ( sysdate,  'yyyy-mm-dd hh24:mi:ss' ) as 현재시각,
             to_char ( sysdate+ (93784/86400), 'yyyy-mm-dd hh24:mi:ss' ) as "1일 2시간 3분 4초 뒤",
             to_char(sysdate + 1+ 2/24 + 3/(24*60) + 4/(24*60*60) , 'yyyy-mm-dd hh24:mi:ss')
from dual;

1일 86400
2시간 7200
3분 180
4초


-- *** 날짜 - 날짜   ==> 숫자(단위가 일수)  ***
select sysdate + 3 - sysdate
from dual;

select sysdate + 3 + sysdate
from dual;      -- 날짜 + 날짜 구하는건 없다. 오류뜸

select employee_id as 사원번호,
            first_name || ' ' || last_name  as 사원명,
            to_char (hire_date, 'yyyy-mm-dd') as 입사일자,
            trunc (sysdate - hire_date) as 근무일수
from employees;


-- *** add_months (날짜, 숫자) 에서 숫자는 단위가 개월을 말한다.
-- 날짜에서 숫자(단위가 개월)를 더한 날짜가 나온다.

select add_months(sysdate, -2) as "2개월 전",          -- 첫 글자가 숫자로 시작하는 alias는 반드시 "쌍따옴표"를 붙여야한다. 안그럼 오류!
            sysdate,
            add_months(sysdate, 2) as "2개월 후"
from dual;

-- *** 오늘부로 김건형씨가 군대에 또 끌려갔습니다. 근무개월수가 18개월이라고 할 때 제대 일자를 구하세요 
select to_char(add_months(sysdate, 18), 'yyyy-mm-dd') as "제대일자"
from dual;


-- *** last_day (특정날짜) ==> 특정날짜가 포함된 달력에서 맨 마지막날을 알려주는 것이다.
select last_day ( '2020-02-05' ), 
            last_day ( to_date ('2020-02-05', 'yyyy-mm-dd') ),
            last_day ( '2019-02-01' ), 
            last_day ( to_date ('2019-02-01', 'yyyy-mm-dd') ),
            last_day (sysdate)
from dual;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
        사원번호            사원명             입사일자                현재나이            정년퇴직일 (63세 또는 64세가 되는 년도)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
          1001                     ...                         ...                             61                 2022  ||  -08-31
          1002                     ...                         ...                             40                 2043  ||  -02-28  

교육 공무원법의 근거로 정년퇴직일은  해당 사원의 생월이 3월~8월에 태어난 사람은 해당 사원의 나이(한국나이)가 63세가 되는 년도의 8월말일(8월31일)로 하고, 
해당 사원의 생월이 9월~2월에 태어난 사람은 해당 사원의 나이(한국나이)가 64세가 되는 년도의 2월말(2월 28일 또는 2월29일)로 한다.

-- 생월이 3~8월인 경우
-- 정년퇴직년도   ==> 현재나이(60세)       ==> add_months(sysdate, 3*12)       ==> add_months(sysdate, (63-60)*12)     ==> add_months(sysdate, (63-현재나이)*12)
-- 정년퇴직년도   ==> 현재나이(40세)       ==> add_months(sysdate, 23*12)     ==> add_months(sysdate, (63-40)*12)     ==> add_months(sysdate, (63-현재나이)*12)

-- 생월이 9~2월인 경우
-- 정년퇴직년도   ==> 현재나이(60세)       ==> add_months(sysdate, 4*12)       ==> add_months(sysdate, (64-60)*12)     ==> add_months(sysdate, (64-현재나이)*12)
-- 정년퇴직년도   ==> 현재나이(40세)       ==> add_months(sysdate, 24*12)     ==> add_months(sysdate, (64-40)*12)     ==> add_months(sysdate, (64-현재나이)*12)


select last_day (  
               case  
                    when substr(jubun, 3, 2) between '03' and '08' 
                            then to_char ( add_months(sysdate, (63-age) *12) , 'yyyy-' )
--            case when ( '03' <= substr(jubun, 3, 2) and substr(jubun, 3, 2) <= '08' ) then to_char ( add_months(sysdate, (63-age) *12)  , 'yyyy-' )
--                                              ▲ 생월 뽑아오기 01~12                                                    ▲연도만 볼거야 1980/03/31 나오니까
             
             else to_char ( add_months(sysdate, (64-age) *12), 'yyyy-' )
             end 
             ||
             case
                when  substr(jubun, 3, 2) between '03' and '08' 
                        then '08-01'
                        else '02-01'
             end
             )
             as 정년퇴직일
             
FROM
(
        select employee_id 
                    ,first_name || ' ' || last_name as ENAME
                    ,hire_date
                    ,jubun
                    ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                    from employees
) V ;






---- *** months_metween(날짜1, 날짜2)   ==> 날짜1 - 날짜2 를 뺀 값으로 숫자가 나오는데 그 단위는 개월 수 이다.
--         즉, 두 날짜의 개월 차이를 구할 때 사용하는 것이다.

select months_between(add_months(sysdate , 3)+10, sysdate),
--                                         ▲ 3개월 10일 후                         ▲현재  월
trunc (months_between(add_months(sysdate , 3)+10, sysdate))
from dual;
-- 3 출력

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        사원번호            사원명             입사일자                현재나이            정년퇴직일 (63세 또는 64세가 되는 년도)               퇴직금(근무년수 * 월급)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          1001                     ...                         ...                             61                 2022  ||  -08-31
          1002                     ...                         ...                             40                 2043  ||  -02-28  

        -- 퇴직금 (근무년수 * 월급)
        -- 근무년수 10년 7개월     ==> 127개월 * 월급      ==> 127/12년 * 월급    ==> trunc(127/12)년 * 월급
        -- 근무개월수     =>  trunc ( months_between (정년퇴직일, 입사일) )
        -- 근무년수     =>  trunc (  trunc ( months_between (정년퇴직일, 입사일) )  /12)년 

select employee_id,
             ename,
             hire_date,
             age,
             last_day (  
               case  
                    when substr(jubun, 3, 2) between '03' and '08' 
                            then to_char ( add_months(sysdate, (63-age) *12) , 'yyyy-' )
--            case when ( '03' <= substr(jubun, 3, 2) and substr(jubun, 3, 2) <= '08' ) then to_char ( add_months(sysdate, (63-age) *12)  , 'yyyy-' )
--                                              ▲ 생월 뽑아오기 01~12                                                    ▲연도만 볼거야 1980/03/31 나오니까
             
             else to_char ( add_months(sysdate, (64-age) *12), 'yyyy-' )
             end 
             ||
             case
                when  substr(jubun, 3, 2) between '03' and '08' 
                        then '08-01'
                        else '02-01'
             end
             )
             as RetirementDate,
             monthsal         
FROM
(
        select employee_id 
                    ,first_name || ' ' || last_name as ENAME
                    ,hire_date
                    ,jubun
                    ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                    ,nvl(salary + (salary * commission_pct), salary) as MONTHSAL
                    from employees
) V ;



select employee_id , 
            ename,
            hire_date,
            age,
            RetirementDate,
            monthsal,
            trunc (  trunc ( months_between (RetirementDate, hire_date) )  /12 * monthsal) as 퇴직금
FROM 
(
         select employee_id,
                 ename,
                 hire_date,
                 age,
                 last_day (  
                   case  
                        when substr(jubun, 3, 2) between '03' and '08' 
                                then to_char ( add_months(sysdate, (63-age) *12) , 'yyyy-' )
                 else to_char ( add_months(sysdate, (64-age) *12), 'yyyy-' )
                 end 
                 ||
                 case
                    when  substr(jubun, 3, 2) between '03' and '08' 
                            then '08-01'
                            else '02-01'
                 end
                 )
                 as RetirementDate,
                 monthsal         
    FROM
    (
            select employee_id 
                        ,first_name || ' ' || last_name as ENAME
                        ,hire_date
                        ,jubun
                        ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                        ,nvl(salary + (salary * commission_pct), salary) as MONTHSAL
                        from employees
    ) V
) T;



-------------------------------------------------------------------------------------------------------------------------------------------------
        사원번호            사원명             입사일자                현재나이            정년 (63세가 되는 년도)
-------------------------------------------------------------------------------------------------------------------------------------------------
          1001                     ...                         ...                             61                 2022
          1002                     ...                         ...                             40                 2043  


select employee_id AS 사원번호,
             ename as 사원명,
             hire_date as 입사일자,
             age as 현재나이,
             63-age+extract(year from sysdate) as 정년
             
FROM
(
        select employee_id 
                    ,first_name || ' ' || last_name as ENAME
                    ,hire_date
                    ,case substr(jubun, 7, 1)
                    when '1' then '남'
                    when '3' then '남'
                    else '여'
                    end as GENDER
                    ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                    from employees
) V ;



        
    --04/01
    
    --  *** 3.4 next_day (특정날짜, '일') '일'~ '토'
    --          ==> 특정날짜로부터 다음번에 돌아오는 가장 빠른 '일'~'토'의 날짜를 알려주는 것이다.
    
    select sysdate, 
                next_day (sysdate, '금'),
                next_day (sysdate, '수')
    from dual;




               ---  >>> 4. 변환함수 <<< --- 
               
---  1. to_char(날짜데이터, 보고자하는 날짜의포맷)  --> 날짜데이터를 문자형태로 변환
---     to_char(숫자데이터, 보고자하는 숫자의포맷)  --> 숫자데이터를 문자형태로 변환

---  2. to_number(숫자모양을띄는 문자데이터) --> 숫자모양을띄는 문자데이터를 숫자형태로 변환

---  3. to_date(날짜모양을띄는 문자데이터, 날짜모양을띄는 문자데이터가 어떤 형태의 날짜로 되어져 있는지 기술)
        --> 날짜모양을띄는 문자데이터를 날짜형태로 변환 

select sysdate
     , to_char(sysdate, 'yyyy') AS "현재년도"  -- to_char( )는 날짜나 숫자를 문자 형태로 변환시켜주는 함수               
     , to_char(sysdate, 'mm') AS "현재월"
     , to_char(sysdate, 'dd') AS "현재일"
     , to_char(sysdate, 'hh24') AS "현재시간"
     , to_char(sysdate, 'mi') AS "현재분"
     , to_char(sysdate, 'ss') AS "현재초"
from dual;  
-- 겉모양은 숫자지만 문자기때문에 왼쪽맞춤

select sysdate
     , to_char(sysdate, 'day')   -- '금요일'  'Friday'
     , to_char(sysdate, 'dy')    -- '금'      'Fri'
     , to_char(sysdate, 'd')     -- '1' '2' '3' '4' '5' '6' '7'
                                 --  일  월  화  수   목  금  토
from dual;


select case  to_char(sysdate, 'd') 
            when '1' then '일'
            when '2' then '월'
            when '3' then '화'
            when '4' then '수'
            when '5' then '목'
            when '6' then '금'
            when '7' then '토'
            end as "오늘의 요일명1"
            , -- 다른 데이터베이스와 호환
            decode( to_char (sysdate, 'd'),'1' , '일',
                                                                 '2' , '월',
                                                                 '3' , '화',
                                                                 '4' , '수',
                                                                 '5' ,  '목',
                                                                 '6' , '금',
                                                                 '7' , '토',
                                                                 'else에 해당하는 값' 
                           )  as "오늘의 요일명2"
            -- 오라클만
from dual;



select to_char(sysdate, 'd')    -- 달력에서 현재 이 요일이 그 주의 몇번째 요일인가?
           , to_char(sysdate, 'dd')     -- 달력에서 몇번째인가?
           , to_char(sysdate, 'ddd')       -- 1월1일부터 며칠째인가?
from dual;

select to_char(sysdate, 'sssss')
from dual;  -- 오늘 자정 0시0분0초부터 현재까지 흘러간 초

select 123456789
     , to_char(123456789, '999,999,999')    -- 3자리마다 콤마찍어라
     , to_char(123456789, '$999,999,999')
     , to_char(123456789, 'L999,999,999')   -- 해당 나라 통화기호
from dual;

select 2000 + 1
         , '2000' + 1
         , '2000'
         , to_number('2000')  -- to_number(숫자형태의문자데이터) ==> 숫자형태의문자데이터를 실제 숫자타입으로 변환시켜주는 것.
from dual;

select to_date('2020-04-01', 'yyyy-mm-dd') - to_date('2020-03-31', 'yyyy-mm-dd'),
             to_date('20200401', 'yyyymmdd') - to_date('2020/03/31', 'yyyy/mm/dd'),
             to_date('2020.04.01', 'yyyy.mm.dd') - to_date('20200331', 'yyyymmdd')
from dual;





                 ---  >>> 5. 기타함수 <<< ---
  -- 암기!! case when then else end  
  select case 5-2
         when 1 then '5-2 = 1 입니다.'
         when 2 then '5-2 = 2 입니다.'
         else '나는 수학을 몰라요ㅜㅜ'
         end 
  from dual;  -- 나는 수학을 몰라요ㅜㅜ
  
  select case 5-2
         when 1 then '5-2 = 1 입니다.'
         when 3 then '5-2 = 3 입니다.'
         else '나는 수학을 몰라요ㅜㅜ'
         end 
  from dual;  -- 5-2 = 3 입니다.
  
  
  select case 
         when 5-2 > 10 then '5-2 > 10 입니다.'
         when 5-2 > 3 then '5-2 > 3 입니다.'
         else '나는 수학을 몰라요ㅜㅜ'
         end 
  from dual;  -- 나는 수학을 몰라요ㅜㅜ
  
  
  --- 암기!!   decode
  select decode(5-2, 1, '5-2 = 1 입니다.'
                   , 2, '5-2 = 2 입니다.'
                      , '나는 수학을 몰라요ㅜㅜ')
  from dual;  -- 나는 수학을 몰라요ㅜㅜ
  
  select decode(5-2, 1, '5-2 = 1 입니다.'
                   , 3, '5-2 = 3 입니다.'
                      , '나는 수학을 몰라요ㅜㅜ')
  from dual;  -- 5-2 = 3 입니다.
  
  
  
   ---- *** 등수구하기 rank , 서열(순위)구하기 dense_rank *** ---- 
  
  /*
      사원번호   기본급여   등수   서열(순위)
      --------------------------------------------------------
       1001      3000                 5              4
       1002      4000                 2              2
       1003      3500                 4              3
       1004      5000                 1              1   
       1005      4000                 2              2
  */
  
  select employee_id
       , first_name || ' ' || last_name AS ENAME
       , salary
       ,  rank()    over (order by salary desc)  AS "기본급여 등수"
       --                 ▲  검사할 범위 
       ,  dense_rank()    over (order by salary desc) AS "기본급여 서열"
  from employees;
  
  
  /*
        사원번호        월급          월급등수           월급서열(순위)
  */
  select employee_id
       ,  nvl ( salary + (salary*commission_pct) , salary ) as 월급
       ,  rank() over(order by nvl ( salary + (salary*commission_pct) , salary ) desc)as "월급 등수"
       ,  dense_rank() over (order by nvl ( salary + (salary*commission_pct) , salary ) desc) as "월급 서열"   
  from employees;
  
  
  -- 월급의 등수가 1등부터 10등까지인 사원들만 
  -- 사원번호       사원명         월급          월급등수를 나타내세요
  
  select  employee_id as 사원번호,
                first_name || ' ' || last_name as  사원명,
                nvl ( salary + (salary*commission_pct) , salary ) as 월급,
                rank() over(order by nvl ( salary + (salary*commission_pct) , salary ) desc)as "월급 등수"
  from employees
  where rank() over(order by nvl ( salary + (salary*commission_pct) , salary ) desc) between 1 and 10;
  /*
    오류.
    rank() 및 dense_rank() 는 where 절에 사용할 수 없다 !!
    이때는 inline view를 사용해서 구한다.
*/
  
SELECT  employee_id as 사원번호,
                   ename as 사원명,
                   monthsal as 월급,
                   monthsalrank as 월급등수
FROM
 ( 
        select employee_id
                     ,  first_name || ' ' || last_name AS ENAME
                     ,  nvl ( salary + (salary*commission_pct) , salary ) as MONTHSAL -- 월급
                     ,  rank() over(order by nvl ( salary + (salary*commission_pct) , salary ) desc)as MONTHSALRANK --월급등수
        from employees
) V
 WHERE MONTHSALRANK between 1 and 10;
 
 
 /*
     ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        부서번호        사원번호            기본급여       부서내 기본급여 등수         전직원 기본급여 등수            부서 내 기본급여 서열(순위)           전직원 기본급여 서열(순위)
     -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  */
  
    select department_id as 부서번호
              ,  employee_id as 사원번호
               , first_name || ' ' || last_name as 사원명
               , salary as 기본급여
               ,  rank()    over (partition by department_id order by salary desc)  AS "부서내 기본급여 등수"
               --                           ▲ 부서별로 칸막이 쳤을 때
               ,  rank()    over (order by salary desc)  AS "전직원 기본급여 등수"
               ,  dense_rank()    over (partition by department_id order by salary desc) AS "부서내 기본급여 서열"
               ,  dense_rank()    over (order by salary desc) AS "기본급여 서열"
  from employees
  order by 1 asc, 4 desc;
  
  
  
  
        ---- *** greatest(), least() *** ---- 
  --  greatest() 는 나열된 것중 가장 큰 값을 가지는 것만 추출.
  --  least() 는 나열된 것중 가장 작은 값을 가지는 것만 추출.
  
  select greatest(10,90,100,80)   -- 100
             , least(10,90,100,80) -- 10
  from dual;
  
  select greatest('김유신','윤봉길','허준','고두심')  -- '허준'
             , least('김유신','윤봉길','허준','고두심')  -- '고두심'
  from dual;
  
  select greatest(sysdate, sysdate-1, sysdate+1)   -- greatest , least는 숫자, 문자 이외에 날짜도 가능
             , least(sysdate, sysdate-1, sysdate+1)  
  from dual;
  
  
    --[ 퀴즈 ]
  -- employees 테이블에서 입자일자가 가장 빠른 (오래된) 사원에대해
  -- 사원번호, 사원명, 입사일자를 추출하세요.
  
  select  employee_id as 사원번호
               , first_name || ' ' || last_name as 사원명
               , hire_date as 입사일자
  from employees
  where hire_date = ( select min(hire_date) from employees );
  
  
  --[ 퀴즈 ]
  -- employees 테이블에서 입자일자가 가장 늦은(최근인) 사원에대해
  -- 사원번호, 사원명, 입사일자를 추출하세요.
  
  select  employee_id as 사원번호
               , first_name || ' ' || last_name as 사원명
               , hire_date as 입사일자
  from employees
  where hire_date = ( select max(hire_date) from employees );
  
  
  
           ---- *** lag() , lead() *** --- ex) 게시판에서 이전글 보기, 다음글 보기를 작성하고자 할 때 사용한다.
  
  -- lag  ==> 어떤행의 바로앞의 몇번째 행을 가리키는 것.
  -- lead ==> 어떤행의 바로뒤의 몇번째 행을 가리키는 것.
  
  select lag(first_name || ' ' || last_name) over(order by salary desc)  
            , lag(salary) over(order by salary desc)        --앞에 사람
           
            , employee_id
            , first_name || ' ' || last_name AS ENAME       -- 자기이름
            , salary
           
            , lead(first_name || ' ' || last_name) over(order by salary desc) 
            , lead(salary) over(order by salary desc)       --뒤에 사람
  from employees;
  
  
  select lag(first_name || ' ' || last_name, 2) over(order by salary desc)  
       , lag(salary, 2) over(order by salary desc)      -- 2는 앞에앞에 사람 
       
       , employee_id
       , first_name || ' ' || last_name AS ENAME
       , salary
       
       , lead(first_name || ' ' || last_name, 2) over(order by salary desc) 
       , lead(salary, 2) over(order by salary desc)     -- 2칸 뒤에있는 사람
  from employees;
  
  
  select lag(first_name || ' ' || last_name, 1) over(order by salary desc)  
       , lag(salary, 1) over(order by salary desc) 
       
       , employee_id
       , first_name || ' ' || last_name AS ENAME
       , salary
       
       , lead(first_name || ' ' || last_name, 1) over(order by salary desc) 
       , lead(salary, 1) over(order by salary desc) 
  from employees;
  
  
  select lag(first_name || ' ' || last_name,1,' ') over(order by salary desc)    -- 앞에 아무도 없으면 null 대신 공백으로 나타내라
       , lag(salary,1,0) over(order by salary desc)     -- 앞에 없으면 null 대신 0으로 나타내라
       
       , employee_id
       , first_name || ' ' || last_name AS ENAME
       , salary
       
       , lead(first_name || ' ' || last_name,1,'없음') over(order by salary desc)   -- 뒤에 아무도 없으면 null 대신 '없음'으로 나타내라
       , lead(salary,1,0) over(order by salary desc)  -- 뒤에 없으면 null 대신 0으로 나타내라
  from employees;
  
  
  
  
  
  
  
  
  
  
  
  
  

  -------------------------------------------------------------------------
               ------- **** 그룹함수(집계함수) **** -------
               
  /*
      1. sum      -- 합계
      2. avg      -- 평균
      3. max      -- 최대값
      4. min      -- 최소값
      5. count    -- select 되어서 나온 결과물의 행의 갯수
      6. variance -- 분산
      7. stddev   -- 표준편차
  
      분산    : 분산의 제곱근이 표준편차 (평균에서 떨어진 정도) 
      표준편차 : 표준편차의 제곱승이 분산 (평균과의 차액)
      
      >>> 주식투자 <<<
      50 60 40 50 55 45 52 48   평균 50   편차가 적음  -- 안정투자
      10 90 20 80 30 70 90 10   평균 50   편차가 큼    -- 투기성투자(위험을 안고서 투자함)
      
      분산과 표준편차는 어떤 의사결정시 도움이 되는 지표이다.
  */
  
 ---- !!! 중요 !!! 그룹함수(집계함수)에서는 null 은 무조건 제외하고서 연산을 한다. !!! --- ☆★☆★☆★☆★
 select salary
 from employees;
 
 select sum(salary), avg(salary), max(salary), min(salary), count(salary)
 from employees;
 
 select avg(salary), stddev(salary), power(stddev(salary), 2), variance(salary), sqrt(variance(salary))
 --                                                                               ▲ 표준편차 제곱      ▲ 분산
 from employees;
 
 select 5600+2838+2345-2346*2343/2353+null   --- null 
 from dual;
 
 select sum(salary * commission_pct),    -- sum이 알아서 널을 빼버림
             count (salary*commission_pct)  -- count도 알아서 널 빼고 집계함
 from employees;
 
 select count(salary), count(commission_pct)
 from employees;
 
 select count(employee_id), count(department_id)
 from employees;
 
 desc employees;
 
 select count(*)   -- 107
 from employees;
  
  
  ----- *** employees 테이블에서 기본급여(salary)의 평균 *** -----  
 select sum(salary) / count (salary),
             --또는
             avg(salary) ,
             --또는
             sum(salary)/count(*)
 from employees;
 
 
  ----- *** employees 테이블에서 수당(salary * commission_pct)의 평균 *** -----
  select   sum(salary* commission_pct) / count (salary* commission_pct),
                 --또는
                 avg(salary* commission_pct) ,
                 --또는
                 sum(salary* commission_pct)/count(*)
  from employees;
 
  select   sum( nvl (salary* commission_pct, 0) ) / count ( nvl(salary* commission_pct, 0) ),
                 --또는
                 avg( nvl (salary* commission_pct, 0) ) ,
                 --또는
                 sum(salary* commission_pct)/count(*)
  from employees;
 
 
 
 
          --- >>>> *** group by 절 *** <<<< --- 
 
 -- employees 테이블에서 전체사원들에 대해 부서번호별로 인원수를 나타내세요. --  
 -- 총인원수 : 107명
 /*
   ---------------------------
    부서번호    인원수
   ---------------------------
     10                   1
     20                   2
     30                   6
     40                   1
     50                  45
     ............................. 
    --------------------------     
 */
 
 select department_id as 부서번호,
             count(*) as 인원수
 from employees
 group by department_id
 --                 ▲ 그룹 짓는 기준
 order by 1;
 
 
 
 -- [ 퀴즈 ]
 -- employees 테이블에서 전체 사원들에 대해 성별로 인원수를 나타내세요.
 /*
            ----------------------------
              성별         인원수
                남               56
                여               51
            ----------------------------
*/
SELECT  GENDER,
                  count(*) as MEMBER
FROM
(
        select case substr(jubun, 7, 1)
                    when '2' then '여'
                    when '4' then '여'
                    else '남'
                    end as GENDER               
        from employees
)V
group by GENDER;

-- 또는

select decode ( substr(jubun, 7,1),  '2', '여',
                                                             '4', '여',
                                                                   '남')
              as  성별,
              count(*) as 인원수
from employees
group by decode ( substr(jubun, 7,1),  '2', '여',
                                                                   '4', '여',
                                                                         '남');

-- 또는
SELECT GENDER as 성별, count(*) as 인원수
FROM 
(
        select decode ( substr(jubun, 7,1),  '2', '여',
                                                                     '4', '여',
                                                                           '남')
                      as  GENDER
        from employees
)V
group by GENDER;



 -- employees 테이블에서 전체 사원들에 대해 부서번호, 성별로 인원수를 나타내세요.
 /*
            -------------------------------------------------
              부서번호            성별         인원수
                    50                   남               23
                    50                   여               22
                    ....                    ...                ...
                    80                   남               19   
                    80                   여               15  
            -------------------------------------------------
*/

select department_id as 부서번호, gender as 성별,
            count(*) as 인원수   
FROM 
(
        select department_id, 
                    decode ( substr(jubun, 7,1),  '2', '여',
                                                                     '4', '여',
                                                                           '남')
                      as  GENDER
        from employees
)V
group by department_id,          gender 
--                 ▲ 1차로 그룹짓고,  ▲ 이걸로 또 그룹지음
order by 1,2;


--[ 퀴즈 ]
 -- employees 테이블에서 전체 사원들에 대해 부서번호, 성별로 인원수를 나타내세요.    + 없으면 0 나오게
 /*
            -------------------------------------------------
              부서번호            성별         인원수
                    10                   남               0
                    10                   여               1  
                    50                   남               23
                    50                   여               22
                    ....                    ...                ...
                    80                   남               19   
                    80                   여               15  
            -------------------------------------------------
*/
-- 없는 데이터를 그룹지어서 뽑을 수 없기때문에 답 없음.


    /* ====  having 절은 group by 절과 함께 사용하는 것으로써, 그룹함수에 대한 조건을 나타낼 때 사용된다. ==== */
    
 -- employees 테이블에서 전체사원들에 대해 부서번호별로 인원수를 나타내되 인원수가 10명 이상인 부서번호만 나타내세요. --  
 -- 총인원수 : 107명
 
 select department_id as 부서번호, 
             count(*) as 인원수
 from employees
 group by department_id
 having count(*) >= 10; -- 두자리 수 이상
 
 
  --[ 퀴즈 ]
  -- employees 테이블에서 전체사원들에 대해 부서번호별로 기본급여의 합계(총액)를 나타내되
  -- 합계(총액)이 50000 이상인 부서번호만 
  -- 부서번호, 인원수, 합계(총액), 최고급여, 최저급여를 나타내세요. 
  -- 총인원수 : 107명
 select department_id as 부서번호, 
             count(*) as 인원수,
             to_char(sum(salary),'999,999,999') as 기본급여,
             to_char(max(salary),'999,999,999') as 최고급여,
             to_char(min(salary),'999,999,999') as 최저급여
 from employees
 group by department_id
 having sum(salary) >50000
 order by 1;
 
 
 
  -- [ 퀴즈 ]
 -- employees 테이블에서 전체 사원들에 대해 성별로 인원수, 백분율(%)을 나타내세요. 
 -- 분모에 전체인원수, 인원수 * 107/107
 /*
            -----------------------------------------------------
              성별         인원수        퍼센티지(%)
                남               56                 52.3
                여               51                 47.7 
            -----------------------------------------------------
*/ 

SELECT GENDER as 성별, count(*) as 인원수,
                  round( count(*) / (select count(*) from employees) * 100, 1 ) as "퍼센티지(%)"
FROM 
(
        select decode ( substr(jubun, 7,1),  '2', '여',
                                                                     '4', '여',
                                                                           '남')
                      as  GENDER
        from employees
)V
group by GENDER;


select department_id, count(*)
from employees;
-- 오류. group 함수가 없다.




            ---- *** !!!! 누적에 대해서 알아봅니다. !!!! *** ----
 /*
   --  sum(누적되어야할 컬럼명) over(order by 누적되어질 기준이 되는 컬럼명 asc[desc])
    
   --  sum(누적되어야할 컬럼명) over(partition by 그룹화 되어질 컬럼명 
                                   order by 누적되어질 기준이 되는 컬럼명 asc[desc])  
 */
            
 create table tbl_panmae
 (panmaedate  date
 ,jepumname   varchar2(20)
 ,panmaesu    number
 );

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2), '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+1, '새우깡', 15); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+2, '감자깡', 20);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+3, '새우깡', 10);
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-2)+3, '새우깡', 3);
 
 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1), '고구마깡', 7);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+1, '새우깡', 8); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+2, '감자깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( add_months(sysdate,-1)+3, '감자깡', 5);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 4, '허니버터칩', 30);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 3, '고구마깡', 15);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 2, '고구마깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate - 1, '허니버터칩', 20);


 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '감자깡', 5);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '허니버터칩', 15);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '고구마깡', 20);

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '감자깡', 10); 

 insert into tbl_panmae(panmaedate, jepumname, panmaesu)
 values( sysdate, '새우깡', 10);

 commit;
 
 select *
 from tbl_panmae;
  
  
  --- *** tbl_panmae 테이블에서 새우깡에 대한 일일판매량과 일일누적판매량을 나타내세요. *** ---
  select to_char(panmaedate, 'yyyy-mm-dd') as panmaedate,
               sum(panmaesu) as 일일판매량,
               sum( sum(panmaesu) ) over(order by to_char(panmaedate, 'yyyy-mm-dd')  asc) as 일일누적판매량
  from tbl_panmae
  where jepumname = '새우깡'
  group by to_char(panmaedate, 'yyyy-mm-dd');

  -----------------------------------------------------------------------
    판매일자        일일판매량           일일누적판매량
  -----------------------------------------------------------------------
  2020/02/01            10                              10
  2020/02/02            15                              25
  2020/02/04            13                              38
  2020/03/02             8                               46
  2020/04/01            30                              76
  
   
  --- *** tbl_panmae 테이블에서 모든 제품에 대한 일일판매량과 일일누적판매량을 나타내세요. *** --- 
  ------------------------------------------------------------------------------------
    제품명       판매일자          일일판매량           일일누적판매량
  ------------------------------------------------------------------------------------
                      2020/02/01            10                              10
                      2020/02/02            15                              25
                      2020/02/04            13                              38
                      2020/03/02             8                               46
                      2020/04/01            30                              76
  

  select  jepumname,
               to_char(panmaedate, 'yyyy-mm-dd') as panmaedate,
               sum(panmaesu) as 일일판매량,
               sum(sum(panmaesu)) over(partition by jepumname
                                               order by to_char(panmaedate, 'yyyy-mm-dd') asc) as 일일누적판매량
  from tbl_panmae
  group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
  order by 1,2;
  
  
  

  ---------------------------------------------------
    부서번호 30           부서번호 60                 
  ---------------------------------------------------
            6                               5
            
            
  select  sum(case department_id when 30 then 1 end) as 부서번호30,
               sum(case department_id when 60 then 1 end) as 부서번호60
  from employees
  where department_id in (30, 60);
  
  
  /*
        employees 테이블에서 아래와 같이 나오도록 하세요.
        
        ----------------------------------------------------------------------------------------
            부서번호          총인원수          남자인원수           여자인원수
        ----------------------------------------------------------------------------------------
                10                        1                           0                             1
                20                        2                           0                             2
                50                       45                         23                           22
                 ...     
*/

  select  department_id as 부서번호 ,
               count(*) as 인원수,
               nvl(sum(case when substr(jubun, 7, 1) = '1' then 1 when substr(jubun, 7, 1) = '3' then 1 end),0) as 남자인원수,
               nvl(sum(case when substr(jubun, 7, 1) = '2' then 1 when substr(jubun, 7, 1) = '4' then 1 end),0) as 여자인원수
  from employees 
  group by department_id
  order by 1;
  
  -- 또는
  select  department_id as 부서번호 ,
               count(*) as 인원수,
               sum(case when substr(jubun, 7, 1) in ('1', '3') then 1 else 0 end) as 남자인원수,
               sum(case when substr(jubun, 7, 1) in ('2', '4') then 1 else 0 end) as 여자인원수
  from employees 
  group by department_id
  order by 1;  
  
  ---- ====== **** group by절과 함께 사용되는 요약값 (rollup, cube) **** ====== -----
  
  ------------------------- *** 요약값을 나타내어주는 rollup을 사용해본다. ***-------------------------
  select department_id as 부서번호, 
              count(*) as 인원수, 
              sum(salary) as 기본급여합계
  from employees
  group by rollup(department_id);   -- 그룹안지은게 나옴. null 
  -- 전체 인원 수 107 전체 급여 합계 691416
  
  select count(*) as 인원수,
               sum(salary) as 기본급여합계
  from employees;
  
  
  select --department_id as 부서번호,
              grouping (department_id),  -- ▲ 1은 그룹 안지었다, 0은 그룹 지었다는 뜻
              decode ( grouping ( department_id ), 0 , nvl( to_char(department_id), '인턴') , '전체'),  -- 0이라면 부서번호 별 그룹을, 아니라면 (=1이라면) 7878을 보여라                        
              count(*) as 인원수, 
              to_char( sum(salary), '999,999') as 기본급여합계
  from employees
  group by rollup(department_id);
  
  
  
  --04/02
    select   grouping(department_id) as 부서번호그룹핑,
                  grouping( decode(substr(jubun,7,1), '2', '여', '4', '여', '남') ) as 성별그룹핑,
                  department_id as 부서번호,
                  decode(substr(jubun,7,1), '2', '여', '4', '여', '남') as 성별,
                  count(*) as 인원수, 
                  to_char( sum(salary), '999,999') as 기본급여합계
  from employees
  group by rollup (department_id, 
                                  decode(substr(jubun,7,1), '2', '여', '4', '여', '남') ); -- 부서번호별 소계를 나타내줌
                                  
                                  
  
  select     decode ( grouping(department_id), 0,  to_char(department_id), ' ' ) 
                  as 부서번호그룹핑,
                  decode (grouping( decode(substr(jubun,7,1), '2', '여', '4', '여', '남') ), 0, decode(substr(jubun,7,1), '2', '여', '4', '여', '남'), ' ')  
                  as 성별,
                  count(*) as 인원수, 
                  to_char( sum(salary), '999,999') as 기본급여합계
  from employees
  group by rollup (department_id, 
                                  decode(substr(jubun,7,1), '2', '여', '4', '여', '남') );  

-- inline view로 정리
    SELECT decode (grouping (department_id), 0, to_char(department_id) , ' ') as 부서번호,
                     decode ( grouping (gender), 0, gender, ' ' ) as 성별,
                     sum(salary) as 기본급여합계
    FROM 
   (
          select    department_id,
                          decode(substr(jubun,7,1), '2', '여', '4', '여', '남') as gender,
                          salary
          from employees
    ) V
    group by rollup(department_id, gender);
    
------------------------- *** 요약값을 나타내어주는 cube를 사용해본다. ***-------------------------

select decode ( grouping (department_id) , 0 , to_char(department_id), ' ') AS 부서번호
            , decode (grouping (gender) , 0, gender, ' ') AS 성별
            , count(*) as 인원수
            , to_char (sum (salary), '999,999')  AS 기본급여합계
    FROM
    (
        select department_id
                , decode (substr(jubun, 7, 1), '2', '여'
                                                    , '4', '여'
                                                         , '남') AS gender
                , salary
        from employees
    ) V
    group by cube (department_id, gender)
    order by 1,2;
    -- to_char(department_id)라서 오름차순 중 10자리에 100이 껴있음. 

SELECT decode(department_id , -999, ' ', to_char(department_id)) as 부서번호,
                 gender as 성별,
                 cnt as 인원수,
                 salsum as 기본급여합계
FROM
(
    select decode ( grouping (department_id) , 0 , department_id, -999) AS DEPARTMENT_ID
            , decode (grouping (gender) , 0, gender, ' ') AS GENDER
            , count(*) as CNT
            , to_char (sum (salary), '999,999')  AS SALSUM
    FROM
    (
        select department_id
                , decode (substr(jubun, 7, 1), '2', '여'
                                                    , '4', '여'
                                                         , '남') AS gender
                , salary
        from employees
    ) V 
    group by cube (department_id, gender)   
    order by 1,2
)T;
    

/*
        1. group by rollup(a,b,c) == group by grouping sets( (a,b,c), (a,b), (a), () ) 
        
           group by rollup(department_id, gender) == group by grouping sets( (department_id, gender), (department_id), () ) 
        
        2. group by cube(a,b,c) == group by grouping sets( (a,b,c), (a,b), (b,c), (a,c), (a), (b), (c), () ) 
        
           group by cube(department_id, gender) == group by grouping sets( (department_id, gender), (department_id), (gender), () ) 
        
   */               
   
   ---- ***  rollup과 cube는 그룹을 짓는 것이 셋팅되어 우리가 변경이 불가하지만, 
   ----       grouping sets를 사용하면 우리가원하는 대로 그룹을 지어서 볼 수 있다. *** 
   
   select decode ( grouping (department_id) , 0 , to_char(department_id), ' ') AS 부서번호
            , decode (grouping (gender) , 0, gender, ' ') AS 성별
            , count(*) as 인원수
            , to_char (sum (salary), '999,999')  AS 기본급여합계
    FROM
    (
        select department_id
                , decode (substr(jubun, 7, 1), '2', '여'
                                                    , '4', '여'
                                                         , '남') AS gender
                , salary
        from employees
    ) V
    group by grouping sets ( (department_id), (gender), () ) -- 원하는것만 할 수 있음
    order by 1;
    
    
    
    
    
    
    
    
    
    
                  -------- *** SUB Query *** --------
 /*
    -- SUB Query(서브쿼리)란?
    select 문 속에 또 다른 select 문이 포함되어져 있을때
    포함되어진 select 문을 SUB Query(서브쿼리)라고 부른다.
    
    select ....
    from ......   ==> Main Query(메인쿼리) == 외부쿼리
    where .... in (select ...
                           from .....) ==> SUB Query(서브쿼리) == 내부쿼리
 */
 
 /*
    employees 테이블에서 기본급여가 제일많은 사원과 기본급여가 제일적은 사원의 정보를
    사원번호, 사원명, 기본급여로 나타내세요.
 */
 select employee_id as 사원번호,
             first_name || ' ' || last_name as 사원명,
             salary as 기본급여
 from employees
 where salary = (select max(salary) from employees )
              or
              salary = (select min(salary) from employees);

 select employee_id as 사원번호,
             first_name || ' ' || last_name as 사원명,
             salary as 기본급여
 from employees
 where salary in ( select max(salary), min(salary)   from employees );  
--            ▲ 칼럼 한개            ▲칼럼 두개▲                        짝이 안맞기 때문에 "too many values" 에러 뜸.                                 


 
  /*
    employees 테이블에서 각 부서별로 기본급여가 제일많은 사원의 정보를
    사원번호, 사원명, 기본급여로 나타내세요.
 */
 
 --------------------------------------------
    department_id           salary
 --------------------------------------------    
            30                         1000
            30                         5000
            30                         9000     --> 추출
            50                         5000
            50                         9000     --> 30번 부서랑 같은 급여
            50                       20000      --> 추출
  
 select department_id, max(salary) 
 from employees 
 group by department_id;        -- salary만 max로 주면 다른부서에 같은 급여가 있을 수 있음.
 
 
 select department_id as 부서번호,
             employee_id as 사원번호,            
             first_name || ' ' || last_name as 사원명,
             salary as 기본급여
 from employees
 where (nvl(department_id,-9999), salary) in ( select nvl(department_id, -9999), max(salary) 
                                                                                 from employees 
                                                                                 group by department_id)   
--          ▲ 부서번호랑 급여를 한 세트로 이뤄야 함
order by 1;



       ---- **** Pairwise Sub Query(쌍 서브쿼리) **** ----
 /*
     employees 테이블에서 
     부서번호별로 salary가 최대인 사원과 
     부서번호별로 salary가 최소인 사원의 정보를
     부서번호, 사원번호, 사원명, 기본급여를 나타내세요.
 */
 
  select department_id as 부서번호,
              employee_id as 사원번호,            
              first_name || ' ' || last_name as 사원명,
              salary as 기본급여
 from employees
 where (nvl(department_id,-9999), salary) in ( select nvl(department_id, -9999), max(salary) 
                                                                                 from employees 
                                                                                 group by department_id)   
              OR
              (nvl(department_id,-9999), salary) in ( select nvl(department_id, -9999), min(salary) 
                                                                                 from employees 
                                                                                 group by department_id)   
order by 1,4;


/*
    employees 테이블에서 부서번호가 60번, 80번 부서에 근무하는 사원들중에
    월급이 50번 부서 직원들의 "평균월급" 보다 많은 사원들만
    부서번호, 사원번호, 사원명, 월급을 나타내세요.
*/

select department_id as 부서번호,
              employee_id as 사원번호,         
              first_name || ' ' || last_name as 사원명,
              nvl(salary+(salary*commission_pct), salary) as 월급
from employees
where department_id in (60,80)
             and 
             nvl(salary+(salary*commission_pct), salary) > (  select avg(nvl(salary+(salary*commission_pct), salary))
                                                                                                from employees
                                                                                                where department_id = 50);
               
--- 상관서브쿼리(서브 상관쿼리)를 이용하여 데이터 복구하기                
               
                                                                                                
----- **** !!!! Sub Query를 사용하여 테이블 생성하기 !!!! **** -----
create table employees_copy 
as
select *
from employees;

select *
from employees_copy ;
-- Sub Query를 사용하여 생성되어진 테이블은 원래 테이블(employees)의 NOT NULL 제약만 복사가 되고
-- 나머지 제약들은 복사가 안되어진다.
select *
from user_constraints
where table_name = 'EMPLOYEES';

select *
from user_constraints
where table_name = 'EMPLOYEES_COPY';


update employees set first_name = '몰라';
update employees set last_name = '또몰라';

commit;                                                 


update employees E set first_name = ( select first_name 
                                                                      from employees_copy   -- 백업본
                                                                      where employee_id = E.employee_id
                                                                )
                                        ,last_name = (  select last_name 
                                                                   from employees_copy   
                                                                   where employee_id = 167 );
select *
from employees
order by 1; -- 복구완료

        ------------- **** 상관 서브쿼리 (서브 상관쿼리) **** ---------------
        --> 상관 서브쿼리 (서브 상관쿼리)란?
        --   외부쿼리(메인쿼리) 에 있는 테이블의 컬럼이 내부쿼리(서브쿼리)의 조건절에 사용될때를 말한다.

select E.department_id,
             employee_id,   
             E.salary, 
             rank() over(order by salary desc) as "전직원 대상 급여등수1",
             (  select count(*) +1
                from employees
                where salary > E.salary  ) as "전직원 대상 급여등수2",
              rank() over(partition by department_id
                                   order by salary desc) as "부서내 급여등수1",
              (   select count(*) +1
                   from employees
                   where department_id > E.department_id
                                and
                                salary > E.salary  ) as "부서내 급여등수2"                   
from employees E
order by 1,3 desc;   -- 별칭주기


SELECT department_id, gender
            ,     count(*) as 인원수
            ,     round (count(*) / (select count(*) from employees) * 100 , 1) 
            as "전체 퍼센티지(%)"
            ,     round (count(*) / (select count(*) 
                                                  from employees
                                                  where nvl(department_id, -9999)  = nvl( V.department_id , -9999)) * 100 , 1) 
            as "부서내 퍼센티지(%)"
FROM
(
select department_id
        ,   decode (substr(jubun, 7,1),  '1' , '남'
                                                         ,  '3' , '남'
                                                                 , '여' )
            as  GENDER
        from employees
) V
group by department_id, gender
order by 1,2;




--04/06

-- *** Sub Query(서브쿼리)에서 사용되는 ANY *** --
--  = ANY 는 IN 으로 생각하면 된다.
/*
   사원번호 101번, 사원번호 105번 사원이 근무하는 동일한 부서에 근무하는 사원들만
   사원번호, 사원명, 부서번호를 나타내세요
*/

select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , department_id AS 부서번호 
from employees
where department_id = any(select department_id
                                                   from employees 
                                                   where employee_id in (101, 105))
order by 1;


select employee_id AS 사원번호
         , first_name || ' ' || last_name AS 사원명
         , department_id AS 부서번호 
from employees
where department_id in (select department_id
                                             from employees 
                                             where employee_id in (101, 105))
order by 1;


select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , department_id AS 부서번호 
from employees
where department_id in (select department_id
                                             from employees 
                                             where employee_id in (101, 105))
                                             and
                                             employee_id not in (101, 105)
order by 1;

/*
    기본급여가 최저인 사원을 제외한 사원들만
    사원번호, 사원명, 기본급여를 나타내세요
*/

select min(salary) from employees; 

select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , salary AS 기본급여
from employees
where salary > (select min(salary) from employees)
order by 3;

select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , salary AS 기본급여
from employees
where salary > any(select salary from employees)        -- 꼴찌만 제외하고 나머지를 보여라
order by 3;


-- *** Sub Query(서브쿼리)에서 사용되는 ALL *** --
-- ALL 는 AND 로 생각하면 된다.
/* 
   30번,50번,100번 부서에 근무하는 사원의 최고기본급여 보다 더 많이 받는 사원들만
   사원번호, 사원명, 부서번호, 기본급여를 나타내세요. 
*/
select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , department_id AS 부서번호 
     , salary AS 기본급여
from employees
where salary >     ( select max(salary)
                                  from employees
                                  where department_id in (30,50,100)
                                 )
order by 3;


select employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명
     , department_id AS 부서번호 
     , salary AS 기본급여
from employees
where salary >  all ( select salary
                                    from employees
                                    where department_id in (30,50,100)
                                  )
order by 3;


-- *** 상관 Sub Query(상관서브쿼리)에서 사용되는 EXISTS *** --
select *
from employees
where 1=2;
-- 거짓. 행 안나옴

select *
from employees
where 2=2;
-- 참. 행 나옴

select *
from employees
where exists(select * from departments where department_id = 500);
-- 500번 부서 없기때문에 거짓. 행 안나옴 

select *
from employees
where exists(select * from departments where department_id = 30);

/*
   각 부서의 책임자들만 부서번호, 사원번호, 사원명을 나타내세요.
*/
select department_id AS 부서번호
     , employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명 
from employees
where employee_id in (select manager_id  
                                           from departments
                                           where manager_id is not null)
order by 1;

select department_id AS 부서번호
     , E.employee_id AS 사원번호
     , first_name || ' ' || last_name AS 사원명 
from employees E
where exists(select * from departments where manager_id = E.employee_id)
order by 1; -- 위에와 결과물 똑같지만 행이 많은 대용량 DB에서는 exists를 쓰는것이 속도면에서 더 나음



          ----- **** SET Operator(SET 연산자) **** ----- 시험문제 출제 예정 ☆★☆
   -- 면접시 JOIN 과 UNION 의 차이점에 대해서 말해보세요~~!!
   /*
      1. UNION       --- 합집합
      2. UNION ALL
      3. INTERSECT   --- 교집합
      4. MINUS       --- 차집합
   */
    
 -->>>  UNION 은 서로 다른 테이블(뷰)의 행(ROW)과 행(ROW)을 합칠때 사용하는 연산자이다. <<---
    
    insert into tbl_panmae(panmaedate, jepumname, panmaesu)
    values( sysdate, '새우깡', 10);
    
    insert into tbl_panmae(panmaedate, jepumname, panmaesu)
    values( sysdate, '감자깡', 20);
    
    insert into tbl_panmae(panmaedate, jepumname, panmaesu)
    values( sysdate, '새우깡', 15);
    
    commit;
    
    select *
    from tbl_panmae;
    
    --[ 퀴즈 ] tbl_panmae 테이블에서 2개월 전의 달 (2020-02 달)에 속한 행들만 읽어다가 
    --             tbl_panmae_2020_02라는 테이블을 생성하세요.
    create table tbl_panmae_2020_02
    as
    select *
    from tbl_panmae
    where to_char( panmaedate, 'yyyy-mm')  =  to_char( add_months(sysdate, -2), 'yyyy-mm');
    
    --[ 퀴즈 ] tbl_panmae 테이블에서 1개월 전의 달 (2020-03 달)에 속한 행들만 읽어다가 
    --             tbl_panmae_2020_03라는 테이블을 생성하세요.
    create table tbl_panmae_2020_03
    as
    select *
    from tbl_panmae
    where to_char( panmaedate, 'yyyy-mm')  =  to_char( add_months(sysdate, -1), 'yyyy-mm');
    
    
    --[ 퀴즈 ] tbl_panmae 테이블에서 현재달 (2020-04 달)에 속한 행들이 아닌것만 삭제하세요.
    delete from tbl_panmae
    where to_char(panmaedate, 'yyyy-mm') != to_char(sysdate, 'yyyy-mm');
    
    commit;
    
    select *
    from tbl_panmae;

    --- *** 2020년 2월 부터 현재까지 발생한 판매에 있어서 제품별, 월별 판매량의 합계를 나타내세요. ***
    SELECT  jepumname as 제품명, to_char (panmaedate, 'yyyy-mm') as 판매월
                    , sum(panmaesu) as 판매량
    FROM
    (
            select *
            from tbl_panmae_2020_02
            UNION
            select *
            from tbl_panmae_2020_03
            UNION
            select *
            from tbl_panmae
    ) V
    group by jepumname, to_char (panmaedate, 'yyyy-mm')
    order by 1,2;
    
    
    select *
    from tbl_panmae_2020_03
    UNION ALL
    select *
    from tbl_panmae_2020_02
    UNION ALL
    select *
    from tbl_panmae;  
    
    
    /*
        A = { a, x, b, e, g }
        
        B = { c, d, a, b, y, k, m }
        
        A ∪ B = { a, b, c, d, e, g, k, m, x, y }  ==>  UNION -- 공통인것 한번만 나오고 자동으로 오름차순 정렬함
        
                 { a, x, b, e, g, c, d, a, b, y, k, m } ==>  UNION ALL  -- 단순 무식하게 그냥 A와 B를 합침
                 
        A ∩ B = { a, b }  ==> INTERSECT
        
        A - B = { x, e, g }         ==> MINUS
        
        B - A = { c, d, y, k, m  }  ==> MINUS
    */
    
    insert into tbl_panmae_2020_02(panmaedate, jepumname, panmaesu)
    values( to_date('2020-04-02 09:30:50', 'yyyy-mm-dd hh24:mi:ss'), '쵸코파이', 20);
    
    insert into tbl_panmae_2020_03(panmaedate, jepumname, panmaesu)
    values( to_date('2020-04-02 09:30:50', 'yyyy-mm-dd hh24:mi:ss'), '쵸코파이', 20);
    
    insert into tbl_panmae(panmaedate, jepumname, panmaesu)
    values( to_date('2020-04-02 09:30:50', 'yyyy-mm-dd hh24:mi:ss'), '쵸코파이', 20);
    
    commit;
    
    
    /*    
           UNION 은 첫번째 SELECT 문의 결과와 두번째 SELECT 문의 결과인 
           행들을 합치는 것인데, 
           출력의 결과물은 첫번째 SELECT 문의 결과와 두번째 SELECT 문의 결과에서
           중복된 행들이 있으면 제거하고 1번만 보여준다.
           또한 SELECT 되어져 나오는 첫번째 컬럼값을 기준으로 자동으로 오름차순 되어서 나온다.
            
           UNION ALL 은 첫번째 SELECT 문의 결과와 두번째 SELECT 문의 결과인 
           행들을 합치는 것인데,
           출력의 결과물은 첫번째 SELECT 문의 결과와 두번째 SELECT 문의 결과에서
           중복된 행들이 있으면 제거하지 않고 그대로 중복되어 보인다.
           또한 정렬은 없다.    
*/

    select *
    from tbl_panmae_2020_02
    INTERSECT
    select *
    from tbl_panmae_2020_03;
    
    
    select *
    from tbl_panmae_2020_02
    MINUS
    select *
    from tbl_panmae_2020_03;

    select *
    from tbl_panmae_2020_03
    MINUS
    select *
    from tbl_panmae_2020_02;

    -- === *** select 되어 나온 결과물에서 행 전체가 똑같은 것이 있다면 
    --              중복돼 보이지 않고 1개 행만 보이도록 하려면 select 바로 다음에 distinct를 쓰면 된다.
    select department_id
    from employees;
    
    select distinct department_id
    from employees;     -- 중복제거
    
    select first_name, department_id
    from employees;
    
    select distinct first_name, department_id
    from employees;    -- first_name와 department_id 전체가 똑같은게 있으면 제거
    
    SELECT distinct *
    FROM
    (
        select *
        from tbl_panmae_2020_03
        UNION ALL
        select *
        from tbl_panmae_2020_02
        UNION ALL
        select *
        from tbl_panmae
    ) V;
    
    
    
    
    
    
    
    --04/03
    
    ---- *** !!! 중요   JOIN(조인)  중요 면접에 가면 무조건 물어봅니다. !!! *** ----
    -- 면접시 INNER JOIN 과 OUTER JOIN 의 차이점에 대해서 말해보세요~~!!
    -- 면접 필기시험 : INNER JOIN 으로 SELECT 하는 문제
    --             : OUTER JOIN 으로 SELECT 하는 문제(***)
    
  /*
     JOIN(조인)은 테이블(뷰)과 테이블(뷰)을 합치는 것을 말하는데
     행(ROW)과 행(ROW)을 합치는 것이 아니라,
     컬럼(COLUMN)과 컬럼(COLUMN)을 합치는 것을 말한다.
      
     A = { 1, 2, 3 }   원소가 3개
     B = { a, b }      원소가 2개
     
     A ⊙ B = { (1,a), (1,b)
              , (2,a), (2,b)
              , (3,a), (3,b) }
              
     데카르트곱(수학) ==> 원소의 곱 :   3개*2개 = 6개(모든 경우의 수)        
 ==> 수학에서 말하는 데카르트곱을 데이터베이스에서는 "Catersian Product" 라고 부른다.
 
 */
 
 /*
     JOIN ==> 1) SQL 1992 CODE 방식
                 데이터베이스 벤더(회사) 제품마다 약간씩 문법이 다름.
                 테이블(뷰)과 테이블(뷰) 사이에 콤마(,)를 찍어주는것.
 
              ==> 2) SQL 1999 CODE 방식(ANSI SQL)
                     표준화된것(ANSI SQL)
                     테이블(뷰)과 테이블(뷰) JOIN 이라는 단어를 넣어주는것.
 */
 
 --- 1) SQL 1992 CODE 방식 ---   
 
 select *
 from employees;
 
 select count(*)
 from employees;    -- 행 107개
 
 
 select count(*)
 from departments;      -- 행 27개
 
 select distinct department_id
 from employees
 order by 1;
 
 
 select *
 from employees, departments;   -- 행 2889개 (모든 경우의 수)
 
 select count(*)
 from employees, departments; -- 107*27
 
 
 
  --- 1) SQL 1999 CODE 방식 ---  
 select *
 from employees cross join departments;  -- 행 2889개
 
 
 
 
 
 
 
       -- *** Catersian Product 가 사용되어지는 예 *** --
 /*
      1. 프로야구 경기일정(1팀당 다른 모든 팀끼리 경기)
      2. 그룹함수로 나온 1개의 행을 가지고 어떤 데이터 값을 얻으려고 할때 
 */
 
 /*
   ------------------------------------------------------------------------------------
     사원번호   사원명   월급   평균월급   평균월급차액   비율
   ------------------------------------------------------------------------------------
   
 */
 
 select employee_id    -- 행 107개
           , first_name || ' ' || last_name as ENAME    -- 행 107개
           , nvl(salary+(salary*commission_pct), salary) as MONTHSAL    -- 행 107개
           , avg (nvl(salary+(salary*commission_pct), salary)) as AVGMONTHSAL       -- 행 1개
 from employees;
 -- 오류.
 
 select employee_id    
           , first_name || ' ' || last_name as ENAME 
           , nvl(salary+(salary*commission_pct), salary) as MONTHSAL  
 from employees;
 
 select trunc ( avg (nvl(salary+(salary*commission_pct), salary) )  ) as AVGMONTHSAL
 from employees;
 
 
 SELECT    A.employee_id as 사원번호
                    ,A.ename as 사원명
                    ,A.monthsal as 월급
                    ,B.avgmonthsal as 평균월급
                    ,A.monthsal - B.Avgmonthsal as 평균월급차액
                    -- 비율        B.avgmonthsal  :  A.monthsal = 1 : x   ==>   x = A.monthsal*1 / B.avgmonthsal
                    , round ( A.monthsal*1 / B.avgmonthsal , 1 ) as 비율
 FROM 
 (
         select employee_id    
                   , first_name || ' ' || last_name as ENAME 
                   , nvl(salary+(salary*commission_pct), salary) as MONTHSAL  
         from employees
 )  A
,   -- SQL 1992 CODE 방식
 (
         select trunc ( avg (nvl(salary+(salary*commission_pct), salary) )  ) as AVGMONTHSAL
         from employees
 ) B
 order by 1;
 
 
 
  SELECT    A.employee_id as 사원번호
                    ,A.ename as 사원명
                    ,A.monthsal as 월급
                    ,B.avgmonthsal as 평균월급
                    ,A.monthsal - B.Avgmonthsal as 평균월급차액
                    -- 비율        B.avgmonthsal  :  A.monthsal = 1 : x   ==>   x = A.monthsal*1 / B.avgmonthsal
                    , round ( A.monthsal*1 / B.avgmonthsal , 1 ) as 비율
 FROM 
 (
         select employee_id    
                   , first_name || ' ' || last_name as ENAME 
                   , nvl(salary+(salary*commission_pct), salary) as MONTHSAL  
         from employees
 )  A
cross join  -- SQL 1999 CODE 방식
 (
         select trunc ( avg (nvl(salary+(salary*commission_pct), salary) )  ) as AVGMONTHSAL
         from employees
 ) B
 order by 1;
 
 
 
 
 
     --- *** SQL 1992 CODE 방식중 EQUI JOIN *** ---
     --- *** SQL 1999 CODE 방식중 INNER, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN *** ---
 /*
   ----------------------------------------------------------------------
     부서번호     부서명         사원번호  사원명  월급
   ---------------------------------------------------------------------- 
     =======         ######        +++++++++++++++++++++
     employees   departments         employees
     departments 
 */
 
 select *
 from employees E , departments D
 where employees.department_id = departments.department_id
 order by 1;
 
 
 select     E.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E , departments D   --> SQL 1992 CODE
 where E.department_id = D.department_id
 order by 1;
 
 
select     department_id  as 부서번호     
                ,department_name as 부서명         
                ,employee_id as 사원번호  
                ,first_name as 사원명  
                , nvl( salary + (salary * commission_pct), salary )as 월급
 from employees E , departments D
 where department_id = department_id
 order by 1;
 -- 오류
 -- 00918. 00000 -  "column ambiguously defined" --> 컬럼이 애매모호하다
 -- 컬럼이 두 테이블에 이중으로 있을때는 테이블명 별칭을 꼭 적어줘야한다.
 
 select    E.department_id  as 부서번호     
                ,department_name as 부서명         
                ,employee_id as 사원번호  
                ,first_name as 사원명  
                , nvl( salary + (salary * commission_pct), salary )as 월급
 from employees E , departments D
 where E.department_id = D.department_id
 order by 1;
 -- 해결
 
--  + Kimberely도 출력하기
 select     E.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E , departments D
 where nvl (E.department_id, -999) = nvl (D.department_id, -999)
 --                                                                          ▲ not null이기 때문에 -999가 존재할 수 없음
 order by 1;
 -- Kimberely 안나옴
 
  select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E , departments D   
 --        ▲ Kimberely가 있는 곳
 where E.department_id = D.department_id(+)     --> 조인 조건절
 -- 괄호(+) 가 없는 곳 ( =E) 의 모든 행을 다 보여주고 자기 부서번호와 같은 곳(짝)을 찾아감
 order by 1;
 
 
 select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E , departments D   
 where E.department_id(+) = D.department_id
 order by 1;
 
 
  select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E , departments D   
 where E.department_id(+) = D.department_id(+)  --> 이런건 없음
 order by 1;
 -- 오류
 
  --- *** outer join *** ---
  -- left outer join    ==   left join
  -- right outer join    ==   right join
  -- full outer join    ==   full join  
  -- outer 생략 가능
  -- inner join     ==     join
  -- inner 생략가능
 select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E inner join departments D   --> SQL 1999 CODE
 on E.department_id = D.department_id
 order by 1;
 
 
 select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E left outer join departments D   --> 왼쪽에 있는 employees를 다 보여준 다음에 짝지음
 on E.department_id = D.department_id
 order by 1;
 -- Kimberely 나옴 
 
 
 select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E right outer join departments D   --> 오른쪽에 있는 departments를 다 보여준 다음에 짝지음
 on E.department_id = D.department_id
 order by 1;
-- Kimberely 안나옴

 select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E full outer join departments D   --> 양쪽을 다 보여줘라
 on E.department_id = D.department_id
 order by 1; 
-- Kimberely 나옴

    ----- *** 조인조건절 대신 using 사용하기 *** -----
 select  department_id  as 부서번호     
            , D.department_name as 부서명         
            , E.employee_id as 사원번호  
            , E.first_name as 사원명  
            , nvl( E.salary + (E.salary *E.commission_pct), E.salary )as 월급
 from employees E inner join departments D  
 using (department_id)
 order by 1;    


     --- *** NATURAL JOIN *** ---
     -- NATURAL JOIN 은 오라클에서만 사용되는 문법으로서 INNER JOIN과 같은 것이다.
     -- 오류 발생할 수 있으니까 .. 웬만하면 사용하지 마라 !
 select  department_id  as 부서번호     
            , department_name as 부서명         
            , employee_id as 사원번호  
            , first_name as 사원명  
            , nvl( salary + (salary *commission_pct), salary )as 월급
 from employees natural join departments   --> SQL 1999 CODE
 order by 1;
 
 
   -- SQL 1999 CODE 로 문제 풀이하세요 ~~

  ---- *** [퀴즈] 부서번호 30번과 60번에 근무하는 사원들에 대해서 아래와 같이 나오도록 하세요.
  /*
   --------------------------------------------------------------------
     부서번호     부서명         사원번호  사원명  월급
   -------------------------------------------------------------------- 
     =======     ######        +++++++++++++++++++++
     employees   departments         employees
     departments 
 */  

 select     D.department_id  as 부서번호     
                , D.department_name as 부서명         
                , E.employee_id as 사원번호  
                , E.first_name as 사원명  
                , nvl( E.salary + (E.salary * E.commission_pct), E.salary )as 월급
 from employees E join departments D   --> SQL 1999 CODE
 on  E.department_id = D.department_id
        and
        E.department_id in (30,60)
 order by 1;
 -- 또는
 select D.department_id AS 부서번호
       , D.department_name AS 부서명
       , E.employee_id AS 사원번호
       , E.first_name || ' ' || E.last_name AS 사원명
       , nvl(E.salary + (E.salary * E.commission_pct), E.salary) 월급      
  from employees E JOIN departments D 
  ON E.department_id = D.department_id
  where E.department_id in(30, 60);


----- *** [퀴즈] employees 테이블을 사용하여 아래와 같이 나오도록 하세요.
  /*
     --------------------------------------------------------------------------------------------------
       부서번호  사원번호   사원명  기본급여   부서별평균기본급여   비율
     --------------------------------------------------------------------------------------------------
                                        
  */
 update employees set department_id = null
 where employee_id = 119; -- 30   2500    7000
 
 rollback;
  
select E.department_id AS 부서번호
           , E.employee_id AS 사원번호
           , E.first_name || ' ' || E.last_name AS 사원명
           , E.salary AS 기본급여
           , V.DEPTAVGSAL AS 부서별평균기본급여
           , trunc( (E.salary*1)/V.DEPTAVGSAL, 2 ) AS 비율  -- V.DEPTAVGSAL : E.salary = 1 : x
  from employees E JOIN (select  department_id
                                             , trunc(avg(salary)) AS DEPTAVGSAL
                                               from employees
                                               group by department_id) V        --> department_id에 null값이 있어서 
  ON nvl(E.department_id, -9999) = nvl(V.department_id, -9999)      --> null끼리 붙여야하기때문에 nvl 사용.
  order by 1, 4;
  
  
  
  
  
  
          ---- **** Multi Table JOIN(다중 테이블 조인) **** ----
      -->  3개 이상의 테이블(뷰)을 가지고 조인 시켜주는 것이다. 
      
/*
     --------------------------------------------------------------------------------------------------
       부서번호   부서명   국가명   부서주소   사원번호   사원명   기본급여 
     -------------------------------------------------------------------------------------------------- 
     부서번호 : departments.department_id (P.K)
                      : employees.department_id (F.K)
     부서명   : departments
     국가명   : countries
     부서주소 : locations
     사원번호, 사원명, 기본급여 : employees 
*/
  
  select *
  from employees;  -- department_id (F.K)
  
  select *
  from departments; -- department_id (P.K) , location_id (F.K) 
  
  select *
  from locations; -- location_id (P.K) , country_id (F.K) 
  
  select *
  from countries; -- country_id (P.K)
          
  select E.department_id AS 부서번호
            , D.department_name AS 부서명
            , C.country_name AS 국가명
            , L.street_address || ' ' || L.city || ' ' || L.state_province AS 부서주소
            , E.employee_id AS 사원번호
            , E.first_name || ' ' || E.last_name AS 사원명
            , E.salary 기본급여
  from employees E ,  departments D ,  locations L ,  countries C 
  where E.department_id = D.department_id AND 
               D.location_id = L.location_id AND
               L.country_id = C.country_id
  order by 1;  -- 행의 갯수가 106 개 
          
          
  select E.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,C.country_name AS 국가명
        ,L.street_address || ' ' || L.city || ' ' || L.state_province AS 부서주소
        ,E.employee_id AS 사원번호
        ,E.first_name || ' ' || E.last_name AS 사원명
        ,E.salary 기본급여
  from employees E  
  JOIN  departments D
  ON E.department_id = D.department_id
  JOIN  locations L
  ON D.location_id = L.location_id
  JOIN  countries C 
  ON L.country_id = C.country_id
  order by 1;  -- 행의 갯수가 106 개        
          
  
  select E.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,C.country_name AS 국가명
        ,L.street_address || ' ' || L.city || ' ' || L.state_province AS 부서주소
        ,E.employee_id AS 사원번호
        ,E.first_name || ' ' || E.last_name AS 사원명
        ,E.salary 기본급여
  from employees E ,  departments D ,  locations L ,  countries C 
  where E.department_id = D.department_id(+) AND --> 전체를 테이블 한개로 봄(E+D)
               D.location_id = L.location_id(+) AND     -->  Kimberely는 부서가 없기때문에 나라도 없음. D를 다 보여라는건 E+D합친걸 다 보이라는 뜻과 같음.
               L.country_id = C.country_id(+)  --> (+) 없으면 이어서 맵핑할 수 없음. L을 다 보이라는 건 앞에 합친거랑 다 합한걸 보이라는 뜻.
               --                                             ▲ 없으면 Kimberely 안나옴
  order by 1;  -- 행의 갯수가 107 개 
  
  
  select E.department_id AS 부서번호
        ,D.department_name AS 부서명
        ,C.country_name AS 국가명
        ,L.street_address || ' ' || L.city || ' ' || L.state_province AS 부서주소
        ,E.employee_id AS 사원번호
        ,E.first_name || ' ' || E.last_name AS 사원명
        ,E.salary 기본급여
  from employees E  
  LEFT JOIN  departments D
  ON E.department_id = D.department_id
  LEFT JOIN  locations L
  ON D.location_id = L.location_id
  LEFT JOIN  countries C 
  ON L.country_id = C.country_id
  order by 1;  -- 행의 갯수가 107 개   
  
  
  
    ---- *** [!!!입사문제!!!] 필수!!!! 아래와 같이 나오도록 하세요 *** ----
  /*
      salary 가 6000 이상인 사원들에 대해서만
      부서번호  부서명  부서도시명  사원번호  사원명  기본급여 가 나오도록 하세요.
  */
    
  select E.department_id AS 부서번호
             ,D.department_name AS 부서명 
             ,L. location_id  AS 부서도시명
             ,E.employee_id AS 사원번호
             ,E.first_name || ' ' || E.last_name AS 사원명
             ,E.salary 기본급여
  from(
                select *
                from employees
                where salary >= 6000
          ) E
          LEFT JOIN  departments D
          ON E.department_id = D.department_id
          LEFT JOIN  locations L
          ON D.location_id = L.location_id
  order by 1;
  
  
  
  
           -------- ****  NON-EQUI JOIN  **** --------
  --> 조인조건절에 사용되어지는 컬럼의 값이 같다 같지않다 가 아니라
  --  특정범위에 속할때 사용되어지는 JOIN 이다.
  
  -- 소득세율 지표 관련 테이블을 생성한다. 
  create table tbl_taxindex
  (lowerincome   number       -- 연봉의 최저
  ,highincome    number       -- 연봉의 최대
  ,taxpercent    number(2,2)  -- 세율  -0.99 ~ 0.99 
  );

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(1, 99999, 0.02);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(100000, 149999, 0.05);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(150000, 199999, 0.08);

  insert into tbl_taxindex(lowerincome,highincome,taxpercent)
  values(200000, 10000000000000000, 0.1);

  commit;
  
  select *
  from tbl_taxindex;
  
  
  select * from tab;
  
  
  /*
     ----------------------------------------------
      사원번호  사원명   연봉     연소득세율   연소득세액
     ----------------------------------------------- 
      +++++++++++++++++++++     ########
                employees                       tbl_taxindex 
  */
  
  select E.employee_id as 사원번호
             ,E.ename as 사원명
             ,E.yearsal as 연봉
             ,T.taxpercent as 연소득세율
             ,E.yearsal * T.taxpercent as 연소득세액
  from (select employee_id
                        , first_name || ' ' || last_name as ENAME
                        , nvl(salary+(salary*commission_pct), salary) *12 as YEARSAL
              from employees)  E  join  tbl_taxindex T
  on E.YEARSAL between T.lowerincome and T.highincome
  order by 1;
  
  
  
  
              ------ *** SELF JOIN(자기조인) *** -------
  자기자신의 테이블(뷰)를 자기자신의 테이블(뷰)과 JOIN 시키는 것을 말한다.
  이때 반드시 테이블(뷰)에 대한 alias를 달리 주어서 실행해야 한다. 

  select *
  from employees
  order by 1;        
 /* 
    --------------------------------------------------------------------------------------------------------------------------
      사원번호                   사원명                       급여    직속상관사원번호   직속상관명
    -------------------------------------------------------------------------------------------------------------------------- 
     employee_id   first_name || last_name   salary    employee_id      first_name || last_name 
     .........................................................................................................................................................
     102                         Lex De Haan               17000	       100	             Steven King          
     104                         Bruce Ernst                  6000           103              Alexander Hunold
     .........................................................................................................................................................

 */ 
 select *
 from employees E1, employees E2
 where E1.manager_id = E2.employee_id
 order by 1;

 select E1.employee_id as 사원번호
            , E1.first_name || ' ' || E1.last_name as 사원명
            , E1.salary as 급여
            , E2.employee_id as 직속상관사원번호
            , E2.first_name || ' ' || E2.last_name as 직속상관명
 from employees E1, employees E2
 where E1.manager_id = E2.employee_id(+)
 order by 1;
 
-- 이름에 문제 있어서 copy한걸로 다시 업뎃함↓ ㅜ^ㅜ 
  update employees E set last_name = ( select last_name from  EMPLOYEES_COPY where employee_id = E.employee_id);
  
  select *
  from employees;
  
  commit;
  


 -- [퀴즈] --
   create table tbl_authorbook
   (bookname       varchar2(100)
   ,authorname     varchar2(20)
   ,loyalty        number(5)
   );
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('자바프로그래밍','박보배',1000);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','김은혜',800);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('로빈슨크루소','박보배',500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('조선왕조실록','이주명',2500);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','강현민',1200);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','김건형',1300);
   
   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('그리스로마신화','권순근',1700);

   insert into tbl_authorbook(bookname, authorname, loyalty)
   values('어린왕자','최유영',1800);
   
   commit;
   
   select *
   from tbl_authorbook; 
   
   --- tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 것)로 지어진
   --- 도서정보를 나타내세요. (SELF JOIN 을 사용하여 풀이)
/*   
   --------------------------------------------------
      도서명                  작가명   로얄티
   -------------------------------------------------- 
    그리스로마신화	강현민	1200
    그리스로마신화	김건형	1300
    그리스로마신화	권순근	1700
    로빈슨크루소     	김은혜	800
    로빈슨크루소    	박보배   	500
*/
 
----- SQL 1992 CODE 방식 -----
select distinct  
         B1.bookname AS 도서명
        , B1.authorname AS 작가명
        , B1.loyalty AS 로얄티 
from tbl_authorbook B1, tbl_authorbook B2
where B1.bookname = B2.bookname 
         AND
         B1.authorname != B2.authorname
order by 1;


----- SQL 1999 CODE 방식 -----
select distinct  
         B1.bookname AS 도서명
        , B1.authorname AS 작가명
        , B1.loyalty AS 로얄티 
from tbl_authorbook B1 join tbl_authorbook B2
on B1.bookname = B2.bookname 
    AND
    B1.authorname != B2.authorname
order by 1;



--- tbl_authorbook 테이블에서 공저(도서명은 동일하지만 작가명이 다른 것)로 지어진
--- 도서정보를 나타내세요. (group by 를 사용한 Sub Query 를 이용하여 풀이)
/*   
   ------------------------------------------------
      도서명                 작가명   로얄티
   ------------------------------------------------ 
    그리스로마신화	강현민	1200
    그리스로마신화	김건형	1300
    그리스로마신화	권순근	1700
    로빈슨크루소	    김은혜	800
    로빈슨크루소	    박보배	500
*/

select bookname AS 도서명 
        , authorname AS 작가명 
        , loyalty AS 로얄티 
from tbl_authorbook 
where bookname IN( select bookname
                            from tbl_authorbook 
                            group by bookname 
                            having count(*) > 1 )
order by 1;  




        -------- **** Stored View(저장된 뷰) **** ---------
   /*     
    뷰(VIEW)란? 
    - 테이블은 아니지만 SELECT 되어진 결과물이 테이블형태로 보여지기 때문에
      SELECT 문을 마치 테이블 처럼 간주하는 것이다.
      
    => 뷰(VIEW)를 사용하는 목적 
    1. 복잡한 SELECT 문을 간단하게 해서 "재사용" 하기 위해서이다.
    2. 보안목적상 접근할 수 있는 행과 접근할 수 있는 컬럼만
       다른 데이터베이스 사용자에게 SELECT 할 수 있도록 권한을 주기 위함이다.
   */
  
create or replace view view_severance       -- view_severance가 없으면 새로 생성하고 있으면 변경된 내용으로 새로 갈아엎어라
as
select employee_id , 
            ename,
            hire_date,
            age,
            RetirementDate,
            monthsal,
            trunc (  trunc ( months_between (RetirementDate, hire_date) )  /12 * monthsal) as SEVERANCEPAY
FROM 
(
         select employee_id,
                 ename,
                 hire_date,
                 age,
                 last_day (  
                   case  
                        when substr(jubun, 3, 2) between '03' and '08' 
                                then to_char ( add_months(sysdate, (63-age) *12) , 'yyyy-' )
                 else to_char ( add_months(sysdate, (64-age) *12), 'yyyy-' )
                 end 
                 ||
                 case
                    when  substr(jubun, 3, 2) between '03' and '08' 
                            then '08-01'
                            else '02-01'
                 end
                 )
                 as RetirementDate,
                 monthsal         
    FROM
    (
            select employee_id 
                        ,first_name || ' ' || last_name as ENAME
                        ,hire_date
                        ,jubun
                        ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                        ,nvl(salary + (salary * commission_pct), salary) as MONTHSAL
                        from employees
    ) V
) T;   

--View VIEW_SEVERANCE이(가) 생성되었습니다.

select *
from view_severance
where severancepay >= 500000;
--위에 복잡했던 것을 이렇게 간단하게 표현 가능

select *
from view_severance 
where age >= 50;

select * from tab;

desc view_severance;        -- 마치 테이블처럼 보임

drop view view_severance;   --view 삭제

create  view view_severance         -- 그냥 create view로 생성해보기
as
select employee_id , 
            ename,
            hire_date,
            age,
            RetirementDate,
            monthsal,
            trunc (  trunc ( months_between (RetirementDate, hire_date) )  /12 * monthsal) as SEVERANCEPAY
FROM 
(
         select employee_id,
                 ename,
                 hire_date,
                 age,
                 last_day (  
                   case  
                        when substr(jubun, 3, 2) between '03' and '08' 
                                then to_char ( add_months(sysdate, (63-age) *12) , 'yyyy-' )
                 else to_char ( add_months(sysdate, (64-age) *12), 'yyyy-' )
                 end 
                 ||
                 case
                    when  substr(jubun, 3, 2) between '03' and '08' 
                            then '08-01'
                            else '02-01'
                 end
                 )
                 as RetirementDate,
                 monthsal         
    FROM
    (
            select employee_id 
                        ,first_name || ' ' || last_name as ENAME
                        ,hire_date
                        ,jubun
                        ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                        ,nvl(salary + (salary * commission_pct), salary) as MONTHSAL
                        from employees
    ) V
) T;

-- 내용물을 바꾸던지 alias를 바꾸던지 변경 후 그냥 replace 로 업데이트하면 당장 바뀐것처럼 보이지만 select 해보면 변경사항 반영 안됨

select *
from view_severance;

--- *** 생성되어진 view 목록 조회하기 *** ----
select *
from user_views;

--- *** VIEW_SEVERANCE 뷰의 소스(select 문) 조회하기 *** ----
select text
from user_views
where view_name = 'VIEW_SEVERANCE';
/*
"select employee_id , 
            ename,
            hire_date,
            age,
            RetirementDate,
            monthsal,
            trunc (  trunc ( months_between (RetirementDate, hire_date) )  /12 * monthsal) as SEVERANCEPAY
FROM 
(
         select employee_id,
                 ename,
                 hire_date,
                 age,
                 last_day (  
                   case  
                        when substr(jubun, 3, 2) between '03' and '08' 
                                then to_char ( add_months(sysdate, (63-age) *12) , 'yyyy-' )
                 else to_char ( add_months(sysdate, (64-age) *12), 'yyyy-' )
                 end 
                 ||
                 case
                    when  substr(jubun, 3, 2) between '03' and '08' 
                            then '08-01'
                            else '02-01'
                 end
                 )
                 as RetirementDate,
                 monthsal         
    FROM
    (
            select employee_id 
                        ,first_name || ' ' || last_name as ENAME
                        ,hire_date
                        ,jubun
                        ,extract(year from sysdate) -(to_number(substr(jubun, 1,2)) + case when substr(jubun, 7,1) in ('1','2') then 1900 else 2000 end) + 1 as AGE
                        ,nvl(salary + (salary * commission_pct), salary) as MONTHSAL
                        from employees
    ) V
) T"
*/


-- 보안 목적상 접근할 수 있는 행과 접근할 수 있는 컬럼만
-- 다른 데이터베이스 사용자에게 SELECT할 수 있도록 권한 주기  ( 보여주고싶은것만 보여주기 )
create or replace view view_employees
as
select employee_id, first_name, last_name, email, job_id, salary, commission_pct, manager_id, department_id
from employees
where department_id not in (10,20,30);

select *
from view_employees;

grant select on view_employees to scott;    -- scott한테 권한주기

revoke select on view_employees from scott;     -- 권한 다시 회수하기




--- *** VIEW 를 통해서 DML (insert, update, delete)이 가능하다. *** ---
create table tbl_emp01 
as
select employee_id, first_name, last_name, hire_date, salary, department_id
from employees;

select *
from tbl_emp01;

desc tbl_emp01;
desc employees;

drop table tbl_emp01 purge;

create table tbl_member_a
(userid     varchar2(20)
,pwd         varchar2(20) not null
,name      varchar2(40)
,constraint PK_tbl_member_a primary key (userid)
);

insert into tbl_member_a values('less', '1234', '이순신');
insert into tbl_member_a values('yks', 'abcd', '유관순');
commit;

create table tbl_member_b
(userid     varchar2(20) not null       -- 나중에 복사해갈 상황이 있을 수 있기 때문에 primary key를 줬어도 not null을 한번 더 주는 것을 권장
,pwd         varchar2(20) not null
,name      varchar2(40)
,constraint PK_tbl_member_b primary key (userid)
);

insert into tbl_member_b values('hongs', '1234', '홍길동');
commit;


desc tbl_member_a;
/*
이름     널?       유형           
------ -------- ------------ 
USERID NOT NULL VARCHAR2(20)        -->primary key기 때문에 
PWD    NOT NULL VARCHAR2(20) 
NAME            VARCHAR2(40) 
*/

desc tbl_member_b;
/*
이름     널?       유형           
------ -------- ------------ 
USERID NOT NULL VARCHAR2(20) 
PWD    NOT NULL VARCHAR2(20) 
NAME            VARCHAR2(40) 
*/

create table tbl_member_a_copy
as
select *
from tbl_member_a
where 1=2;  -- 데이터 빼고 구조(껍데기)만 가져옴
--Table TBL_MEMBER_A_COPY이(가) 생성되었습니다.


create table tbl_member_b_copy
as
select *
from tbl_member_b
where 1=2;

select *
from user_constraints
where table_name = 'TBL_MEMBER_A';


select *
from user_constraints
where table_name = 'TBL_MEMBER_A_COPY';

desc tbl_member_a_copy;

select *
from user_constraints
where table_name = 'TBL_MEMBER_B';


select *
from user_constraints
where table_name = 'TBL_MEMBER_B_COPY';

desc tbl_member_b_copy;
-- 이상 primary key 에도 not null 써주자 -!


create or replace view view_emp01
as
select *
from tbl_emp01
where department_id in(10,20,30);

select *
from view_emp01;

insert into view_emp01 (employee_id, first_name, last_name, hire_date, salary, department_id)
values (1001, '개똥', '김', sysdate, 5000, 40);
commit;

select *
from view_emp01;
-- 부서번호 10,20,30만 보는거라서 김개똥 안보임. 원본 테이블 가면 있음

select *
from tbl_emp01;
-- 김개똥있음

create or replace view view_emp01
as
select *
from tbl_emp01
where department_id in(10,20,30)
with check option constraint CK_VIEW_EMP01;
-- insert 10,20,30 부서만 가능하게 제약 줘버림

insert into view_emp01 (employee_id, first_name, last_name, hire_date, salary, department_id)
values (1002, '개똥', '김', sysdate, 5000, 40);
--ORA-01402: view WITH CHECK OPTION where-clause violation
-- 오류 
insert into view_emp01 (employee_id, first_name, last_name, hire_date, salary, department_id)
values (1002, '개똥', '김', sysdate, 5000, 30);

select *
from user_constraints
where table_name = 'VIEW_EMP01';




--- *** 읽기전용(select 만 가능한) VIEW 를 생성하려면 WITH READ ONLY 를 사용하여 만든다. *** ---
create or replace view view_emp01
as 
select *
from tbl_emp01
where department_id in (10,20,30)
with read only;


insert into view_emp01 (employee_id, first_name, last_name, hire_date, salary, department_id)
values (1003, '보검', '박', sysdate, 5000, 30);
-- SQL 오류: ORA-42399: cannot perform a DML operation on a read-only view
-- 읽기만 가능 DML 불가능



/*
  === VIEW 생성시 사용하는 create or replace view 는  
          create or replace noforce view 와 같다.
          이것은 VIEW 소스의 원본테이블이 존재할때만 VIEW를 생성해주는 것이다. ===
*/
create or replace noforce view view_emp02 -- create or replace view view_emp01 와 같은 말
as
select *
from tbl_emp02  -- 현재 view_emp02 테이블은 존재하지 않음
where department_id in (10,20,30);
--오류
--00942. 00000 -  "table or view does not exist"



/* 
     === VIEW 생성시 force 를 사용하면 
             VIEW 소스의 원본테이블(또는 원본 VIEW) 의 존재유무와 관계없이
             무조건 VIEW를 생성해준다. === 
*/

create or replace force view view_emp02 
as
select *
from tbl_emp02  -- 현재 view_emp02 테이블은 존재하지 않음
where department_id in (10,20,30);
-- 경고: 컴파일 오류와 함께 뷰가 생성되었습니다.
-- 현재는 없지만 강제로 만들었음


-- *** VIEW 를 통한 INSERT 시 입력되는 데이터는 VIEW 소스의 원본테이블 컬럼의 NOT NULL 여부를 따라간다. *** --  ☆★☆★ 시험출제
create or replace view view_emp03
as 
select employee_id,  first_name, last_name, salary, department_id
from tbl_emp01
where department_id in (10,20,30);

select *
from view_emp03;

desc view_emp03; -- not null 1개
desc tbl_emp01;  -- not null 2개

insert into view_emp03 (employee_id, first_name, last_name, salary, department_id)
values (1008,  '보검', '박', 7000, 10); 
--오류 
--ORA-01400: cannot insert NULL into ("HR"."TBL_EMP01"."HIRE_DATE")
--insert는 원본 테이블의 not null 컬럼 여부를 따라감



-- *** SELECT 문 속에 JOIN 쿼리문이 들어가 있는 VIEW는 VIEW를 통한 DML이 불가하다. *** -- 
create or replace view view_join
as
select E.employee_id, E.first_name, E.last_name, E.email, E.hire_date, E.job_id, E.salary, E.jubun,
            D.department_id, D.department_name
from employees E join departments D
on E.department_id = D.department_id;
--View VIEW_JOIN이(가) 생성되었습니다.
-- not null만 다 넣음

desc employees;
desc departments;

desc view_join;

insert into view_join( employee_id, first_name, last_name, email, hire_date, job_id, salary, jubun,
                                     department_id, department_name )
values( 9001, '봉길', '윤', 'bong@naver.com', sysdate, 'ST_MAN', 9000, '0806211748411', 50, 'shipping' );
--SQL 오류: ORA-01776: cannot modify more than one base table through a join view
--join 된 view는 insert 할 수 없음




          ---- !!!! *** Transaction(트랜잭션) *** !!!! -----    ☆★ 자바와 연동시킬 때 잘 사용하기때문에 아주 중요 !! ☆★
   /*
       Transaction(트랜잭션) 이란?
       -- 어떤 "A" 라는 테이블에 DML(insert, update, delete)가 발생이 되어지면
          "A" 테이블과 연관된 다른 "B" 테이블에도 DML(insert, update, delete)을 발생시켜준다.
          이때 "A" 테이블에 발생한 DML(insert, update, delete) 작업과 
          "B" 테이블에 발생한 DML(insert, update, delete) 작업이 모두 성공했을때에만
          "A" 테이블과 "B" 테이블에 발생한 DML 작업을 모두 COMMIT; 을 해주고
          "A" 테이블에 발생한 DML(insert, update, delete) 작업과 
          "B" 테이블에 발생한 DML(insert, update, delete) 작업중 하나라도 실패를 한다라면
          "A" 테이블과 "B" 테이블에 발생한 DML 작업을 모두 ROLLBACK; 을 해주어야 한다.
          
          이와 같이 여러 테이블에 저장된 데이터값을 변화시키기 위해서 
          수행하는 다양한 DML 작업을 하나의 작업단위로 보는 것(데이터를 처리하는 한 단위)을 Transaction(트랜잭션)이라고 부른다.​
	      즉, 하나의 논리적인 작업단위로써 성공하거나 실패하는 일련의 SQL문(DML)을 말하는 것이다.
   */

   create table tbl_cafe_member 
   (userid     varchar2(20)  not null
   ,passwd     varchar2(20) not null
   ,name       varchar2(20) 
   ,point      number default 0
   ,constraint PK_tbl_cafe_member primary key(userid)
   ,constraint CK_tbl_cafe_member_point check (point < 30)  
   );
   
   insert into tbl_cafe_member(userid, passwd, name)
   values('hongkd','1234','홍길동');
   
   insert into tbl_cafe_member(userid, passwd, name)
   values('leess','1234','이순신');

   commit;


create table tbl_cafe_board
   (boardno     number
   ,fk_userid   varchar2(20)
   ,title       Nvarchar2(10)
   ,contents    Nvarchar2(2000)
   ,registerday date default sysdate
   ,constraint PK_tbl_cafe_board primary key(boardno)
   ,constraint FK_tbl_cafe_board foreign key(fk_userid) 
                                 references tbl_cafe_member(userid)
   );
   
   select *
   from tbl_cafe_board;
   
   
   insert into tbl_cafe_board(boardno, fk_userid, title, contents)
   values(1, 'hongkd', '길동입니다.', '홍길동 입니다. ㅎㅎㅎ 좋은 하루되세요~~');
   -- 1 행 이(가) 삽입되었습니다.
   
   
   update tbl_cafe_member set point = point + 10
   where userid = 'hongkd';
   -- 1 행 이(가) 업데이트되었습니다.
   
   commit;
   
   select *
   from tbl_cafe_member;
   
   
   insert into tbl_cafe_board(boardno, fk_userid, title, contents)
   values(2, 'hongkd', '길동입니다.2', '두번째 홍길동 입니다. ㅎㅎㅎ 좋은 하루되세요~~');
   -- 1 행 이(가) 삽입되었습니다.
   
   
   update tbl_cafe_member set point = point + 10
   where userid = 'hongkd';
   -- 1 행 이(가) 업데이트되었습니다.
   
   commit;
   
   insert into tbl_cafe_board(boardno, fk_userid, title, contents)
   values(3, 'hongkd', '길동입니다.3', '세번째 홍길동 입니다. ㅎㅎㅎ 좋은 하루되세요~~');
   -- 1 행 이(가) 삽입되었습니다.
   
   
   update tbl_cafe_member set point = point + 10
   where userid = 'hongkd';
   -- 1 행 이(가) 업데이트되었습니다.
   
   rollback;
   
   
   --- *** rollback 되어질 구분선을 만들어서 특정 범위까지만 rollback 할 수 있다. *** ---
   
   --- *** tbl_cafe_member  테이블의 컬럼에 있는 default  값 조회하기 *** ---
   select *
   from user_tables
   where table_name = 'TBL_CAFE_MEMBER';
   
   select *
   from dictionary
   where lower(comments) like '%column%';
   
   select *
   from user_tab_columns
   where table_name = 'TBL_CAFE_MEMBER';
   
   
   select column_name, data_default
   from user_tab_columns
   where table_name = 'TBL_CAFE_MEMBER';
   
   --- TBL_CAFE_MEMBER 테이블의 POINT 칼럼의 default를 10으로 변경하기
   alter table tbl_cafe_member
   modify point default 10;
  
    --- TBL_CAFE_MEMBER 테이블의 POINT 칼럼의 default 제거하기   
    alter table tbl_cafe_member
    modify point default null;
    
   --- TBL_CAFE_MEMBER 테이블의 POINT 칼럼의 default를 0으로 변경하기
   alter table tbl_cafe_member
   modify point default 0;    
   
   
   insert into tbl_cafe_member(userid, passwd, name)
   values('hongkd01','1234','홍길동');
   
   savepoint hongkd02;
   --Savepoint이(가) 생성되었습니다.

   insert into tbl_cafe_member(userid, passwd, name)
   values('hongkd02','1234','홍길동2');
   
   
   insert into tbl_cafe_member(userid, passwd, name)
   values('hongkd03','1234','홍길동3');
   
   
   select *
   from tbl_cafe_member;
   
   rollback to hongkd02; -- savepoint hongkd02까지만 롤백해주겠다.
   
   select *
   from tbl_cafe_member;
   -- 홍길동1까지만 나옴
   
   rollback; -- commit한 이후로 변경된 모든 것은 rollback 하겠다.
   
   select *
   from tbl_cafe_member;    
   
   
   
   
   
   
   
   
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   --                                                                     ===     ****          PL/SQL         ****    ===
   --                                                                     PL :    Procedure Language
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   --- 사용자가 정의하는 함수를 만들어 봅니다.
   create or replace function func_gender
   (p_jubun    in  varchar2 ) 
   -- ▲ 변수        ▲ varchar2(20) 이런 자리수 적어주면 꽝 !!!!!!
   return varchar2
   --           ▲ 여기도 자리수 적으면 오류 !
   is
   v_genderNum varchar2(1);      -- is 와 begin 사이는 변수를 선언하는 부분이다.
   --                       ▲ 여기는 자리수 꼭 적어줘야 함 !
   v_gender          varchar2(10);
   begin
           v_genderNum := substr(p_jubun,7,1);      -- begin과 end 사이는 본문(내용물)이 들어가는 부분이다.
           -- 변수에                   위 값을 넣어줌
   /*
       if           조건1 then 실행문장1;
       elsif      조건2 then 실행문장2;
       else                          실행문장3;
       end if;
   */
            if v_genderNum in ('1', '3') then v_gender := '남';   
            else v_gender := '여';
            end if;
            
            return v_gender;
   end func_gender;     -- 또는 end;
   
   
   select employee_id, first_name || ' ' || last_name as ENAME,
                jubun, func_gender(jubun) as GENDER,
                func_age(jubun) as AGE
   from employees;
   
   
   
   
   create or replace function func_gender
   (p_jubun    in  varchar2 ) 
   return varchar2
   is
   v_genderNum varchar2(1);   
   v_gender         varchar2(10);
   begin
           v_genderNum := substr(p_jubun,7,1);      
            if v_genderNum in ('1', '3') then v_gender := '남';   
            else v_gender := '여';
            end if;
            
            return v_gender;
   end func_gender;    
   -- Function FUNC_GENDER이(가) 컴파일되었습니다.
   
   select func_gender('9708252110141'), func_gender('01024514939')
   from dual;
   -- 여  남
   
   create or replace function func_gender2
   (p_jubun    in  varchar2 ) 
   return varchar2
   is
            v_gender    varchar2(10); 
   begin
            select case when substr(p_jubun, 7, 1)  in ('2','4')    then '여'
                         else '남'
                         end
                         into v_gender
            from dual;
            
            return v_gender;
   end func_gender2;    
   -- Function FUNC_GENDER2이(가) 컴파일되었습니다.

   select func_gender2('9708252110141'), func_gender('9708251110141')
   from dual;
   -- 여  남
   
  create or replace function func_age
  (p_jubun IN varchar2)        
  return varchar2              
  is
     v_genderNum  varchar2(1);
     v_birthYear  number(4);
  begin
        v_genderNum := substr(p_jubun,7,1);  	-- 주민번호 성별 받아옴
        v_birthYear := to_number(substr(p_jubun,1,2));	     -- 주민번호 생년 받아옴
      
        if v_genderNum in('1','2') then v_birthYear := v_birthYear + 1900;
        else v_birthYear := v_birthYear + 2000;
        end if;
        
        return extract(year from sysdate) - v_birthYear + 1;
  end func_age;
  -- Function FUNC_AGE이(가) 컴파일되었습니다.
  
  select func_age('9504052234567'), func_age('0105203234567')
  from dual;
  
  
  create or replace function func_age2
  (p_jubun IN varchar2)        
  return varchar2              
  is
     v_age number(3);
  begin
        select extract(year from sysdate) - 
               ( to_number(substr(p_jubun,1,2)) +  
                 case when substr(p_jubun, 7, 1) in('1','2') then 1900
                 else 2000
                 end ) + 1 
               INTO
                v_age  
        from dual;
        
        return v_age;
  end func_age2;
  -- Function FUNC_AGE2이(가) 컴파일되었습니다.
  
  select func_age2('9504052234567'), func_age2('0105203234567')
  from dual;
   
   select employee_id, first_name || ' ' || last_name as ENAME,
                jubun, func_gender(jubun) as GENDER,
                func_gender2(jubun) as GENDER2,
                func_age(jubun) as AGE
   from employees;
   
    
    
    
    
   
   
   
   --04/07
   --------------------------------------------------------------------------------
  ---- *** 오라클 퀴즈 *** ----
--------------------------------------------------------------------------------
create table tbl_loan
(gejanum        varchar2(10)   -- 통장번호
,loanmoney      number         -- 대출금
,interestrate   number(2,2)    -- 이자율
,paymentdate    varchar2(2)    -- 이자를내는날짜 '01', '05', '10', '15' '25', 매월말일은 '00' 으로 입력함.
);           

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-01', 5000, 0.03, '01');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-02', 5000, 0.03, '05');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-03', 5000, 0.03, '10');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-04', 5000, 0.03, '15');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-05', 5000, 0.03, '25');

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
values('10-1234-06', 5000, 0.03, '00');

commit;

select *
from tbl_loan;

select gejanum, loanmoney, interestrate, paymentdate
     , decode(paymentdate, '00', last_day( add_months(sysdate, -1) )
                               , to_date( to_char( add_months(sysdate, -1), 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
              ) AS "저번달이자상환일자"    
from tbl_loan
where paymentdate = '00';


select T.gejanum AS 계좌번호
     , T.loanmoney AS 대출금
     , T.interestrate AS 이자율
     , T.paymentdate AS 이자상환지정일자
     , T.BEFORE_MONTHDAY AS 전달이자상환일
     , decode( to_char(T.BEFORE_MONTHDAY, 'd'), '1', T.BEFORE_MONTHDAY+1
                                              , '7', T.BEFORE_MONTHDAY+2
                                                   , T.BEFORE_MONTHDAY)
       AS 실제전달이자상환일                                            
     , T.THIS_MONTHDAY AS 이번달이자상환일
     , decode( to_char(T.THIS_MONTHDAY, 'd'),  '1', T.THIS_MONTHDAY+1
                                              , '7', T.THIS_MONTHDAY+2
                                                   , T.THIS_MONTHDAY)
       AS 실제이번달이자상환일                                             
from
(
    select gejanum, loanmoney, interestrate, paymentdate
    
         , case when to_char(beforemonthday, 'mmdd') in ('0301','0505','0606','0815','1003','1225')
                then beforemonthday+1
                else beforemonthday
           end AS BEFORE_MONTHDAY  
           
         , case when to_char(thismonthday, 'mmdd') in ('0301','0505','0606','0815','1003','1225')
                then thismonthday+1
                else thismonthday
           end AS THIS_MONTHDAY  
    
    from 
    (
        select gejanum, loanmoney, interestrate, paymentdate
             , decode(paymentdate, '00', last_day( add_months(sysdate, -1) )
                                       , to_date( to_char( add_months(sysdate, -1), 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
                      ) AS BEFOREMONTHDAY 
             , decode(paymentdate, '00', last_day(sysdate)
                                       , to_date( to_char(sysdate, 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
                      ) AS THISMONTHDAY          
        from tbl_loan
    ) V 
) T;


select T.gejanum AS 계좌번호
     , T.loanmoney AS 대출금
     , T.interestrate AS 이자율
     , T.paymentdate AS 이자상환지정일자 
     , decode( to_char(T.THIS_MONTHDAY, 'd'), '1', T.THIS_MONTHDAY+1
                                            , '7', T.THIS_MONTHDAY+2
                                                 , T.THIS_MONTHDAY)
       AS 이번달이자상환일 
     ,( decode( to_char(T.THIS_MONTHDAY, 'd'), '1', T.THIS_MONTHDAY+1
                                             , '7', T.THIS_MONTHDAY+2
                                                  , T.THIS_MONTHDAY) 
      - decode( to_char(T.BEFORE_MONTHDAY, 'd'), '1', T.BEFORE_MONTHDAY+1
                                               , '7', T.BEFORE_MONTHDAY+2
                                                    , T.BEFORE_MONTHDAY) ) * (T.loanmoney*T.interestrate/12) 
       AS 이번달이자금액        
from
(
    select gejanum, loanmoney, interestrate, paymentdate
    
         , case when to_char(beforemonthday, 'mmdd') in ('0301','0505','0606','0815','1003','1225')
                then beforemonthday+1
                else beforemonthday
           end AS BEFORE_MONTHDAY  
           
         , case when to_char(thismonthday, 'mmdd') in ('0301','0505','0606','0815','1003','1225')
                then thismonthday+1
                else thismonthday
           end AS THIS_MONTHDAY  
    
    from 
    (
        select gejanum, loanmoney, interestrate, paymentdate
             , decode(paymentdate, '00', last_day( add_months(sysdate, -1) )
                                       , to_date( to_char( add_months(sysdate, -1), 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
                      ) AS BEFOREMONTHDAY 
             , decode(paymentdate, '00', last_day(sysdate)
                                       , to_date( to_char(sysdate, 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
                      ) AS THISMONTHDAY          
        from tbl_loan
    ) V 
) T;


select T.gejanum, T.loanmoney, T.interestrate, T.paymentdate

     , decode( to_char(T.REALCURRENTDAY, 'd'),  '1', T.REALCURRENTDAY+1
                                              , '7', T.REALCURRENTDAY+2
                                                   , T.REALCURRENTDAY) AS "이번달이자지급날짜"
                                                   
     ,( decode( to_char(T.REALCURRENTDAY, 'd'), '1', T.REALCURRENTDAY+1
                                              , '7', T.REALCURRENTDAY+2
                                                   , T.REALCURRENTDAY) 
      - decode( to_char(T.REALPREVIOUSDAY, 'd'), '1', T.REALPREVIOUSDAY+1
                                               , '7', T.REALPREVIOUSDAY+2
                                                    , T.REALPREVIOUSDAY) ) * (T.loanmoney*T.interestrate/12) AS "이번달이자금액"                                         
from
(
    select gejanum, loanmoney, interestrate, paymentdate
    
         , case when to_char(previousday, 'mmdd') in ('0301','0505','0606','0815','1003','1225')
                then previousday+1
                else previousday
           end AS REALPREVIOUSDAY  
           
         , case when to_char(currentday, 'mmdd') in ('0301','0505','0606','0815','1003','1225')
                then currentday+1
                else currentday
           end AS REALCURRENTDAY  
    
    from 
    (
        select gejanum, loanmoney, interestrate, paymentdate
             , decode(paymentdate, '00', last_day( add_months(sysdate, -1) )
                                       , to_date( to_char( add_months(sysdate, -1), 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
                      ) AS PREVIOUSDAY 
             , decode(paymentdate, '00', last_day(sysdate)
                                       , to_date( to_char(sysdate, 'yyyy-mm-') || paymentdate, 'yyyy-mm-dd')
                      ) AS CURRENTDAY          
        from tbl_loan
    ) V 
) T;

