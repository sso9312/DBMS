create table gift_card( --기프트카드 종류 테이블
    gj_code varchar2(20)    not null
    ,gj_name varchar2(100)  not null
    ,gj_image varchar2(50)  not null
    ,primary key(gj_code)
);

drop table gift_card;

select * from gift_card; -- ㅇ

insert into gift_card(gj_code, gj_name, gj_image)
values('gg001','고맙습니다(2023)', '고맙습니다(2023)이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('gl002','여행을떠나요', '여행을떠나요이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('go003','나는 올리브', '나는 올리브이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('go004','생기있는 올리브', '생기있는 올리브이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('gg005','새로운 시작을 응원해', '새로운 시작을 응원해이미지');

select * from gift_card;
////////////////////////////////////////////////////////////////////////////////

create table big_category_table( --빅 카테고리 상품테이블
    product_category    varchar2(15)
    ,product_catename   varchar2(20)
    ,product_name	    varchar2(150)
    ,product_image	    varchar2(50)
    ,primary key(product_category)
);

drop table big_category_table;

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s001','스킨케어','우르오스 올인원 200ml 2종 택 1','우르오스이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s002','스킨케어','[미니타월증정] 브링그린 티트리시카수딩토너 대용량증정기획','브링그린이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m001','메이크업','[NEW] 롬앤 쥬시 래스팅 틴트','롬앤이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m002','메이크업','클리오 샤프 쏘 심플 워터프루프 펜슬라이너','클리오이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n001','네일','[NEW] 르멘트 컬러 네일 19종 14ml','르멘트이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n002','네일','[NEW] 팁토우 시럽 글리터 네일 폴리쉬 7종','팁토우이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p001','향수/디퓨저','버버리 브리트쉬어 EDT 3종 택1 (30ml/50ml/100ml)','버버리이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p002','향수/디퓨저','존바바토스 아티산 EDT 40ml/75ml/125ml 단품 3종 택1','존바바토스이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c001','클렌징','토리든 다이브인 저분자 히알루론산 클렌징 폼 150ml','토리든이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c002','클렌징','[대용량] 라운드랩 1025 독도 클렌저 200ml 더블기획','라운드랩이미지');

select * from big_category_table;

drop table big_category_table;

////////////////////////////////////////////////////////////////////////////////

create table detailed_category_table( -- 상세 상품 테이블
    detailed_procode    varchar2(20)    not null
    ,product_category   varchar2(15)    not null
    ,option_name        varchar2(100)   not null
    ,product_price      number(10)      not null
    ,discount           number(2)       not null
    ,primary key (detailed_procode)
);

drop table detailed_category_table cascade constraints;

drop table detailed_category_table;

-- 외래키 설정
alter table detailed_category_table
add constraints fk_detailed_category_table foreign key (product_category)
references big_category_table(product_category);


insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0011','s001','스킨밀크200ml',23700,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0022','s002','500ml+순멸타월',45000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('om0021','m002','001블랙',10000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('on0012','n001','16누 브라운',15000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0021','c001','200ml',20000,20);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0022','c002','500ml',45000,30);

select * from detailed_category_table;
////////////////////////////////////////////////////////////////////////////////

create table Inventory_table( --재고현황 테이블
    detailed_procode    varchar2(20)
    ,Inventory_date     date       
    ,restock            number(4)
    ,restock_shipment   varchar2(6)
);

drop table Inventory_table;

-- 외래키 설정
alter table Inventory_table
add constraints fk_Inventory_table foreign key(detailed_procode)
references detailed_category_table(detailed_procode);

delete Inventory_table
where detailed_procode='os0011';

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,3,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,1,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,2,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,1,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,1,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,1,'출고');

select detailed_procode,to_char(Inventory_date,'YYYY-MM-DD'),restock,restock_shipment
from Inventory_table;



