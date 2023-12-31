--실행 단축기 : ctrl+enter
--테이블 생성
create table sungjuk (
	uname varchar(20)
	,kor int
	,eng int
	,mat int
	,aver int
);

-- 테이블 삭제
drop table sungjuk;

● [sungjuk 테이블 CRUD 작업]

1.행추가 (create)
insert into sungjuk (uname, kor, eng, mat)
values ('무궁화', 80, 85, 100);

insert into sungjuk (uname, kor, eng, mat)
values ('홍길동', 90, 100, 50);

2.조회 및 검색 (Read)
select uname, kor, eng, mat, aver
from sungjuk;

3.행수정 (Update)
update sungjuk
set aver=(kor+eng+mat)/3;

4.행삭제 (Delete)
delete from sungjuk; 
