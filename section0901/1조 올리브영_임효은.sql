�� ���� ���̺� �߰�

create table notice_table(
    notice_code     varchar2(10)    not null     --����������ȣ
   ,notice_num      number(30)      not null     --������ȣ
   ,notice_class    varchar2(10)    not null     --�����з�
   ,notice_name     varchar2(100)   not null     --��������
   ,notice_content  varchar2(200)   not null     --��������
   ,notice_date     date            not null     --�����ۼ���
);

drop table notice_table;


���� �� �߰�
insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong001','1', '�Ϲ�','���̽��ǽ� ���� �� �������Ա� �������� �ߴ� �ȳ�','�ø��꿵 �������Ա� �������� �ߴ�','2023-08-31');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev001','2','�̺�Ʈ','7�� <��������Ʈ �׷��� ����> �̺�Ʈ �װ��� ��÷�� ��ǥ','��÷�� dor*****��*��8940','2023-07-28');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('me001','3','����','������ �˸��ϴ�!!','���� ���ΰ������Դϴ�','2023-07-25');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev002','4','�̺�Ʈ','���� 50% Ư��!!','���̸���ũ����ǰ Ư��','2023-06-30');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong002','5','�Ϲ�','���� �̿�� ����ũ ���� �ǰ�~!','����ũ ���� ��Ź�帳�ϴ�','2023-05-01');


select * from notice_table;


select notice_code �ڵ�, notice_num ��ȣ, notice_class �з�, notice_name ����, notice_content ����, notice_date �ۼ���
from notice_table
order by notice_num, notice_date desc;

----------------------------------------------------------------------------
�� ���� ���̺� 

drop table review_table;

create table review_table(
    oid         varchar2(30)       not null   --�����̵�(FK)
   ,review_content     varchar2(200)      not null   --���䳻��  
   ,starjum            number(5)          not null   --����
   ,review_date        date               not null   --�ۼ�����
   ,detailed_procode   varchar2(20)       not null  --�󼼻�ǰ�ڵ�(FK)
   --,foreign key(review_oid) references ocus(oid)
   --,foreign key(detailed_procode) references detailed_category_table(detailed_procode) 
);


���� �� �߰�

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill1','�ʹ� ���ƿ�!','5','2023-08-31','os0011');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill2','�����̿���','3','2023-07-22','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','���ƿ�!','4','2023-07-14','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','���ο���!','1','2023-06-26','oc0021');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','�ʹ� ���ƿ�!','5','2023-05-17','oc0022');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','�����̿���!','3','2023-05-17','os0022');


select * from review_table;

select review_oid ��ID, review_content ����, starjum ��, review_date �ۼ�����, detailed_procode �󼼻�ǰ�ڵ�
from review_table
order by review_date desc;

--�ܷ�Ű ����
--�� ID
alter table review_table
add constraints fk_review_oid foreign key(oid)
references ocus(oid);

--��ǰ�ڵ�
alter table review_table
add constraints fk_detailed_procode foreign key(detailed_procode)
references detailed_category_table(detailed_procode);


----------------------------------------------------------------------------

drop table opur;

�� ���Ź�ǰ��ϳ��� ���̺� �߰�

create table opur(
    purchase_code       number(11)             --�ֹ���ȣ
   ,detailed_procode    varchar2(50)           --�󼼻�ǰ�ڵ�
   ,oquantity           number(10)             --��ǰ����
   ,foreign key(purchase_code) references purlist_table(purchase_code)
   --,foreign key(detailed_procode) references detailed_category_table(detailed_procode)
);


insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000001','os0011','3');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000002','on0021','2');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000003','on0012','1');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000003','oc0021','1');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000004','oc0022','1');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000004','os0022','1');

select * from opur;

--------------------------------------------------------------------------
�� ���ų��� ���̺� �߰�

drop table purlist_table;

create table purlist_table(
    purchase_code       number(11)       --�ֹ���ȣ
   ,oid                 varchar2(30)     --��ID
   ,receive_name        varchar2(20)     --�޴� ��
   ,phone_number        varchar2(13)     --�޴� �� ��ȭ��ȣ
   ,address             varchar2(100)    --�����
   ,message             varchar2(100)    --��۸޼���
   ,payment_method      varchar2(15)     --�������
   ,payment_gift        varchar2(30)     --����Ʈī��ID
   ,payment_coupon      varchar(4)       --���� ���    
   ,payment_point       number(10)       --����Ʈ ���
   ,total               number(10)       --�� ���� �ݾ�
   ,primary key(purchase_code)
   --,foreign key(oid) references ocus(oid)   
   --,foreign key(payment_gift) references giftcard_object(gcid)
);

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000001','itwill1','�赿��','010-1111-2222','����� ���Ǳ� ��õ�� 111-23','���տ� ���ּ���','ī��','gci002',null,'0','21330');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000002','itwill2','��ҿ�','010-1234-5678','����� ���Ǳ� ��õ�� 111-24','��ȭ�ּ���','�������',null,null,'0','32000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000003','itwill3','������','010-1122-3344','����� ���Ǳ� ��õ�� 111-25','���� ��й�ȣ1234','������ü',null,null,'0','27000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000004','itwill4','��ȿ��','010-1235-6819','����� ���Ǳ� ��õ�� 111-26','������ ������~','īī������',null,null,'0','52200');
    

select * from purlist_table;


select purchase_code �ֹ���ȣ, oid ��ID, receive_name  �޴º�, phone_number �޴º���ȭ��ȣ, address �����, message ��۸޼���, payment_method �������, payment_gift ����Ʈī��ID
        ,payment_coupon �������, payment_point ����Ʈ���, total �Ѱ����ݾ�
    from purlist_table;

