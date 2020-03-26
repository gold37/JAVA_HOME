show user;
-- USER이(가) "SAMPLEUSER3"입니다.

    
    --- *** 테이블 생성시 tablespace system을 명기하지 않으면 어떤 tablespace에 저장될까?
    select default_tablespace
    from user_users;        -- USERS
    
        
    ----------- *** sys로부터 부여받은 시스템권한(System Privilege)이 무엇인지 조회한다. *** ------------- 
    select *
    from user_sys_privs;
    /*
    CREATE SESSION
    --> 테이블 만들 수 없음
    */