package com.mypet.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDTO {
	private String user_id;
	private String email;
	private String nickname;
	private String password;
	private String name;
	private String phone_no;
	private String zipcode;
	private String address;
	private String detail_address;
	private String member_point;
	private Timestamp last_access;
	private Timestamp join_date;
}
