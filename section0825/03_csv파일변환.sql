��[ CSV ����]
- ��� �����Ͱ� , �� ���еǾ� �ִ� ����


��[ CSV ������ �����ͺ��̽��� ��������]
- �������������� https://data.go.kr/ Ȱ��
///////////////////////////////////////////////////////////

��1) ���θ� �����ȣ ���̺� �����ϱ�

--1) zipdoro.csv �غ�(258267)


--2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����
create table zipdoro (
    zipno char(5)                       --�����ȣ
    ,zipaddress varchar2(4000)         --�ּ�
    );

drop table zipdoro; --���̺� ����

--3) ��������� ��������
        - zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
        - zipdoro ���̺� ��Ŭ�� -> export       (��������)
        
--4) ��ü �� ���� ��ȸ�ϱ�
select count(*) from zipdoro;
//////////////////////////////////////////////////////////////

��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)
create table school (
    schoolno char(100)                  --�б� ID
    ,schoolname varchar2(100)           --�б� �̸�
    ,schoolclass varchar2(100)           --�б��ޱ���
    ,schooladdress varchar2(4000)      --�б��ּ�
    ,schoolbirth date                  --�������� (���� YYYY-MM-DD)
    ,schoolre    date                  --�������� (���� YYYY-MM-DD)
    ,schoolwe number                 --����
    ,schoolk number                 --�浵
    );


create table school (
    schoolid    varchar2(10)   --�б�ID
  , schoolname  varchar2(255)  --�б���
  , schoolgubun varchar2(20)   --�б��ޱ���
  , schooladdr  varchar2(2000) --���������θ��ּ�
  , cdate       date           --�������� (���� YYYY-MM-DD)
  , udate       date           --�������� (���� YYYY-MM-DD)
  , latitude    number(20,10)  --����
  , longitude   number(20,10)  --�浵
); --�����


drop table school; --���̺� ����

--3) ��������� ��������
        - school ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
        - school ���̺� ��Ŭ�� -> export       (��������)
        
--4) ��ü �� ���� ��ȸ�ϱ�
commit;
select count(*) from school;
select * from school;

/////////////////////////////////////////

--����1) ����ִ� ��(null)�� ã���ÿ�


--����2) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�

