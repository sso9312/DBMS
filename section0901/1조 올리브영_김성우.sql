----�� �������̺�
--create table ocus(
--		oid varchar2(30) NOT NULL,
--		oname varchar2(50) NOT NULL,
--		opass number(10) NOT NULL,
--		ocall number(15),
--		obirth date NOT NULL,
--		oemail varchar2(50) NOT NULL,
--		opoint number(10) NOT NULL,
--		oaddr varchar2(100) NOT NULL,
--		ovip varchar2(10) NOT NULL,
--		primary key(oid)
--);
--
--insert into ocus(oid, oname, opass, obirth, oemail, opoint, oaddr, ovip)
--values('c001', '������', 0819, '1997-08-19', '3723578@naver.com', 100, '���빮 �����µ�', 'gold');
--
--insert into ocus(oid, oname, opass, obirth, oemail, opoint, oaddr, ovip)
--values('c002', '�Լ���', 0820, '1997-08-20', '3723579@naver.com', 200, '���빮 �ϰ��µ�', 'silver');
--
select * from ocus;

drop table ocus;

drop table ocus cascade constraints;

--����Ʈī�� �������̺�
create table giftcard(
		gcid varchar2(20) NOT NULL,
		gcname varchar2(100) NOT NULL,
		gcimage varchar2(50) NOT NULL,
		primary key(gcid)
);

insert into giftcard(gcid, gcname, gcimage)
values('gc001', '����ؿ�', '����ؿ�.jpg');

select * from giftcard;

drop table giftcard;

--����Ʈī�� �������̺�
create table giftcard_object(
		gcoid varchar2(30) NOT NULL,
		gcid varchar2(30) NOT NULL,
		gcamount number NOT NULL,
		primary key(gcoid),
		foreign key(gcid) references giftcard(gcid)
		ON DELETE cascade
		);
		
insert into giftcard_object(gcoid, gcid, gcamount)
values('gco001', 'gc001', 30000);

update giftcard set gcid = 'gc002' where gcid = 'gc001'; 		
select * from giftcard_object;

select * from giftcard_object;

drop table giftcard_object;

--����Ʈī�� ���ų���
create table giftcard_purchase_history(
		oid varchar2(30) NOT NULL,
		gcoid varchar2(30) NOT NULL,
		primary key(oid),
		foreign key(oid) references ocus(oid)
		ON DELETE cascade,
		foreign key(gcoid) references giftcard_object(gcoid)
		ON DELETE cascade
		);
		
insert into giftcard_purchase_history(oid, gcoid)
values('c001', 'gco001');

select * from giftcard_purchase_history;

--����Ʈī�� ��뿩��
create table giftcard_use(
		gcoid varchar2(30) NOT NULL,
		oid varchar2(30) NOT NULL,
		gcuse char(1) NOT NULL check(gcuse in('Y', 'N')),
		primary key(gcoid, oid),
		foreign key(gcoid) references giftcard_object(gcoid),
		foreign key(oid) references ocus(oid)
		on delete cascade
		);
        
		
insert into giftcard_use(gcoid, oid, gcuse)
values('gco001', 'c002' ,'N');

select * from giftcard_use;

drop table giftcard_use;
		
--����Ʈī�� ����Ʈ ��Ȳ
create table giftcardpoint_cur(
		oid varchar2(30) NOT NULL,
		gcpoint number NOT NULL,
		primary key(oid),
		foreign key(oid) references ocus(oid)
		on delete cascade
);

insert into giftcardpoint_cur(oid, gcpoint)
values('itwill1', 1000);

select * from giftcardpoint_cur;

drop table giftcardpoint_cur;
