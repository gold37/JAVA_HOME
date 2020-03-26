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
     
     create user sampleuser3 identified by eclass
     default tablespace users;                                                  --3.26
         
     grant create session to sampleuser1;
     -- sampleuser1 에게 create session (오라클 서버에 접속할 수 있는 권한) 권한을 부여한다.
     
     grant create table to sampleuser1;
     -- sampleuser1 에게 create session (테이블을 생성할 수 있는 권한) 권한을 부여한다.
     
     grant create session to sampleuser3;     
     
     
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
     
     
     
     --3.26
     ----------- *** 데이터가 저장될 파일 (즉, tablespace)를  만들어보자 *** -------------      
     -- 1. 탐색기에 파일 한개 생성 ( ex) myoradata )
     create tablespace tbs_mytest_a
     datafile 'C:\myoradata\tbs_mytest_a_01.dbf' size 10m -- 데이터베이스는 먼저 크기를 만든 다음에 그 속에 집어넣음 그래서 size 정해줘야 됨
     extent management local -- extent를 누가 관리 해줄 것인가?
     segment space management auto; --  extend 와 segment는 DBA가 알아서 처리하니까 깊게 몰라도 됨
     --> AUTOEXTENSIBLE ==> NO 확장 X
     /*
        TBS_MYTEST_A 테이블스페이스는 파일크기가 10mb인 테이블스페이스로서
         extent management local은 오라클서버가 알아서 관리해주겠다는 말이고 
         segment space management auto은 오라클서버가 알아서 자동으로 관리해주겠다는 말이다.
        
        extent : segment의 할당크기 ( 1extent == 8block , 1block == 8kb, 1extent == 64kb )
        segment : 테이블과 인덱스를 가리키는 오라클의 논리적인 이름이다.

     */
     
     
     create tablespace tbs_mytest_b
     datafile 'C:\myoradata\tbs_mytest_b_01.dbf' size 10m
     autoextend on next 2 m maxsize 200m
     extent management local 
     segment space management auto;
     --> AUTOEXTENSIBLE ==> YES 확장 O 
     /*
        TBS_MYTEST_B 테이블스페이스의 초기 파일크기는 10mb인 테이블스페이스로서
        10mb를 다 사용하면 그 다음엔 2mb가 자동으로 증가돼 사용된다. 즉, 12mb가 된다.
        12mb도 다 사용한다면 그 다음번에는 오라클 서버가 알아서 자동으로 그 크기를 관리하고 처리해주는데 최대 크기는 200mb인 테이블스페이스를 생성한다.
     */
     
     create tablespace tbs_mytest_c
     datafile 'C:\myoradata\tbs_mytest_c_01.dbf' size 10m
     autoextend on 
     extent management local 
     segment space management auto;    
     /*
        TBS_MYTEST_C 테이블스페이스의 초기 파일크기는 10mb인 테이블스페이스로서
        10mb를 다 사용하면 그 다음번에는 오라클 서버가 알아서 자동으로 그 크기를 관리하고 처리해주는데 최대 크기도 오라클 서버가 알아서 잡아주는 테이블스페이스를 생성한다.
     */     
     
     
     create tablespace tbs_mytest_d
     datafile 'C:\myoradata\tbs_mytest_d_01.dbf' size 10m
     autoextend on maxsize 200m
     extent management local 
     segment space management auto;    
     /*
        TBS_MYTEST_D 테이블스페이스의 초기 파일크기는 10mb인 테이블스페이스로서
        10mb를 다 사용하면 그 다음번에는 오라클 서버가 알아서 자동으로 그 크기를 관리하고 처리해주는데 최대 크기는 200mb인 테이블스페이스를 생성한다.
     */          
     
     
     -- 대용량일때 영화처럼 잘라서 보관 ==> 성능에 효과를 줄 수 있음
     create tablespace tbs_mytest_e
     datafile 
         'C:\myoradata\tbs_mytest_e_01.dbf' size 10m autoextend on maxsize 200m
        ,'C:\myoradata\tbs_mytest_e_02.dbf' size 10m autoextend on maxsize 200m
        ,'C:\myoradata\tbs_mytest_e_03.dbf' size 10m autoextend on maxsize 200m
     extent management local 
     segment space management auto;    
