-- 공방회원정보(파트너)
CREATE TABLE PARTNER (
    partner_id_pk VARCHAR2(20)                                      not null,            -- 파트너 아이디
    partner_name VARCHAR2(20)                                       not null,            -- 파트너 이름
    partner_pwd VARCHAR2(200)                                        not null,            -- 파트너 비밀번호
    partner_email VARCHAR2(40)                                      not null,            -- 파트너 이메일
    partner_mobile VARCHAR2(20)                                     not null,            -- 파트너 전화번호
    partner_post_code VARCHAR2(5)                                   not null,            -- 파트너 우편번호
    partner_address NVARCHAR2(40)                                   not null,            -- 파트너 주소
    partner_detail_address NVARCHAR2(40)                            null,                -- 파트너 상세 주소
    partner_extra_address NVARCHAR2(40)                             null,                -- 파트너 나머지 주소
    partner_gender NVARCHAR2(1)                                     not null,            -- 파트너 성별
    partner_birthday DATE                                           not null,            -- 파트너 생일
    partner_registerday DATE                 default sysdate        not null ,           -- 파트너 회원가입 날짜
    partner_lastPwdChange DATE               default sysdate        not null,            -- 파트너 마지막 비밀번호 변경 날짜
    partner_idle NUMBER(1)                   DEFAULT 0 not null,                         -- 파트너 휴먼회원 여부  0
    partner_pwd_change_required NUMBER(1)    DEFAULT 0 not null,                         -- 파트너 비밀번호 갱신 필요 여부 0
    partner_status NUMBER(1)                 DEFAULT 1 not null                          -- 파트너 회원 탈퇴 여부 1
    , CONSTRAINT PK_PARTNER_partner_id_pk primary key(partner_id_pk)
    ,constraint UQ_PARTNER_partner_email  unique(partner_email)
    ,constraint CK_PARTNER_partner_gender check( partner_gender in('1','2') )
    ,constraint CK_PARTNER_partner_status check( partner_status in(0,1) )
    ,constraint CK_PARTNER_partner_idle check( partner_idle in(0,1) )
 );    
 
 -- 견적서 테이블
CREATE TABLE ESTIMATE (
    estimate_num_pk NUMBER not null,                                         -- 견적서 번호
    order_num_fk NUMBER not null,                                            -- 주문 번호
    craft_num_fk NUMBER not null,                                            -- 공방 번호
    estimate_price NUMBER not null,                                          -- 견적 가격
    estimate_period NUMBER not null,                                         -- 견적 기간
    order_status NUMBER(1) default 0 not null,                               -- 견적 주문 상태
    estimate_proposal_date DATE DEFAULT SYSDATE not null,                     -- 견적 제안 날짜
    constraint PK_ESTIMATE_estimate_num_pk primary key(estimate_num_pk),    
    constraint FK_ESTIMATE_order_num_fk foreign key(order_num_fk) REFERENCES ORDERS (order_num_pk)
    );
    
-- 회원정보
CREATE TABLE MEMBER 
(user_id_pk             VARCHAR2(20)                     NOT NULL  -- 아이디
,name                   VARCHAR2(20)                     NOT NULL  -- 이름
,pwd                    VARCHAR2(200)                     NOT NULL  -- 비밀번호
,email                  VARCHAR2(40)                     NOT NULL  -- 이메일
,mobile                 VARCHAR2(20)                     NOT NULL  -- 휴대전화
,post_code              VARCHAR2(5)                      NOT NULL  -- 우편번호
,address                NVARCHAR2(40)                    NOT NULL  -- 주소
,detail_address         NVARCHAR2(40)                    NULL      -- 상세주소
,extra_address          NVARCHAR2(40)                    NULL      -- 부가주소
,gender                 NVARCHAR2(2)                     NOT NULL  -- 성별
,birthday               DATE                             NOT NULL  -- 생년월일
,mileage                NUMBER      default 0            NOT NULL  -- 마일리지
,registerday            DATE        default sysdate      NOT NULL  -- 가입일자
,last_pwd_change        DATE        default sysdate      NULL      -- 마지막비밀번호변경날짜
,idle                   number(1)   default 0            NOT NULL  -- 휴먼회원여부
,pwd_change_required    number(1)   default 0            NOT NULL  -- 비밀번호갱신필요여부
,status                 number(1)   default 1            NOT NULL  -- 탈퇴여부
,constraint PK_MEMBER_user_id_pk primary key(user_id_pk)
,constraint UQ_MEMBER_email  unique(email)
,constraint CK_MEMBER_gender check( gender in('1','2') )
,constraint CK_MEMBER_status check( status in(0,1) )
,constraint CK_MEMBER_idle check( idle in(0,1) )
);



