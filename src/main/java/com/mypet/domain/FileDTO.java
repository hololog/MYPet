package com.mypet.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FileDTO {
	private int file_num;
	private int find_board_num;
	private char board_code;
	private String upload;
	private String filename;
	private String save_filename;
	private Timestamp file_upload_date;
	private String ext; // 파일확장자
	private int free_board_num;
	private int notice_num;
	private int review_board_num;
}
