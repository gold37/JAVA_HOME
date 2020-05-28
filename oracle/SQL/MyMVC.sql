show user;
-- USER이(가) "MYORAUSER"입니다.

-- /memberRegister.do 를 했을때 회원가입을 위한 테이블 생성 

create table mymvc_member
(userid     varchar2(20) not null
,passwd     varchar2(20) not null
,name       varchar2(20) not null
,email      varchar2(50) not null
,gender     varchar2(1) not null -- M 또는 F
,interest   varchar2(80) 
,registerday date default sysdate -- RR/MM/DD  to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
,constraint PK_mymvc_member primary key(userid)
,constraint UQ_mymvc_member_email unique(email) -- 이메일은 고유해야함
);


select *
from mymvc_member;



select userid, name, email, gender, interest,
       to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
from mymvc_member
where userid = 'Superman';

select userid, name, email, gender, interest,
       to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
from mymvc_member
order by registerday desc;

