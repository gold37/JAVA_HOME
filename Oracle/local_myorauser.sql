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

alter table jdbc_member
add constraint CK_jdbc_member_point check(point < 30) ;


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
and pwd = '12';

select * from user_sequences;

select *
from jdbc_board
order by boardno desc;

delete from jdbc_board;

commit;


------ 글번호  글제목  글쓴이  작성일자  조회수
         ---------  ----------  #####   -------------   ----------
         jdbc_board        jdbc_member

select A.boardno as 글번호
          , A.subject as 글제목
          , B.name as 글쓴이
          ,to_char( A.writeday,'yyyy-mm-dd hh24:mi:ss')  as 작성일자
          , A.viewcount  as 조회수
from jdbc_board  A  join  jdbc_member B
on A.fk_userid = B.userid
order by 1 desc; -- 최근 글 먼저 보이게

String sql =  "select A.boardno as 글번호\n"+
                        "          , A.subject as 글제목\n"+
                        "          , B.name as 글쓴이\n"+
                        "          ,to_char( A.writeday,'yyyy-mm-dd hh24:mi:ss')  as 작성일자\n"+
                        "          , A.viewcount  as 조회수\n"+
                        "from jdbc_board  A  join  jdbc_member B\n"+
                        "on A.fk_userid = B.userid\n"+
                        "order by 1 desc";


select contents as 글내용 , fk_userid as 작성자ID
from jdbc_board
where boardno = 9;

update jdbc_board set viewcount = +1

rollback;


    ----- /// 댓글 테이블 생성하기 /// -----
create table jdbc_comment 
( commentno         number                not null         -- 댓글번호
, fk_boardno          number                not null         -- 원글의 글번호
, fk_userid              varchar2(30)       not null         -- 사용자ID
, contents             varchar2(200)     not null         -- 댓글내용
, writeday               date default sysdate                  -- 작성일자
, constraint  PK_jdbc_comment  primary key(commentno)
, constraint  FK_jdbc_comment_fk_boardno   foreign key(fk_boardno) references jdbc_board(boardno) on delete cascade
                                                                                                                                                                                    -- ▲ 원글이 없어지면 댓글도 없어져야 하기 때문에
, constraint FK_jdbc_comment_fk_userid foreign key (fk_userid) references jdbc_member(userid)
);

create sequence seq_comment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from jdbc_comment;

select fk_boardno, count(*) as COMMENTcnt
from jdbc_comment
group by fk_boardno; -- 원글 댓글끼리 묶음


select  B.boardno, b.subject, M.name
         ,    to_char(B.writeday, 'yyyy-mm-dd hh24:mi:ss') as writeday
         ,    B.viewcount
         ,    nvl(C.COMMENTCNT, 0) as COMMENTCNT
from jdbc_board B JOIN jdbc_member M
on B.fk_userid = M.userid
LEFT JOIN ( select fk_boardno, count(*) as COMMENTCNT
                                                          from jdbc_comment
                                                          group by fk_boardno ) C
on B.boardno = c.fk_boardno
order by 1 desc;


select C.contents as 내용
        ,   M.name as 작성자
        ,   to_char(C.writeday , 'yyyy-mm-dd hh24:mi:ss') as 작성일자
from jdbc_member M JOIN   jdbc_comment C
on M.userid = C.fk_userid
where C.fk_boardno = 9


select *
from jdbc_member;
select *
from jdbc_board;
select *
from jdbc_comment;


insert into jdbc_board (boardno, fk_userid, subject, contents, boardpwd)
values (board_seq.nextval, 'test', '인절미아몬드', '다음엔 불닭맛 먹어야지', '1234');

insert into jdbc_board (boardno, fk_userid, subject, contents, boardpwd)
values (board_seq.nextval, 'jiwon', '젤리', '코코넛맛', '1234');

insert into jdbc_board (boardno, fk_userid, subject, contents, boardpwd)
values (board_seq.nextval, 'jiwon', '구운감자', '오독오독오도독', '1234');


commit;

update jdbc_board set writeday = writeday - 10
where boardno = 9;

update jdbc_board set writeday = to_date('2020-04-09 14:20:30', 'yyyy-mm-dd hh24:mi:ss')
where boardno = 16;

