show user;

-- 현재 오라클 서버에 존재하는 모든 오라클계정을 조회해본다.
select *
from dba_users;

alter user hr account unlock;

-- 샘플계정 HR에게 새로운 암호 eclass를 주겠다.
alter user hr IDENTIFIED by eclass;



