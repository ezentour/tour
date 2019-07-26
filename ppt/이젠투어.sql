-- select * from tab;

-- 변경 사항 롤백: f12
-- 변경 사항 커밋: f11
-- 실행: ctrl + enter
-- 선택 영역만 실행: 해당 부분 드래그 + ctrl + enter

---------------------------------------------------------------------
-- table 생성
---------------------------------------------------------------------

create table member (
	m_id varchar2(80) not null primary key,
	m_password varchar2(80) not null,
	m_name varchar2(40) not null,
	m_tel varchar2(40),
	m_email varchar2(100),
	m_field varchar2(10),
	m_hashed varchar2(1000)
);

create table hotel (
	h_no number not null primary key,
	h_name varchar2(40) not null,
	h_address varchar2(200) not null,
	h_tel varchar2(40),
	h_price number not null,
	h_approve varchar2(10) default 'N',
	h_m_id varchar2(80) not null,
 	h_img varchar2(500),
   	h_type varchar2(100),
   	h_content varchar2(2000),
    h_room number not null,
	constraint fk_h_mid foreign key(h_m_id) references member(m_id) on delete cascade
);

create table hotel_room (
	hr_h_no number not null,
	hr_date date not null,
   	hr_room number,
	constraint hotel_room_pk primary key(hr_h_no, hr_date),
    constraint fk_hr_h_no foreign key(hr_h_no) references hotel(h_no) on delete cascade   
);

create table reservation(
	r_no number not null primary key,
	r_m_id varchar2(80) not null,
	r_h_no number not null,
	r_checkin date not null,
	r_checkout date not null,
	r_cancel varchar2(10) default 'N',
    r_room number not null,
	constraint fk_r_hno foreign key(r_h_no) references hotel(h_no) on delete cascade,
	constraint fk_r_mid foreign key(r_m_id) references member(m_id) on delete cascade
);

create table board (
	b_no number not null primary key,
	b_title varchar2(100) not null,
	b_content varchar2(2000),
	b_m_id varchar2(80) not null,
	b_regdate date,
	constraint fk_b_mid foreign key(b_m_id) references member(m_id) on delete cascade
);

create table comment_board (
	c_no number not null primary key,
	c_m_id varchar2(80) not null,
	c_content varchar2(2000),
	c_b_no number not null,
	c_regdate date,
	constraint fk_c_mid foreign key(c_m_id) references member(m_id) on delete cascade,
	constraint fk_c_bno foreign key(c_b_no) references board(b_no) on delete cascade
);

create table shopping_carts(
	s_no number not null primary key,
	s_h_no number not null,
	s_m_id varchar2(80) not null,
	s_checkin date,
	c_checkout date,
	constraint fk_s_hno foreign key(s_h_no) references hotel(h_no) on delete cascade,
	constraint fk_s_mid foreign key(s_m_id) references member(m_id) on delete cascade
);

create table price(
    p_no number not null primary key,
    p_r_no number not null,
    p_admin number,
    p_hostel number,
    p_room number not null,
    constraint fk_p_r_no foreign key(p_r_no) references reservation(r_no) on delete cascade
);

create table hotel_review (
    hre_no number not null primary key,
    hre_h_no not null,
    hre_m_id varchar2(80) not null,
    hre_comment varchar2(2000),
    hre_score number default 0,
    hre_date date,
    constraint fk_hre_hno foreign key(hre_h_no) references hotel(h_no) on delete cascade,
    constraint fk_hre_mid foreign key(hre_m_id) references member(m_id) on delete cascade
);

select * from shopping_carts;
select * from tab;

---------------------------------------------------------------------
-- 참고
---------------------------------------------------------------------

-- *** 칼럼 추가, 삭제 후 커밋 까먹지 말기! ***
commit;

-- 테이블 삭제
drop table shopping_carts;
drop table comment_board;
drop table board;
drop table hotel_room;
drop table hotel_review;
drop table price;
drop table reservation;
drop table hotel;
drop table member;

-- 테이블 목록 보기
select * from tab;

-- 쓰레기값 제거
PURGE RECYCLEBIN;

-- 관리자 삽입
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('admin', 'admin', '관리자', '010-0000-0000', 'admin@gmail.com', 'A');

-- 회원
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel01', 'asdf', '호텔01', '010-1111-1111', 'hotel01@gmail.com', 'H');
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel02', 'asdf', '호텔02', '010-2222-2222', 'hotel02@gmail.com', 'H');
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel03', 'asdf', '호텔03', '010-3333-3333', 'hotel03@gmail.com', 'H');
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel04', 'asdf', '호텔04', '010-4444-4444', 'hotel04@gmail.com', 'H');

insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('user01', 'asdf', '사용자01', '010-4444-4444', 'user01@gmail.com', 'U');

commit;

select * from member;