/*
    TBS_MYTEST_E 테이블스페이스의 초기 파일크기는 30mb인 테이블스페이스로서
    30mb를 모두 사용하면 그 다음번에는 오라클 서버가 알아서 자동으로 크기가 증가되는데
    증가되는 최대크기는 총 600mb인 테이블스페이스를 만든다.
    또한 TBS_MYTEST_E 테이블스페이스에 저장되는 테이블들은
    'C:\myoradata\tbs_mytest_e_01.dbf'과  'C:\myoradata\tbs_mytest_e_02.dbf'파일과 'C:\myoradata\tbs_mytest_e_03.dbf파일에 분산돼 저장되므로 
    디스크 IO 부하를 적게기에 성능의 향상을 도모하게 된다. 일반적으로 대용량 테이블스페이스 생성에서 사용되는것이다.
*/
     
     create tablespace tbs_mytest_f
     datafile 
         'C:\myoradata\tbs_mytest_f_01.dbf' size 10m autoextend on
        ,'C:\myoradata\tbs_mytest_f_02.dbf' size 10m autoextend on
        ,'C:\myoradata\tbs_mytest_f_03.dbf' size 10m autoextend on
     extent management local 
     segment space management auto;    
     
     
     
     

     ----------- *** 데이터가 저장될 파일 (즉, tablespace)를  삭제해보자 *** -------------           
     --※ 주의 ※ 절대로 탐색기에서 파일을 삭제하면 안된다 오라클이 다 깨져버리는 순간을 맛볼 수 있다.
     select *
     from dba_data_files;
     
     drop tablespace TBS_MYTEST_F;
     --> 오라클에서는 지워졌는데 탐색기엔 dbf 파일이 그대로 남아있음. 여기서 먼저 지웠으면 이제 탐색기거 삭제하면 됨
     
     drop tablespace TBS_MYTEST_E including contents and datafiles;
     --> 오라클이랑 탐색기 동시에 삭제됨(주로 이걸 씀)
     
     drop tablespace TBS_MYTEST_A including contents and datafiles;
     drop tablespace TBS_MYTEST_B including contents and datafiles;
     drop tablespace TBS_MYTEST_C including contents and datafiles;
     drop tablespace TBS_MYTEST_D including contents and datafiles;
     -- clean ~
     
     
     
     create user sampleuser4 identified by eclass
     default tablespace users;
     -- 1. create session 권한 주기 (오라클 접속 권한)
     -- 2. create table (테이블 만들기 권한)
     -- 3. 모든 테이블스페이스에 대해 무제한 할당량 (테이블 또 만들기 권한)
     -- 어제는 하나하나줬는데 이제 전부 그룹화시켜서 모든 애들한테 권한 다 줄거야 => role
     
     
     ----------- *** ROLE (역할) *** ------------- 
     -- ROLE(역할) 이란?
     -- 시스템권한(System Privilege)들의 묶음을 말한다.
     create role test_role;
     
     grant create session
              , create table
              , unlimited tablespace  -- 모든 테이블스페이스에 무제한 할당량 주기
      to test_role;
      
      grant test_role to sampleuser4;

      grant unlimited tablespace to sampleuser4;
      
      
        ----------- *** 오라클 사용자 삭제하기 *** ------------- 
        select *
        from dba_users;
        
        drop user sampleuser2;  
        
        drop user sampleuser3;
        --오류 보고 -
        --ORA-01940: cannot drop a user that is currently connected
        --01940. 00000 -  "cannot drop a user that is currently connected"
        --> 대충 현재 사용 중이기 때문에 삭제 불가하다는 말
        --> 접속 끊은 후 다시 삭제하면 됨
        
        drop user sampleuser4;
        --오류 보고 -
        --ORA-01922: CASCADE must be specified to drop 'SAMPLEUSER4'
        --01922. 00000 -  "CASCADE must be specified to drop '%s'"
        --> 얘는 접속 끊어도 삭제안됨 왜냐하면 create table하면서 생성된 오브젝트(테이블, 인덱스, 프로시저 등)가 있기때문에!
        --> 삭제하고싶으면 오브젝트를 삭제하면 됨
        drop user sampleuser4 cascade;
        --> cascade를 쓰면 먼저 모든 오브젝트들을 삭제하고나서 계정을 삭제한다.
        
        
        ----------- *** 일반적으로 오라클 계정 생성은 아래와 같이 한다. (법칙 아님 일반적으로!) *** ------------- 
        create user sampleuser5 identified by eclass
        default tablespace users;
                                        -- ▲ 관리자계정 sys가 아님 다른 계정있으면 그거 써도됨
        grant connect, resource to sampleuser5; --> 테이블 권한
        grant unlimited tablespace to sampleuser5; --> 할당량 권한
        
        
        
        grant create synonym to sampleuser1;        --> sampleyser1에게 동의어 (synonym)을 생성할 수 있도록 권한을 부여함