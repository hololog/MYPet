package com.mypet.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FindboardDTO {
	private int find_board_num;
	private char board_code;
	private String nickname;
	private String email;
	private String title;
	private String content;
	private int readcount;
	private String pet_type;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private String missing_date;
	private String pet_name;
	private String pet_age;
	private String pet_gender;
	private String address;
	private String address2;
	private String address3;
	private String detail_address;
	private String contact;
	private int result;
	private int bookmark_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp insert_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp delete_date;
	private int reward;
	private String upload; //file테이블의 save_filename 을 담을 변수
	private String book;
	private String fileuploadpath; // file 의 실제 uploadpath 저장용
}