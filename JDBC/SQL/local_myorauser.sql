show user;
-- USER이(가) "MYORAUSER"입니다.

select *
from tab;

select *
from user_sequences;

select *
from jdbc_tbl_memo;

select no, name, msg, to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') as writeday
from jdbc_tbl_memo
order by no desc;  -- 블럭 잡아서 오른쪽 마우스 클릭 포함/표시 누르면 java문으로 바꿔줌

select no, name, msg, to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') as writeday
from jdbc_tbl_memo
where msg like '%' || '지원' || '%';

update jdbc_tbl_memo set msg = '테스트입니다'
where no = 1;

delete from jdbc_tbl_memo
where no = 1;

rollback;

select *
from jdbc_tbl_memo2;


select *
from jdbc_tbl_memo2
where to_char(no) = '2';


select *
from user_tables
where table_name = 'JDBC_TBL_MEMO2';

select *
from user_sequences;

drop table JDBC_TBL_MEMO2 purge;
drop sequence JDBC_SEQ_MEMO2;

commit;





    ----- /// 회원 테이블 생성하기 /// -----
drop table jdbc_member purge;    
    
create table jdbc_member
( userseq          number            not null               -- 회원번호
, userid             varchar2(30)    not null               -- 회원아이디
, pwd                 varchar2(30)    not null               -- 회원암호
, name              varchar2(20)    not null               --회원명
, mobile             varchar2(25)                                 -- 연락처
, point               number(10)     default 0              -- 포인트
, registerday     date                   default sysdate   -- 가입일자
, status              number(1)        default 1        -- status 컬럼의 값이 1이면 정상, 0이면 탈퇴로 보겠음
, constraint PK_jdbc_member primary key (userseq)
, constraint UK_jdbc_member unique (userid)
, constraint CK_jdbc_member check ( status in (0,1) )
);


create sequence user_seq 
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



    ----- /// 게시판 테이블 생성하기 /// -----
create table jdbc_board
( boardno             number                      not null                        -- 글번호
, fk_userid            varchar2(30)             not null                        -- 작성자 아이디
, subject                varchar2(100)           not null                       -- 글제목
, contents            varchar2(200)           not null                       -- 글내용
, writeday              date   default sysdate not null                     -- 작성일자
, viewcount            number default 0 not null                            -- 조회수
, boardpwd            varchar2(20)         not null                            -- 글 암호
, constraint PK_jdbc_board primary key (boardno)
, constraint FK_jdbc_board foreign key (fk_userid) references jdbc_member(userid)
);


create sequence board_seq 
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from jdbc_member
order by userseq desc;

select *
from jdbc_member
where status = 1
and userid = 'less'
and pwd = '12'