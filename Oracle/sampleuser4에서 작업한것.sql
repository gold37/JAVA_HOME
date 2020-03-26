show user;

    
    ----------- *** sys로부터 부여받은 시스템권한(System Privilege)이 무엇인지 조회한다. *** ------------- 
    select *
    from user_sys_privs;
    /*
    아무것도 안나옴
    role을 부여받았기때문에 오라클 접속이 가능
    */
    
    
     ----------- *** sys로부터 부여받은 ROLE이 무엇인지 조회한다. *** ------------- 
     select *
     from user_role_privs;
     /*
     TEST_ROLE
     */
     
    ----------- *** 부여받은 TEST_ROLE에게 부여되어진 시스템 권한(System Privilege)이 무엇인지 조회한다. *** -------------      
    select *
    from role_sys_privs
    where role = 'TEST_ROLE';
    /*
    CREATE SESSION
    CREATE TABLE
    UNLIMITED TABLESPACE    --> 대충 할당량은 무제한이라는 뜻
    */
    
    
    
     ----------- *** 자기자신(sampleuser1)에게 부여되어진 할당량(quota)이 얼마인지 조회하기 *** ------------- 
     select *
     from user_ts_quotas;
     /*
     없음
     */
     
     create table mytbl_1(
     name           varchar2(20)
     ,mobile         number(11)
     );        --> USERS
     
     insert into mytbl_1(name, mobile) values ('홍길동', 01087427001);
     commit;
     select *
     from mytbl_1; 
     -- 폰번호 맨 앞 0이 빠져서 나옴
     
     create table mytbl_2(
     name           varchar2(20)
     ,mobile         varchar2(11)
     ) tablespace system;       --> SYSTEM
     
     insert into mytbl_2(name, mobile) values ('김개똥', 01080217001);  --> '홑따옴표' 안쓰면 또 0 빠짐
     insert into mytbl_2(name, mobile) values ('김말똥', '01021443545');
     commit;
     select *
     from mytbl_2;
     
     
     create table mytbl_3(
     name           varchar2(20)
     ,mobile         varchar2(11)
     ,addr             varchar2(50)
     ) tablespace users;
     
     select *
     from user_tables;
     
     
     
     
     
     
     
     