-- 견적요청 테이블
CREATE TABLE ORDERS (
   order_num_pk    NUMBER                      NOT NULL, -- 견적요청번호
   user_id_fk      VARCHAR2(20)                NOT NULL, -- 아이디
   orderer         VARCHAR2(20)                NOT NULL, -- 주문자 이름
   order_product_type      VARCHAR2(20)                NOT NULL, -- 주문 상품 타입
   order_date      DATE  default sysdate       NOT NULL, -- 요청날짜
   brand_name      NVARCHAR2(20)                 NOT NULL, -- 브랜드
   request_explain NVARCHAR2(100)                NOT NULL,  -- 수선요청사항설명
   request         NVARCHAR2(100)              NOT NULL     -- 수천요청사항들
    ,constraint PK_ORDERS_order_num_pk primary key(order_num_pk)
    ,constraint FK_ORDERS_user_id_fk foreign key(user_id_fk)
                                  references MEMBER(user_id_pk)
);



-- 전체이미지 테이블
CREATE TABLE WHOLE_IMG (
   whole_img_num_pk NUMBER(10)     NOT NULL, -- 전체이미지번호
   order_num_fk     NUMBER         NOT NULL, -- 견적요청번호
   whole_img_name   NVARCHAR2(100) NOT NULL,  -- 파일명
   whole_img_size   NUMBER         NOT NULL   -- 파일사이즈
    ,constraint PK_WHOLE_IMG_whole_img_num_pk primary key(whole_img_num_pk)
    ,constraint FK_WHOLE_IMG_order_num_fk foreign key(order_num_fk)
                                  references ORDERS(order_num_pk)
);


-- 상세이미지 테이블
CREATE TABLE DETAIL_IMG (
   detail_img_num_pk NUMBER         NOT NULL, -- 상세이미지번호
   order_num_fk      NUMBER         NOT NULL, -- 견적요청번호
   detail_img_name   NVARCHAR2(100) NOT NULL,  -- 파일명
   detail_img_size   NUMBER         NOT NULL   -- 파일사이즈
    ,constraint PK_DETAIL_IMG_detail_img_num_pk primary key(detail_img_num_pk)
    ,constraint FK_DETAIL_IMG_order_num_fk foreign key(order_num_fk)
                                  references ORDERS(order_num_pk)
);


-- 품목
CREATE TABLE TYPES (
   type_code_pk NUMBER       NOT NULL, -- 품목코드
   type_name    VARCHAR2(20) NOT NULL  -- 품목명
    
    ,constraint PK_TYPES_type_code_pk primary key(type_code_pk)
);



-- 품목수선유형
CREATE TABLE DETAIL_TYPE (
   detail_type_pk   NUMBER        NOT NULL, -- 수선유형번호
   type_code_fk     NUMBER        NOT NULL, -- 품목코드
   detail_type_name NVARCHAR2(40) NOT NULL  -- 수선종류명
    
    ,constraint PK_DETAIL_TYPE_detail_type_pk primary key(detail_type_pk)
    ,constraint FK_DETAIL_TYPE_type_code_fk foreign key(type_code_fk) references TYPES(type_code_pk)
);

-- 수선요청사항
CREATE TABLE REQUEST_LIST (
   request_num_pk NUMBER NOT NULL, -- 요청사항일련번호
   detail_type_fk NUMBER NOT NULL, -- 수선유형번호
   order_num_fk   NUMBER NOT NULL  -- 견적요청번호
    
    ,constraint PK_REQUEST_LIST_request_num_pk primary key(request_num_pk)
    ,constraint FK_REQUEST_LIST_detail_type_fk foreign key(detail_type_fk)
                                  references DETAIL_TYPE(detail_type_pk)
    ,constraint FK_REQUEST_LIST_order_num_fk foreign key(order_num_fk)
                                  references ORDERS(order_num_pk)
);

