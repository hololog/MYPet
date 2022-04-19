package com.mypet.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MypageDTO {
	
	private int free_board_num;
	private int tip_board_num;
	private int notice_num;
	private String board_code;
	private String email;
	private String nickname;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp insert_date;
	private Timestamp update_date;
	private int like_count;
	private int like_num;
	private int user_id;
	private int rownum;	
	private int num;
	private int bookmark_count;
	private String pet_type;
	private String pet_name;
	private String pet_age;
	private String pet_gender;
	private String title;
	private String detail_address;
	
}
