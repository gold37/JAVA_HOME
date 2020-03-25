show user;

-- 현재 오라클 서버에 존재하는 모든 오라클계정을 조회해본다.
select *
from dba_users;

alter user hr account unlock;

-- 샘플계정 HR에게 새로운 암호 eclass를 주겠다.
alter user hr IDENTIFIED by eclass;



     ----------- *** 오라클 사용자 생성 및 관리 *** ------------- 
     create user sampleuser1 identified by eclass;
     create user sampleuser2 identified by eclass;
     
     grant create session to sampleuser1;
     -- sampleuser1 에게 create session (오라클 서버에 접속할 수 있는 권한) 권한을 부여한다.
     
     grant create table to sampleuser1;
     -- sampleuser1 에게 create session (테이블을 생성할 수 있는 권한) 권한을 부여한다.
     
     select *
     from dba_users        -- 모든 오라클 사용자 계정 정보를 조회하는 것
     where username = 'SAMPLEUSER1';
     
     select default_tablespace
     from dba_users        
     where username = 'SAMPLEUSER1';
     --> SYSTEM  => SAMPLEUSER1계정이 어떤 테이블을 생성하면 그 테이블은 SYSTEM 테이블 스페이스에 저장된다.
     
     select *
     from dba_data_files;
     /*
        file_name                                                                                                                             tablespace_name
       ---------------------------------------------------------------------------------------------------------------------------------------------------------
       C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF                                          SYSTEM
       
     */
     
     alter user sampleuser1 quota 64m on system;
     --> sampleuser1에게 system 테이블 스페이스에서 64m(메가바이트) 만큼 사용가능하도록 할당량을 준 것이다.

     alter user sampleuser1 quota unlimited on users;
     --> sampleuser1에게 users 테이블 스페이스에서 사용 가능한 할당량을 무한대로 준것이다.
     