package com.mypet.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FindboardDTO {
	private int find_board_num;
	private String board_code;
	private String nickname;
	private String title;
	private String content;
	private int readcount;
	private String pet_type;
	private Timestamp missing_date;
	private String pet_name;
	private int pet_age;
	private String pet_gender;
	private String address;
	private String address2;
	private String detail_address;
	private String result;
	private Timestamp insert_date;
	private Timestamp delete_date;
	private int reward;
	
	
	public int getFind_board_num() {
		return find_board_num;
	}
	public void setFind_board_num(int find_board_num) {
		this.find_board_num = find_board_num;
	}
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public Timestamp getMissing_date() {
		return missing_date;
	}
	public void setMissing_date(Timestamp missing_date) {
		this.missing_date = missing_date;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public String getStatus() {
		return result;
	}
	public void setStatus(String status) {
		this.result = status;
	}
	public Timestamp getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Timestamp insert_date) {
		this.insert_date = insert_date;
	}
	public Timestamp getDelete_date() {
		return delete_date;
	}
	public void setDelete_date(Timestamp delete_date) {
		this.delete_date = delete_date;
	}
	public int getReward() {
		return reward;
	}
	public void setReward(int reward) {
		this.reward = reward;
	}
}