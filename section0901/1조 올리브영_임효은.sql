● 공지 테이블 추가

create table notice_table(
    notice_code     varchar2(10)    not null     --공지고유번호
   ,notice_num      number(30)      not null     --공지번호
   ,notice_class    varchar2(10)    not null     --공지분류
   ,notice_name     varchar2(100)   not null     --공지제목
   ,notice_content  varchar2(200)   not null     --공지내용
   ,notice_date     date            not null     --공지작성일
);

drop table notice_table;


공지 행 추가
insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong001','1', '일반','보이스피싱 주의 및 무통장입금 결제서비스 중단 안내','올리브영 무통장입금 결제서비스 중단','2023-08-31');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev001','2','이벤트','7월 <럭스에디트 그랜드 오픈> 이벤트 항공권 당첨자 발표','당첨자 dor*****조*하8940','2023-07-28');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('me001','3','매장','강남점 알립니다!!','현재 내부공사중입니다','2023-07-25');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev002','4','이벤트','할인 50% 특가!!','아이메이크업제품 특가','2023-06-30');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong002','5','일반','매장 이용시 마스크 착용 권고~!','마스크 착용 부탁드립니다','2023-05-01');


select * from notice_table;


select notice_code 코드, notice_num 번호, notice_class 분류, notice_name 제목, notice_content 내용, notice_date 작성일
from notice_table
order by notice_num, notice_date desc;

----------------------------------------------------------------------------
● 리뷰 테이블 

drop table review_table;

create table review_table(
    oid         varchar2(30)       not null   --고객아이디(FK)
   ,review_content     varchar2(200)      not null   --리뷰내용  
   ,starjum            number(5)          not null   --별점
   ,review_date        date               not null   --작성일자
   ,detailed_procode   varchar2(20)       not null  --상세상품코드(FK)
   --,foreign key(review_oid) references ocus(oid)
   --,foreign key(detailed_procode) references detailed_category_table(detailed_procode) 
);


리뷰 행 추가

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill1','너무 좋아요!','5','2023-08-31','os0011');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill2','보통이에요','3','2023-07-22','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','좋아요!','4','2023-07-14','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','별로예요!','1','2023-06-26','oc0021');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','너무 좋아요!','5','2023-05-17','oc0022');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','보통이에요!','3','2023-05-17','os0022');


select * from review_table;

select review_oid 고객ID, review_content 내용, starjum 평가, review_date 작성일자, detailed_procode 상세상품코드
from review_table
order by review_date desc;

--외래키 설정
--고객 ID
alter table review_table
add constraints fk_review_oid foreign key(oid)
references ocus(oid);

--상품코드
alter table review_table
add constraints fk_detailed_procode foreign key(detailed_procode)
references detailed_category_table(detailed_procode);


----------------------------------------------------------------------------

drop table opur;

● 구매물품목록내역 테이블 추가

create table opur(
    purchase_code       number(11)             --주문번호
   ,detailed_procode    varchar2(50)           --상세상품코드
   ,oquantity           number(10)             --물품수량
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
● 구매내역 테이블 추가

drop table purlist_table;

create table purlist_table(
    purchase_code       number(11)       --주문번호
   ,oid                 varchar2(30)     --고객ID
   ,receive_name        varchar2(20)     --받는 분
   ,phone_number        varchar2(13)     --받는 분 전화번호
   ,address             varchar2(100)    --배송지
   ,message             varchar2(100)    --배송메세지
   ,payment_method      varchar2(15)     --결제방식
   ,payment_gift        varchar2(30)     --기프트카드ID
   ,payment_coupon      varchar(4)       --쿠폰 사용    
   ,payment_point       number(10)       --포인트 사용
   ,total               number(10)       --총 결제 금액
   ,primary key(purchase_code)
   --,foreign key(oid) references ocus(oid)   
   --,foreign key(payment_gift) references giftcard_object(gcid)
);

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000001','itwill1','김동훈','010-1111-2222','서울시 관악구 봉천동 111-23','문앞에 놔주세요','카드','gci002',null,'0','21330');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000002','itwill2','김소영','010-1234-5678','서울시 관악구 봉천동 111-24','전화주세요','간편결제',null,null,'0','32000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000003','itwill3','조성우','010-1122-3344','서울시 관악구 봉천동 111-25','현관 비밀번호1234','계좌이체',null,null,'0','27000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000004','itwill4','임효은','010-1235-6819','서울시 관악구 봉천동 111-26','조심히 오세요~','카카오페이',null,null,'0','52200');
    

select * from purlist_table;


select purchase_code 주문번호, oid 고객ID, receive_name  받는분, phone_number 받는분전화번호, address 배송지, message 배송메세지, payment_method 결제방식, payment_gift 기프트카드ID
        ,payment_coupon 쿠폰사용, payment_point 포인트사용, total 총결제금액
    from purlist_table;