-- 관리자 테이블
create table ADMIN
(admin_id_pk  VARCHAR2(20)  NOT NULL  -- 관리자 아이디
,admin_pwd    VARCHAR(20)   NOT NULL     -- 관리자 비밀번호
,CONSTRAINT PK_ADMIN PRIMARY KEY(admin_id_pk)
);
-- Table ADMIN이(가) 생성되었습니다.

-- 공지사항
create table NOTICE
(notice_num_pk      NUMBER                  NOT NULL      -- 공지사항 번호
,admin_id_fk        VARCHAR2(20)            NOT NULL      -- 관리자 아이디
,notice_title       NVARCHAR2(100)          NOT NULL      -- 제목
,notice_content     NVARCHAR2(1000)         NOT NULL      -- 본문
,notice_date        DATE DEFAULT SYSDATE    NOT NULL      -- 작성날짜
,notice_viewcount   NUMBER(10)              NOT NULL      -- 조회수
,CONSTRAINT PK_NOTICE PRIMARY KEY(notice_num_pk)
,CONSTRAINT FK_ADMIN_ADMIN_ID_PK FOREIGN KEY(admin_id_fk) REFERENCES ADMIN(admin_id_pk)
);
-- Table NOTICE이(가) 생성되었습니다.

-- 수선후기 테이블
create table REVIEW
(review_id_pk        NUMBER                  NOT NULL      -- 후기번호
,user_id_fk          VARCHAR2(20)            NOT NULL      -- 작성자 아이디
,order_detail_id_fk  VARCHAR2(20)            NOT NULL      -- 주문상세번호
,review_rating       NUMBER                  NOT NULL      -- 평점
,review_content      NVARCHAR2(100)          NOT NULL      -- 후기내용
,review_date         DATE DEFAULT SYSDATE    NOT NULL      -- 후기등록일
,CONSTRAINT PK_REVIEW_REVIEW_ID_PK PRIMARY KEY(review_id_pk)            
,CONSTRAINT FK_REVIEW_USER_ID_FK FOREIGN KEY(user_id_fk) REFERENCES MEMBER(user_id_pk)
,CONSTRAINT FK_REVIEW_ORDER_DETAIL_ID_FK FOREIGN KEY(order_detail_id_fk) REFERENCES ORDER_DETAIL(order_detail_id_pk)
);
-- Table REVIEW이(가) 생성되었습니다.

-- 수선후사진 테이블
create table FIXED_PHOTO
(fixed_photo_num_pk   NUMBER             NOT NULL             -- 사진번호
,review_id_fk         NUMBER             NOT NULL            -- 후기번호
,file_name            NVARCHAR2(1000)    NULL                -- 파일명 
,CONSTRAINT PK_FIXED_PHOTO_fixed_photo_num_pk PRIMARY KEY(fixed_photo_num_pk)
,CONSTRAINT FK_FIXED_PHOTO_REVIEW_ID_FK FOREIGN KEY(review_id_fk) REFERENCES REVIEW(review_id_pk)
);
-- Table FIXED_PHOTO이(가) 생성되었습니다.

--주문 상세 테이블
create table ORDER_DETAIL
(order_detail_id_pk     VARCHAR2(20)    null     -- 주문상세번호
,estimate_num_fk        number          not null -- 견적서번호
,payment_date             DATE            not null -- 주문날짜
,order_post_code        VARCHAR2(5)     not null -- 우편번호
,order_address          NVARCHAR2(40)     not null -- 주소
,order_detail_address   VARCHAR(200)    null     -- 상세주소
,order_extra_address    VARCHAR(200)    null     -- 부가주소
,product_status         NVARCHAR2(10) default '수거중'  not null -- 상품진행상태
,payment                NUMBER                      --결제 내역

,constraint PK_ORDER_DETAIL_order_detail_id_pk primary key(order_detail_id_pk)
,constraint PK_ORDER_DETAIL_estimate_num_fk foreign key(estimate_num_fk) references ESTIMATE(estimate_num_pk)
);                                                


