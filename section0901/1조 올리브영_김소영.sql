create table ocus(                       --���������̺�(��ҿ�)
   oid      varchar2(30)    
  ,oname    varchar2(50)
  ,opass    number(10)
  ,ocall    varchar2(15)
  ,obirth   date
  ,oemail   varchar2(50)
  ,opoint   number(10)
  ,oaddr    varchar2(100)
  ,ovip     varchar2(10)
  ,primary key(oid)
);

insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill1', '�赿��', 123456, '010-1111-2222', '1993-10-04', 'itwill1@gmail.com', 10, '����� ���Ǳ� ��õ�� 111-23', 'gold');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill2', '��ҿ�', 123457, '010-1111-2223', '1993-10-05', 'itwill2@gmail.com', 20, '����� ���Ǳ� ��õ�� 111-24', 'baby');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill3', '������', 123458, '010-1111-2224', '1993-10-06', 'itwill3@gmail.com', 30, '����� ���Ǳ� ��õ�� 111-25', 'black');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill4', '��ȿ��', 123459, '010-1111-2225', '1993-10-07', 'itwill4@gmail.com', 40, '����� ���Ǳ� ��õ�� 111-26', 'pink');
commit;

select count(*) from ocus;   --���������̺� Ȯ��
select * from ocus;
drop table ocus;


create table ocp_table(                --�������� ���̺�(��ҿ�)
   ocp      varchar2(15)    
  ,ocpname    varchar2(30)
  ,ocpdc    varchar2(30)
  ,ocpcon    number
  ,ocpst   date
  ,ocpend   date
  ,primary key(ocp)
);

insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp001', '�������� ����', '10% ����', 10000, '2023-08-31', '2023-09-06' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp002', '�ű԰����� ����', '30% ����', 10000, '2023-08-30', '2024-09-30' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp003', 'VIP ����', '20% ����', 10000, '2023-08-31', '2024-08-31' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp004', '5000�� ���� ����', '5000�� ����', 50000, '2023-08-30', '2024-08-30' );
commit;

select count(*) from ocp_table; --�������� ���̺� Ȯ��
select * from ocp_table;
drop table ocp_table;

create table ocpman(                --�������� ���̺�(��ҿ�)
   oid varchar2(30)
  ,ocp varchar2(15)
  ,ocpus char(1)
  ,FOREIGN KEY (oid) --�ܷ�Ű���� ���� 1
  REFERENCES ocus(oid)
);

alter table ocpman   --�ܷ�Ű �߰� ������Ʈ�ϴ¹�� 2
add constraints fk_ocpman foreign key(ocp)
references ocp_table(ocp);

insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp001', 'Y');
insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill2', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp003', 'N');
commit;

select count(*) from ocpman; --�������� ���̺� Ȯ��
select * from ocpman;
drop table ocpman;

create table ovipinfo(                       --����������� ���̺�(��ҿ�)
   ovip     varchar2(30)    
  ,ovipcon  varchar2(100)
  ,ovippo   varchar2(15)
  ,primary key(ovip)
);

insert into ovipinfo(ovip,ovipcon,ovippo) values('gold', '100�����̻�', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('black', '70�����̻� 100�����̸�', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('green', '40�����̻� 70�����̸�', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('pink', '10�����̻� 40�����̸�', '0.50%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('baby', '10�����̸�', '0.50%');
commit;

select count(*) from ovipinfo; --����������� ���̺� Ȯ��
select * from ovipinfo;
drop table ovipinfo;