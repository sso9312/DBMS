��nvl () �Լ� -null���� �ٸ������� �ٲ�

����) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select max(kor), count(*)
from sungjuk
where addr='Incheon';       --�ִ밪(null), �ο���(0)

select count(*)+1           --0+1
from sungjuk
where addr='Incheon'; 

select max(kor)+1           --null+1 ->null���� ������ �� ����
from sungjuk
where addr='Incheon'; 

--null���̸� 0���� ��ü��
select nvl(max(kor), 0)           
from sungjuk
where addr='Incheon'; 

select nvl(max(kor), 0)+1           
from sungjuk
where addr='Incheon'; 

select nvl(max(kor), 0)+1 as max_kor           
from sungjuk
where addr='Incheon'; 
////////////////////////////////////////////////////////////

select * from sungjuk order by sno desc;

����) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�
sno : max(sno) + 1
      ��, max()���� null�̸� 0���� �ٲ��� ����Ѵ�
uname : �����
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate

--1) snoĮ������ ���� ū�� ��������
select max(sno) from sungjuk;

--2)���� 1)����� null�� ������ 0���� �ٲٱ�
select nvl(max(sno), 0) from sungjuk;

--3) 2)����� +1 �����ϱ�
select nvl(max(sno), 0)+1 from sungjuk;

--4) ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno), 0)+1 from sungjuk), '�����', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk order by sno desc;
commit;