-- 문의 테이블
create table INQUIRY
(inquiry_num_pk         NUMBER(5)               not null    -- 문의번호
,user_id_fk             VARCHAR2(20)            not null    -- 아이디
,inquiry_title          VARCHAR(100)            not null    -- 문의제목
,inquiry_content        VARCHAR(4000)           not null    -- 문의내용
,inquiry_group          NUMBER(5)               not null    -- 그룹번호
,inquiry_original       NUMBER(5)               not null    -- 원글문의번호
,inquiry_depth          NUMBER(5)               not null    -- 깊이번호

-- 추가 및 수정
,inquiry_date           date default sysdate    not null    -- 작성날짜
,inquiry_viewcount      number default 0        not null    -- 조회수

,inquiry_status         number(1) default 1     not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,inquiry_fileName       varchar2(255)                       -- WAS(톰캣)에 저장될 파일명(2023051909271535243254235235234.png)                                       
,inquiry_orgFilename    varchar2(255)                       -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,inquiry_fileSize       number                              -- 파일크기 
,inquiry_pw             varchar2(20) default ' '  not null  -- 게시글 비밀번호

,constraint PK_INQUIRY_inquiry_num_pk primary key(inquiry_num_pk)
,constraint FK_INQUIRY_user_id_fk foreign key(user_id_fk) references MEMBER(user_id_pk)
);

----- 공방정보 table ------

CREATE TABLE CRAFT (
craft_num_pk               NUMBER          NOT NULL, -- 공방번호
partner_id_fk              VARCHAR2(20)    NOT NULL, -- 파트너 아이디
craft_name                 VARCHAR2(30)    NOT NULL, -- 공방이름
craft_mobile               VARCHAR2(200)   NOT NULL, -- 공방연락처
craft_representative       VARCHAR2(30)    NOT NULL, -- 대표이름
craft_representative_image VARCHAR2(1000)  NOT NULL, -- 공방대표자사진
craft_image                VARCHAR2(1000)  NOT NULL, -- 공방사진
craft_Introduce            NVARCHAR2(2000) NOT NULL, -- 자기소개
craft_career               VARCHAR2(10)    NOT NULL, -- 경력기간
craft_certificate          VARCHAR2(1000)  NOT NULL, -- 자격증
craft_specialty            VARCHAR2(200)    NOT NULL, -- 전문 품목
craft_post_code            VARCHAR2(20)    NOT NULL, -- 공방우편번호
craft_address              VARCHAR2(200)   NOT NULL, -- 공방주소
craft_detail_address       VARCHAR2(200)   NOT NULL, -- 공방상세주소
craft_extra_address        VARCHAR2(200)   NULL,     -- 공방부가주소
craft_latitude             NUMBER          NOT NULL, -- 위도
craft_longitude            NUMBER          NOT NULL, -- 경도
craft_status               NUMBER(1)       default 1 NOT NULL,     -- 공방 상태(업데이트 방식)   1: 정식(가입중) / 0:임시(사용불가) 
craft_rating               NUMBER(1)       NULL,      -- 공방평점
,fileName                  VARCHAR2(500)              -- WAS(톰캣)에 저장될 이미지 파일명                                       
,orgFilename               VARCHAR2(500)              -- 진짜 파일명
,fileSize                  NUMBER                     -- 파일크기  

constraint PK_CRAFT_craft_num_pk primary key(craft_num_pk),
constraint FK_CRAFT_partner_id_fk foreign key(partner_id_fk) references PARTNER(partner_id_pk),
constraint UQ_CRAFT_craft_name  unique(craft_name),
constraint CK_CRAFT_craft_status check( craft_status in(0,1) )
);


-- 공방 추가이미지 테이블 --

CREATE TABLE CRAFT_IMG (
craft_add_img_pk       NUMBER     NOT NULL, -- 공방 추가 사진 번호
craft_num_fk           NUMBER     NOT NULL, -- 공방번호
craft_add_file_name    VARCHAR2(1000) NOT NULL,      -- 추가 이미지 파일명
constraint PK_CRAFT_IMG_craft_add_img_pk primary key(craft_add_img_pk),
constraint FK_CRAFT_craft_num_fk foreign key(craft_num_fk) references CRAFT(craft_num_pk)
);

--- 로그인이 성공되어지면 자동적으로 로그인 기록을 남기려고 insert 되어질 테이블 --
CREATE TABLE LOGIN_HISTORY 
(user_id_pk_pk      VARCHAR2(20)         NOT NULL -- 아이디
,login_date      DATE default sysdate    NOT NULL -- 로그인한 시간
,constraint FK_LOGIN_HISTORY foreign key(user_id_pk_pk) 
                                references MEMBER(user_id_pk)
);









