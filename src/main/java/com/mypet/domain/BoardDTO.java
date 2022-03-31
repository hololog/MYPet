package com.mypet.domain;

import java.sql.Timestamp;

public class BoardDTO {

	private int free_board_num;
	private String nickname;
	private String pass;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp insert_date;
	private Timestamp update_date;
	private int like_count;
	//첨부파일
	
	
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getFree_board_num() {
		return free_board_num;
	}
	public void setFree_board_num(int free_board_num) {
		this.free_board_num = free_board_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Timestamp insert_date) {
		this.insert_date = insert_date;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	
}
