package com.mypet.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class FreecommentDTO {

	private int free_board_num;
	private int comment_num;
	private String c_nik;
	private String c_content;
	private Date c_date;
	private Date c_rdate;

	@Override
	public String toString() {
		return "FreecommentDTO [free_board_num=" + free_board_num +  ", comment_num=" + comment_num + ", c_content="
				+ c_content + ", c_nik=" + c_nik + ", c_date=" + c_date + ", c_rdate" + c_rdate + "]";
	}
}
