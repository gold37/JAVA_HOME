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






                ----------------- *** 테이블 생성하기 ***---------------------
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
        select 컬럼명1, 컬럼명2, ...      --⑤
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