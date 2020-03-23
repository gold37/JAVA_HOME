show user;

-- 현재 오라클 서버에 접속한 사용자 (SCOTT) 소유의 모든 테이블 및 뷰 목록 조회하기
select * from tab;

select *
from dept; -- 부서 테이블

select *
from emp; -- 사원 테이블

 -- 테이블의 구조 확인
desc emp;  
describe dept;
desc bonus;
desc salgrade;

purge recyclebin; -- 휴지통에 버리기