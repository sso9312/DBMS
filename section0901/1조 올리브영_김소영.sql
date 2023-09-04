create table ocus(                       --고객정보테이블(김소영)
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

insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill1', '김동훈', 123456, '010-1111-2222', '1993-10-04', 'itwill1@gmail.com', 10, '서울시 관악구 봉천동 111-23', 'gold');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill2', '김소영', 123457, '010-1111-2223', '1993-10-05', 'itwill2@gmail.com', 20, '서울시 관악구 봉천동 111-24', 'baby');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill3', '조성우', 123458, '010-1111-2224', '1993-10-06', 'itwill3@gmail.com', 30, '서울시 관악구 봉천동 111-25', 'black');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill4', '임효은', 123459, '010-1111-2225', '1993-10-07', 'itwill4@gmail.com', 40, '서울시 관악구 봉천동 111-26', 'pink');
commit;

select count(*) from ocus;   --고객정보테이블 확인
select * from ocus;
drop table ocus;


create table ocp_table(                --쿠폰종류 테이블(김소영)
   ocp      varchar2(15)    
  ,ocpname    varchar2(30)
  ,ocpdc    varchar2(30)
  ,ocpcon    number
  ,ocpst   date
  ,ocpend   date
  ,primary key(ocp)
);

insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp001', '생일축하 쿠폰', '10% 할인', 10000, '2023-08-31', '2023-09-06' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp002', '신규가입자 쿠폰', '30% 할인', 10000, '2023-08-30', '2024-09-30' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp003', 'VIP 쿠폰', '20% 할인', 10000, '2023-08-31', '2024-08-31' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp004', '5000원 할인 쿠폰', '5000원 할인', 50000, '2023-08-30', '2024-08-30' );
commit;

select count(*) from ocp_table; --쿠폰종류 테이블 확인
select * from ocp_table;
drop table ocp_table;

create table ocpman(                --쿠폰관리 테이블(김소영)
   oid varchar2(30)
  ,ocp varchar2(15)
  ,ocpus char(1)
  ,FOREIGN KEY (oid) --외래키같이 생성 1
  REFERENCES ocus(oid)
);

alter table ocpman   --외래키 추가 업데이트하는방식 2
add constraints fk_ocpman foreign key(ocp)
references ocp_table(ocp);

insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp001', 'Y');
insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill2', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp003', 'N');
commit;

select count(*) from ocpman; --쿠폰관리 테이블 확인
select * from ocpman;
drop table ocpman;

create table ovipinfo(                       --등급정보관리 테이블(김소영)
   ovip     varchar2(30)    
  ,ovipcon  varchar2(100)
  ,ovippo   varchar2(15)
  ,primary key(ovip)
);

insert into ovipinfo(ovip,ovipcon,ovippo) values('gold', '100만원이상', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('black', '70만원이상 100만원미만', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('green', '40만원이상 70만원미만', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('pink', '10만원이상 40만원미만', '0.50%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('baby', '10만원미만', '0.50%');
commit;

select count(*) from ovipinfo; --등급정보관리 테이블 확인
select * from ovipinfo;
drop table ovipinfo;