update jdbc_board set writeday = to_date('2020-04-11 13:17:10', 'yyyy-mm-dd hh24:mi:ss')
where boardno = 26;

update jdbc_board set writeday = to_date('2020-04-14 17:30:10', 'yyyy-mm-dd hh24:mi:ss')
where boardno = 11;

update jdbc_board set writeday = to_date('2020-04-15 17:30:10', 'yyyy-mm-dd hh24:mi:ss')
where boardno = 27;



--- 최근 일주일간 일자별 게시글 작성건수
select  to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
            ,sysdate - to_date ('2020-04-16 ', 'yyyy-mm-dd')
            ,sysdate - to_date ('2020-04-16 ', 'yyyy-mm-dd' ) 
            ,sysdate - to_date ('2020-04-16 ', 'yyyy-mm-dd' )
from dual;


select  to_char(sysdate, 'yyyy-mm-dd')
            ,to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')  - to_date ('2020-04-16 ', 'yyyy-mm-dd')
            ,to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')  - to_date ('2020-04-16 ', 'yyyy-mm-dd' ) 
            ,to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')  - to_date ('2020-04-16 ', 'yyyy-mm-dd' )
from dual;

select boardno
          , to_char(writeday, 'yyyy-mm-dd hh24:mi:ss')
          , to_char(writeday, 'yyyy-mm-dd')
          , sysdate - writeday
          , to_date (to_char(sysdate , 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(writeday, 'yyyy-mm-dd'), 'yyyy-mm-dd')
from jdbc_board
order by 1 asc;


create or replace function func_midnight
(p_date IN date)
return date
is
begin
    return to_date(to_char(p_date, 'yyyy-mm-dd'), 'yyyy-mm-dd');
end func_midnight;


select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
        ,    to_char(  func_midnight(sysdate), 'yyyy-mm-dd hh24:mi:ss')
from dual;


select boardno
          , to_char(writeday, 'yyyy-mm-dd hh24:mi:ss')
          , to_char(func_midnight(writeday), 'yyyy-mm-dd hh24:mi:ss')
          , sysdate - writeday
          , func_midnight(sysdate) - func_midnight(writeday)
from jdbc_board
order by 1 asc;


select  boardno as 글번호
           , to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as 현재시각
           , to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') as 작성시각
           , sysdate - writeday
from jdbc_board
order by 1 asc;
where sysdate - writeday  < 7;

select *
from jdbc_board
where func_midnight( sysdate ) -  func_midnight( writeday ) < 7
order by boardno asc;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TOTAL    PREVIOUS7   PREVIOUS6   PREVIOUS5   PREVIOUS4   PREVIOUS3   PREVIOUS2   PREVIOUS1   TODAY        
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        5                   0                        0                       1                        0                       0                       1                        1                  2
  
select  COUNT(*) as TOTAL

            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 6, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS6
            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 5, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS5
            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 4, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS4
            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 3, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS3
            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 2, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS2
            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate - 1, 'yyyy-mm-dd' ), 1, 0)) as  PREVIOUS1
            , SUM (DECODE (to_char(writeday, 'yyyy-mm-dd'), to_char (sysdate, 'yyyy-mm-dd' ), 1, 0)) as  TODAY
from jdbc_board
where  func_midnight( sysdate ) -  func_midnight( writeday ) < 7;

select distinct name
from user_source
where type =  'FUNCTION';

update jdbc_board set writeday = add_months(writeday, -1)
where boardno = 27;
commit;

select *
from jdbc_board;

select text
from user_source
where type = 'FUNCTION'  and name = 'FUNC_MIDNIGHT';    


---- *** jdbc_board 테이블에서 이번달 데이터만 모두 출력하세요 *** ----
select *
from jdbc_board
where to_char(writeday, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm');


---- *** jdbc_board 테이블에서 이번달 데이터만 모두 출력하세요 *** ----
select decode (grouping ( to_char(writeday, 'yyyymmdd')),0, to_char(writeday, 'yyyymmdd'), '전체') as 날짜 -- grouping은 항상 0과 1밖에 안나옴. 0은 실제 데이터, 1은 null 값
          , count(*) as 작성건수
from jdbc_board
where to_char(writeday, 'yyyymm') = to_char(sysdate, 'yyyymm')
group by rollup ( to_char(writeday, 'yyyymmdd'));

select *
from jdbc_member;
