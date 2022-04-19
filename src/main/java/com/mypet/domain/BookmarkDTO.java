package com.mypet.domain;

import lombok.Data;

@Data
public class BookmarkDTO {
	int bookmarkNum;
	int findboardNum;
	int free_board_num;
	int tip_board_num;
	int notice_num;
	String email;
	String boardCategory;
}
