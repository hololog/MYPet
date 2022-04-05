package com.mypet.domain;

import java.sql.Timestamp;

public class GbuyBoardDTO {
	private int Gbuy_num;			//계시글번호
	private String Gbuy_name;		//아이디
	private String Gbuy_pass;		//비밀번호
	private String Gbuy_subject;	//상품명
	private String Gbuy_content;	//보조설명
	private int Gbuy_price;			//가격
	private int Gbuy_count;			//보유수량
	private int Gbuy_tcount;		//목표수량	
	private int Gbuy_readcount;		//목표수량	
	private Timestamp Gbuy_date;	//등록일자
	private String Gbuy_file; 		//메인이미지
	private String Gbuy_file2;		//상품상세이미지
	
	
	public int getGbuy_num() {
		return Gbuy_num;
	}
	public void setGbuy_num(int gbuy_num) {
		this.Gbuy_num = gbuy_num;
	}
	public String getGbuy_name() {
		return Gbuy_name;
	}
	public void setGbuy_name(String gbuy_name) {
		this.Gbuy_name = gbuy_name;
	}
	public String getGbuy_pass() {
		return Gbuy_pass;
	}
	public void setGbuy_pass(String gbuy_pass) {
		this.Gbuy_pass = gbuy_pass;
	}
	public String getGbuy_subject() {
		return Gbuy_subject;
	}
	public void setGbuy_subject(String gbuy_subject) {
		this.Gbuy_subject = gbuy_subject;
	}
	public String getGbuy_content() {
		return Gbuy_content;
	}
	public void setGbuy_content(String gbuy_content) {
		this.Gbuy_content = gbuy_content;
	}
	public int getGbuy_price() {
		return Gbuy_price;
	}
	public void setGbuy_price(int gbuy_price) {
		this.Gbuy_price = gbuy_price;
	}
	public int getGbuy_count() {
		return Gbuy_count;
	}
	public void setGbuy_count(int gbuy_count) {
		this.Gbuy_count = gbuy_count;
	}
	public int getGbuy_tcount() {
		return Gbuy_tcount;
	}
	public void setGbuy_tcount(int gbuy_tcount) {
		this.Gbuy_tcount = gbuy_tcount;
	}
	public int getGbuy_readcount() {
		return Gbuy_readcount;
	}
	public void setGbuy_readcount(int gbuy_readcount) {
		this.Gbuy_readcount = gbuy_readcount;
	}
	public Timestamp getGbuy_date() {
		return Gbuy_date;
	}
	public void setGbuy_date(Timestamp gbuy_date) {
		this.Gbuy_date = gbuy_date;
	}
	public String getGbuy_file() {
		return Gbuy_file;
	}
	public void setGbuy_file(String gbuy_file) {
		this.Gbuy_file = gbuy_file;
	}
	public String getGbuy_file2() {
		return Gbuy_file2;
	}
	public void setGbuy_file2(String gbuy_file2) {
		this.Gbuy_file2 = gbuy_file2;
	}	//이미지상세
}
	