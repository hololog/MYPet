package com.mypet.domain;

import lombok.Data;

@Data
public class BookmarkDTO {
	int bookmarkNum;
	int findboardNum;
	int free_board_num;
	int review_board_num;
	int noticenum;
	String email;
	String boardCategory;
}
