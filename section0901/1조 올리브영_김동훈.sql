create table gift_card( --����Ʈī�� ���� ���̺�
    gj_code varchar2(20)    not null
    ,gj_name varchar2(100)  not null
    ,gj_image varchar2(50)  not null
    ,primary key(gj_code)
);

drop table gift_card;

select * from gift_card; -- ��

insert into gift_card(gj_code, gj_name, gj_image)
values('gg001','�����ϴ�(2023)', '�����ϴ�(2023)�̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('gl002','������������', '�������������̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('go003','���� �ø���', '���� �ø����̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('go004','�����ִ� �ø���', '�����ִ� �ø����̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('gg005','���ο� ������ ������', '���ο� ������ �������̹���');

select * from gift_card;
////////////////////////////////////////////////////////////////////////////////

create table big_category_table( --�� ī�װ� ��ǰ���̺�
    product_category    varchar2(15)
    ,product_catename   varchar2(20)
    ,product_name	    varchar2(150)
    ,product_image	    varchar2(50)
    ,primary key(product_category)
);

drop table big_category_table;

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s001','��Ų�ɾ�','�츣���� ���ο� 200ml 2�� �� 1','�츣�����̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s002','��Ų�ɾ�','[�̴�Ÿ������] �긵�׸� ƼƮ����ī������� ��뷮������ȹ','�긵�׸��̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m001','����ũ��','[NEW] �Ҿ� ��� ������ ƾƮ','�Ҿ��̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m002','����ũ��','Ŭ���� ���� �� ���� ���������� �潽���̳�','Ŭ�����̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n001','����','[NEW] ����Ʈ �÷� ���� 19�� 14ml','����Ʈ�̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n002','����','[NEW] ����� �÷� �۸��� ���� ������ 7��','������̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p001','���/��ǻ��','������ �긮Ʈ���� EDT 3�� ��1 (30ml/50ml/100ml)','�������̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p002','���/��ǻ��','���ٹ��佺 ��Ƽ�� EDT 40ml/75ml/125ml ��ǰ 3�� ��1','���ٹ��佺�̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c001','Ŭ��¡','�丮�� ���̺��� ������ ���˷�л� Ŭ��¡ �� 150ml','�丮���̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c002','Ŭ��¡','[��뷮] ���左 1025 ���� Ŭ���� 200ml �����ȹ','���左�̹���');

select * from big_category_table;

drop table big_category_table;

////////////////////////////////////////////////////////////////////////////////

create table detailed_category_table( -- �� ��ǰ ���̺�
    detailed_procode    varchar2(20)    not null
    ,product_category   varchar2(15)    not null
    ,option_name        varchar2(100)   not null
    ,product_price      number(10)      not null
    ,discount           number(2)       not null
    ,primary key (detailed_procode)
);

drop table detailed_category_table cascade constraints;

drop table detailed_category_table;

-- �ܷ�Ű ����
alter table detailed_category_table
add constraints fk_detailed_category_table foreign key (product_category)
references big_category_table(product_category);


insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0011','s001','��Ų��ũ200ml',23700,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0022','s002','500ml+����Ÿ��',45000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('om0021','m002','001��',10000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('on0012','n001','16�� ����',15000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0021','c001','200ml',20000,20);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0022','c002','500ml',45000,30);

select * from detailed_category_table;
////////////////////////////////////////////////////////////////////////////////

create table Inventory_table( --�����Ȳ ���̺�
    detailed_procode    varchar2(20)
    ,Inventory_date     date       
    ,restock            number(4)
    ,restock_shipment   varchar2(6)
);

drop table Inventory_table;

-- �ܷ�Ű ����
alter table Inventory_table
add constraints fk_Inventory_table foreign key(detailed_procode)
references detailed_category_table(detailed_procode);

delete Inventory_table
where detailed_procode='os0011';

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,3,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,1,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,2,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,1,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,1,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,1,'���');

select detailed_procode,to_char(Inventory_date,'YYYY-MM-DD'),restock,restock_shipment
from Inventory_table;



