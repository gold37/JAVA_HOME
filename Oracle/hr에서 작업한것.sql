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
     
     ----------- *** Synonym (동의어) *** ------------- 