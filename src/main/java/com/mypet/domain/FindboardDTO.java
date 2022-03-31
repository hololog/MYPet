package com.mypet.domain;

import lombok.Data;

@Data
public class FindboardDTO {
	private String find_board_num;
	private String board_code;
	private String nickname;
	private String subject;
	private String content;
	private int readcount;
	private String pet_type;
	private String missing_date;
	private String pet_name;
	private int pet_age;
	private String pet_gender;
	private String address;
	private String address2;
	private String status;
	private String insert_date;
	private String delete_date;
	private String detail_address;
	private int reward;
}