-- 호텔 데이터 삽입
--  리조트 -----------------------------------
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '하이원리조트', '강원도 정선군 고한읍 하이원길 424', '1588-7789'
 , 300000, 'N', 'hotel01', 'hotel_high1.jpg', '리조트/콘도'
 , '복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조 높은 인테리어가 차원이 다른 편안함을 드립니다. 하늘샘 노천(야외풀), 스키스쿨 등 최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보십시오.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '천안상록리조트', '충남 천안시 수신면 수신로 576', '041-560-9114'
 , 136000, 'N', 'hotel02', 'hotel_sangnok.jpg', '리조트/콘도'
 , '심플하고 모던한 분위기의 정이 넘치는 공간입니다. 공간활용도가 우수하며 고객님께 편안함과 즐거움을 제공해 드립니다.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '롯데리조트부여', '충남 부여군 규암면 백제문로 400', '041-939-1000'
 , 189000, 'N', 'hotel03', 'hotel_lotte.jpg', '리조트/콘도'
 , '백제의 신비로운 유적지 부여, 롯데리조트부여는 백제의 섬세한 미의식과 예술 감각의 정수를 오롯이 품은 부여에 자리한 새로운 개념의 복합 문화 휴양 리조트 입니다. 롯데리조트부여는 역사 문화 탐방부터 레저, 휴식, 미식과 골프여행까지 한 번에 즐길 수 있는 유기적 여행 문화 콘텐츠를 보유했습니다.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '제주해비치리조트호텔', '제주 서귀포시 표선면 민속해안로 537', '064-780-8100'
 , 310700, 'N', 'hotel02', 'hotel_haevichi.jpg', '리조트/콘도'
 , '고급스런 인테리어와 리조트풍의 디자인의 전형적인 호텔식 콘도미니엄으로 주변의 표선 해수욕장과 제주의 푸른바다를 함께 조망할수 있는넓은 창과 발코니 그리고 편안하고 고급스런 실내 분위기와 각종 편의 시설을 갖추고 있다.32평형 189실, 49평형 24실 등 총 215실로 구성되어 있으며,넓은 야외 수영장과 로비라운지, 이디, 한일식당, 하노루 그리고 노래방과 가라오케 등의부대시설을 비롯한 편의점과 게임방 그리고 뷰띠끄 샵 등의 편의시설을 갖추고 있다.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '용평리조트', '강원 평창군 대관령면 올림픽로 715', '033-335-5757'
 , 190000, 'N', 'hotel04', 'hotel_yongpyong.jpg', '리조트/콘도'
 , '대한민국 레저 문화의 선구자인 용평리조트는 국민의 건강한 레저문화를 선도하는 기업으로 고객들에게 참된 휴식을 제공하여 고객의 행복가치를 창조하는 것을 경영이념으로 삼고 있습니다.', 5);
 
--  펜션 -----------------------------------
insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '경포엘펜션', '강원 양양군 현남면 인구길 28-29', '010-6616-7131'
 , 180000, 'N', 'hotel01', 'hotel_artinl.png', '펜션'
 , '복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조 높은 인테리어가 차원이 다른 편안함을 드립니다. 하늘샘 노천(야외풀), 스키스쿨 등 최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보십시오.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), 'L9풀빌라펜션', '강원 강릉시 하남길 333', '010-9119-7781'
 , 200000, 'N', 'hotel02', 'hotel_l9villa.png', '펜션'
 , '2인실, 가족실, 복층, 침대방, 온돌방, 개별바비큐, 독채, 투어, 와이파이, 신축, 바비큐장, 모던, 공용시설, 파티, 해수욕장, 수상레저, 스키장, 바닷가, 계곡.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '멜로즈', '강원 홍천군 서면 개야마을길 166', '010-9449-7781'
 , 300000, 'N', 'hotel03', 'hotel_melrose.png', '펜션'
 , '복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조 높은 인테리어가 차원이 다른 편안함을 드립니다. 하늘샘 노천(야외풀), 스키스쿨 등 최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보십시오.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '반대별펜션', '강원 강릉시 하남길 333', '010-6666-7781'
 , 200000, 'N', 'hotel04', 'hotel_banda.png', '펜션'
 , '신체리듬에 적합한 해발700m에 위치한 공기 맑고 조용한 펜션.', 8);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '파도소리펜션', '강원 삼척시 삼척로 4246-30', '010-9119-7781'
 , 100000, 'N', 'hotel01', 'hotel_padosori.png', '펜션'
 , '전객실 홍천강뷰, 비발디파크 오션월드, 커플룸,가족룸, 실내바베큐 무료 썰매타기.', 8);
 
