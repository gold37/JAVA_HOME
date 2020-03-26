show user;

create table tbl_student(
hakbun      varchar2(20)
,name       varchar2(20)
);

--오류 보고 -
--ORA-01950: no privileges on tablespace 'SYSTEM'
-->system 테이블 스페이스를 사용할 수 있는 할당량(quota)이 없다라는 말

--> sys에서 작업한 후 이제 실행 됨

insert into tbl_student (hakbun, name) values('16001', '알파카');
commit;

select*
from tbl_student;

-- tmi > 테이블을 생성하면 8 block(1 block == 8kb 이므로 8 block == 64kb) 만큼 소모한다.


create table tbl_student2(
hakbun      varchar2(20)
,name       varchar2(20)
);

create table tbl_student3(
hakbun      varchar2(20)
,name       varchar2(20)
) tablespace system;


     ----------- *** 자기자신(sampleuser1)에게 부여되어진 할당량(quota)이 얼마인지 조회하기 *** ------------- 
     select *
     from user_ts_quotas;
     
     select 64*1024*1024    from dual;      -- 67108864 byte == 64m


    ----------- *** 생성되어진 테이블 정보 조회하기 *** ------------- 
    select *
    from user_tables;
    
    select table_name, tablespace_name
    from user_tables;
    
    --- *** 테이블 생성시 tablespace system을 명기하지 않으면 어떤 tablespace에 저장될까?
    select default_tablespace
    from user_users;        -- SYSTEM
    
    create table tbl_student4(
    hakbun      varchar2(20)
    ,name       varchar2(20)
    ) tablespace users;        -- tbl_student4 테이블은 users 테이블 스페이스에 저장하겠다.

    --오류 보고 
    --ORA-01950: no privileges on tablespace 'USERS'
    --01950. 00000 -  "no privileges on tablespace '%s'"
    
--> sys에서 작업한 후 이제 실행 됨


    
    
    
    ----------- *** sys로부터 부여받은 시스템권한(System Privilege)이 무엇인지 조회한다. *** ------------- 
    select *
    from user_sys_privs;
    /*
    CREATE SESSION
    CREATE TABLE
    */

    
    select *
    from sampleuser1.tbl_student;
    -- 소유주명.테이블명
    select *
    from tbl_student;
    --> 소유주 이름을 생략하면 자기거를 본다

    --** hr에 있는 employees가 보고싶다
    select *
    from hr.employees;
    --ORA-00942: table or view does not exist
    --00942. 00000 -  "table or view does not exist"
    --> hr.employees 테이블을 select 할 수 있는 권한이 없기 때문에 테이블이 없다고 에러가 뜬다. (없는게 아니라 안보이는거임)
    
     ----------- *** Synonym (동의어) *** ------------- 
     create synonym emp for hr.employees;
     --오류 보고 -
    --ORA-01031: insufficient privileges
    --01031. 00000 -  "insufficient privileges"
    --> synonoym 만들 수 있는 권한이 없다. 
    --> sys가서 권한 받아오기 출동!
    
    select *
    from hr.employees;
    
    select *
    from emp;
    
    

