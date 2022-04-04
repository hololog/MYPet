package com.mypet.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class FindcommentDTO {

	private int find_board_num;
	private int comment_num;
	private String c_nik;
	private String c_content;
	private Date c_date;
	private Date c_rdate;

	public int getFind_board_num() {
		return find_board_num;
	}

	public void setFind_board_num(int find_board_num) {
		this.find_board_num = find_board_num;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getC_nik() {
		return c_nik;
	}

	public void setC_nik(String c_nik) {
		this.c_nik = c_nik;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public Date getC_rdate() {
		return c_rdate;
	}

	public void setC_rdate(Date c_rdate) {
		this.c_rdate = c_rdate;
	}

	@Override
	public String toString() {
		return "FindcommentDTO [find_board_num=" + find_board_num + ", comment_num=" + comment_num + ", c_content="
				+ c_content + ", c_nik=" + c_nik + ", c_date=" + c_date + ", c_rdate" + c_rdate + "]";
	}
}