--  호텔 -----------------------------------
insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '여의도 켄싱턴호텔' , '서울 영등포구 국회대로76길 16', '02-6670-7000'
 , 360000, 'N', 'hotel01', 'hotel_h_1.png', '호텔'
 , '전체 225개의 객실이 있으며 일부 객실에서는 한강 전경을 감상하실 수 있습니다. 모든 객실에서는 32인치 TV, 냉장고, 욕조 등이 있습니다. 또한, 이그제큐티브 객실에 투숙하시면 무료 미니바, 비데 등을 이용하실 수 있으며 이그제큐티브 라운지를 사용하실 수 있습니다.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '제주 신라호텔', '제주특별자치도 서귀포시 중문관광로72번길 75', '064-735-5114'
 , 450000, 'N', 'hotel01', 'hotel_h_2.png', '호텔'
 , '해변가가 내려다보이는 쉬리의 언덕이 유명한 제주 신라 호텔은 중문관광단지 내 자리하고 있어 여미지식물원, 천제연폭포, 별내린 전망대 등이 아주 가까운 거리에 있습니다. 또한, 제주국제공항은 차로 1시간 5분 거리에 있으며 1일 3회 호텔-공항 간 무료 셔틀을 운영하고 있습니다.호텔 내에 여유롭게 산책을 즐기기에 좋은 숨비정원이 있으며 사전 예약을 하시면 캠핑과 글램핑도 즐기실 수 있습니다.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '부산 롯데호텔', '부산광역시 부산진구 가야대로 772', '051-810-1000'
 , 250000, 'N', 'hotel02', 'hotel_h_3.png', '호텔'
 , '롯데 호텔과 시몬스에서 공동으로 개발한 더블 포켓 스프링의 해온 매트리스와 해온 침구 세트를 이용하실 수 있습니다. 190여 개의 메뉴가 있는 업스케일 뷔페인 라세느, 퓨전 중식당 도림, 정갈한 한식당인 무궁화, 부산 전경을 자랑하는 일식당인 모모야마 등 호텔 내 총 4개의 레스토랑이 있어 다양한 다이닝 옵션을 즐기실 수 있습니다.', 8);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '파라다이스시티', '인천광역시 중구 영종해안남로321번길 186', '1833-8855'
 , 250000, 'N', 'hotel02', 'hotel_h_4.png', '호텔'
 , '99,825평 규모의 부지에 위치한 복합 리조트인 파라다이스시티는 카지노윙, MICE윙, 패밀리윙으로 구성되어 있습니다. 호텔 내에는 카바나와 바가 갖춰진 야외수영장 등이 있으며 영종도 전경을 감상할 수 있는 실내 수영장도 있습니다.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '세인트존스경포호텔', '강원도 강릉시 창해로 307', '033-660-9000'
 , 200000, 'N', 'hotel03', 'hotel_h_5.png', '호텔'
 , '강원도 강릉에 위치한 세인트존스경포호텔은 카리브해의 고급 휴양지 세인트존스에서 영감을 받아 지어진 호텔입니다. 강문해변에 위치하여 동해와 대관령의 전망과 곰솔림 산책 코스를 즐길 수 있습니다. 주변 명소로는 경포해변, 허균 허난설헌 기념관, 초당동 순두부 마을이 차로 5분 거리에 위치해 있으며, 오죽헌은 차로 11분, 정동진은 차로 40분이 소요됩니다. ', 5);

--  게스트하우스 -----------------------------------
insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '장동게스트하우스쉬엄쉬엄', '대전광역시 대덕구 산디로15번길 63', '070-4158-3360'
 ,100000, 'N', 'hotel02', 'hotel_g_01.jpg', '게스트하우스'
 ,'장동 쉬엄쉬엄마을에서 운영하고 있는 게스트하우스입니다. 맑은 자연속에서 사랑하는 이들과 함께 아름다운 추억을 만들어가세요', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '미나리깡 게스트하우스', '충청남도 공주시 정자방1길 22-13', '010-8893-8381'
 ,30000, 'N', 'hotel02', 'hotel_g_02.jpg', '게스트하우스'
 ,'단독주택을 이용하실 수 있으며 선택시 카라반으로도 이용 가능합니다. 공산성과 무령왕릉을 도보로 이동할 수 있습니다.', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '문동이네 게스트하우스', '부산 해운대구 해운대로570번길 55', '051-731-2120'
 ,200000, 'N', 'hotel01', 'hotel_g_03.jpg', '게스트하우스'
 ,'찾아주시는 고객님들이 편히 쉬다 가실 수 있도록 정성을 다하고 있습니다. 숙박, 영화, 음악, 파티를 고루 갖춘 게스트하우스입니다.', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '하루 게스트하우스', '강원 속초시 장안로 19-1', '010-8407-6878'
 ,40000, 'N', 'hotel04', 'hotel_g_04.jpg', '게스트하우스'
 ,'일상의 쉼표를 이 곳에서 즐기세요. 특급 호텔 수준의 청결을 유지하고 있으며 조식을 무료로 제공하고 있습니다.', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '뜰안채', '전북 전주시 완산구 어진길 94-5', '010-3166-9568'
 ,150000, 'N', 'hotel03', 'hotel_g_05.jpg', '게스트하우스'
 ,'전주 한옥마을에 있는 게스트하우스로 편안하고 아늑한 잠자리를 제공 해 드립니다. 다른 숙박업소들과는 달리 1933년에 축조된 전통 한옥 입니다. 뜰안채에 지내시면서 조선을 세운 태조의 기운을 만끽하고 가세요.', 5);

commit;
-------------------------------------
