package com.mypet.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyDTO {

	private int board_num;
	private int comment_num;
	private int recomment_num;
	private String board_code;
	private String comment;
	private String c_nik;
	private Timestamp c_date;
	private Timestamp c_rdate;
	private String FLDAA;
	private int FLDNA;
}
