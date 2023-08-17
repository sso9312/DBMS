--���� ����� : ctrl+enter
--���̺� ����
create table sungjuk (
	uname varchar(20)
	,kor int
	,eng int
	,mat int
	,aver int
);

-- ���̺� ����
drop table sungjuk;

�� [sungjuk ���̺� CRUD �۾�]

1.���߰� (create)
insert into sungjuk (uname, kor, eng, mat)
values ('����ȭ', 80, 85, 100);

insert into sungjuk (uname, kor, eng, mat)
values ('ȫ�浿', 90, 100, 50);

2.��ȸ �� �˻� (Read)
select uname, kor, eng, mat, aver
from sungjuk;

3.����� (Update)
update sungjuk
set aver=(kor+eng+mat)/3;

4.����� (Delete)
delete from sungjuk; 
