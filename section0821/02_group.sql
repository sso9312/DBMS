--sungjuk���̺� ����
drop table sungjuk;

--sungjuk���̺� ����
create table sungjuk (
    sno int primary key                  
    ,uname varchar(50) not null
    ,kor int check(kor between 0 and 100)--�������� 0~100���̸� �Է°���
    ,eng int check(eng between 0 and 100)--�������� 0~100���̸� �Է°���
    ,mat int check(mat between 0 and 100)--�������� 0~100���̸� �Է°���
    ,addr varchar(50) check(addr in('Seoul','Jeju','Busan','Suwon'))
    ,tot int    default 0
    ,aver int   default 0
    ,wdate date default sysdate
    );

--sungjuk���̺� ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'����Ƽ��', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);

    
--sungjuk ���̺��� ����� ������ ����
create sequence sungjuk_seq;
--sungjuk_seq ������ ����
drop sequence sungjuk_seq;

--sungjuk���̺� �Է� ������
���� E:\java202307\database\section0818\06_�������̺�.sql

commit;
select count(*) from sungjuk; --��ü ���ڵ� ����
select * from sungjuk;
////////////////////////////////////////////////////

��[������ �׷�ȭ]

select * from sungjuk order by addr; --�ּ�����

��[distinct]
-Į���� �ߺ� ������ ������ ��ǥ�� 1���� ���
-����) distinct Į����

select addr from sungjuk;
select addr from sungjuk order by addr; --asc��������
select addr from sungjuk order by addr asc; 
select addr from sungjuk order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;
////////////////////////////////////////////////

�� [group by]
- Į���� ���� ���볢�� �׷�ȭ ��Ŵ
- ����) group by Į��1, Į��2, Į��3, ~~

--�ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr
from sungjuk
group by addr; --distinct�� ����� ����

--ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
--00979. 00000 -  "not a GROUP BY expression"
select addr, uname --�׷��Ű�� ���ü� �ִ� ���� 1���� ������ ���� ��ȸ
from sungjuk
group by addr;

select addr, uname from sungjuk order by addr;
///////////////////////////////////////////////

��[�����Լ�]
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor) --����, �ִ밪, �ּҰ�, �հ�, ���
from sungjuk
group by addr;

--��1) �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt --Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt --as ��������
from sungjuk
group by addr;

--�ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr; --asc ��������

--�ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr desc; 

--�ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt    --�ؼ����� 3)
from sungjuk                    --�ؼ����� 1)
group by addr                   --�ؼ����� 2)
order by count(*) desc;         --�ؼ����� 4)

--��2) �ּҺ� ���������� ���ؼ� �����ؼ� �ּҼ����� �����ؼ� ��ȸ�Ͻÿ�
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)
from sungjuk                  
group by addr                  
order by addr; 

--round(��, 0) �Ҽ��� ���ϰ����� �ݿø��ϰ� �Ҽ����� ����
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk                  
group by addr                  
order by addr; 

--��������� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk                  
group by addr                  
order by round(avg(kor), 0) desc;

--Į���� �ο�
select addr
    , count(*) as cnt
    , max(kor) as max_kor
    , min(kor) as min_kor
    , sum(kor) as sum_kor
    , round(avg(kor), 0) as avg_kor
from sungjuk
group by addr;

-- �������� ��հ��� ������������ ��ȸ
select addr
    , count(*) as cnt
    , max(kor) as max_kor
    , min(kor) as min_kor
    , sum(kor) as sum_kor
    , round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
order by avg_kor desc;

--��3) ����(tot), ���(aver) ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
commit;
select * from sungjuk order by aver desc, addr;
--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��������� ��ȸ�Ͻÿ�
select addr
from sungjuk
where aver>=80
group by addr;

select addr, count(*)
from sungjuk
where aver>=80
group by addr;

select addr, count(*)   --4)
from sungjuk            --1)
where aver>=80          --2)
group by addr           --3)
order by count(*);      --5)
//////////////////////////////////////////////////

�� [2���׷�]

--�ּҺ� ������ ��ȸ�Ͻÿ�
select uname, addr, kor, eng, mat
from sungjuk
order by addr, kor;

--�ּҺ�(1��) �׷��� �ϰ�, �ּҰ� ���ٸ� ��������(2��)�� �׷�ȭ�ϱ�
select addr, kor
from sungjuk
group by addr, kor
order by addr;

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

--1���׷�(kor), 2���׷�(eng), 3���׷�(mat)
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;


