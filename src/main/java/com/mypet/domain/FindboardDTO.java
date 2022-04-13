package com.mypet.domain;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FindboardDTO {
	private int find_board_num;
	private char board_code;
	private String nickname;
	private String title;
	private String content;
	private int readcount;
	private String pet_type;
	@DateTimeFormat(pattern = "mm/dd/yyyy")
	private Timestamp missing_date;
	private String pet_name;
	private String pet_age;
	private String pet_gender;
	private String address;
	private String address2;
	private String address3;
	private String detail_address;
	private String result;
	private int bookmarkCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp insert_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp delete_date;
	private int reward;
	private String upload;
	private String book;
}