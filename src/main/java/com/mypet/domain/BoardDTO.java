package com.mypet.domain;

import java.sql.Timestamp;

public class BoardDTO {

	private int free_board_num;
	private int tip_board_num;
	private int notice_num;
	private char board_code;
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
	private String file;
	private int file_num;
	private String upload;
	private String filename;
	private String save_filename;
	private Timestamp file_upload_date;
	private String ext; // 파일확장자
	private String ImageUploader; 
	
	
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSave_filename() {
		return save_filename;
	}
	public void setSave_filename(String save_filename) {
		this.save_filename = save_filename;
	}
	public Timestamp getFile_upload_date() {
		return file_upload_date;
	}
	public void setFile_upload_date(Timestamp file_upload_date) {
		this.file_upload_date = file_upload_date;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public int getReview_board_num() {
		return review_board_num;
	}
	public void setReview_board_num(int review_board_num) {
		this.review_board_num = review_board_num;
	}
	private int review_board_num;
	

	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
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
	public char getBoard_code() {
		return board_code;
	}
	public void setBoard_code(char board_code) {
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
	public String getImageUploader() {
		return ImageUploader;
	}
	public void setImageUploader(String imageUploader) {
		ImageUploader = imageUploader;
	}

	
	
}
