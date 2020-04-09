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
