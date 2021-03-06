package com.mypet.domain;

import java.sql.Timestamp;

public class BoardDTO {

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
	private String file;
	private int book;
	
	

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
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	public int getTip_board_num() {
		return tip_board_num;
	}
	public void setTip_board_num(int tip_board_num) {
		this.tip_board_num = tip_board_num;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBook() {
		return book;
	}
	public void setBook(int book) {
		this.book = book;
	}

	
	
}
