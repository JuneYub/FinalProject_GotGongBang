-- 공방 id 시퀀스 
create sequence craft_num_pk  
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 견적요청 id 시퀀스
create sequence seq_order_num_pk
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 문의 문의번호 시퀀스
create sequence seq_inquiry_num_pk
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;