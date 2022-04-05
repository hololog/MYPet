package com.mypet.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
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
	
	
}
	