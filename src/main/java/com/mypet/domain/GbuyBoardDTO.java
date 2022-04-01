package com.mypet.domain;

import java.sql.Timestamp;

public class GbuyBoardDTO {
	private int num;		//계시글번호
	private String name;	//아이디
	private String pass;	//비밀번호
	private String subject; //상품명
	private String content;	//보조설명
	private int price;		//가격
	private int count;		//보유수량
	private int tcount;		//목표수량	
	private int readcount;		//목표수량	
	private Timestamp date; //등록일자
	private String file; 	//메인이미지
	private String file2;	//이미지상세
	
	
	public int getRedcount() {
		return readcount;
	}
	public void setRedcount(int redcount) {
		this.readcount = redcount;
	}
	public int getTcount() {
		return tcount;
	}
	public void setTcount(int tcount) {
		this.tcount = tcount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public int getcount() {
		return count;
	}
	public void setcount(int count) {
		this.count = count;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
