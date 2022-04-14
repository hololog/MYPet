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
	
	
	//결제관련
	
	private String order_no;       
	private int num;
	private String user_id;
	private Timestamp order_date;
	private String product_no;
	private String order_qty;
	private int amount;
	private int zipcode;
	private String address;
	private String detail_address;
	private String status;
	private String delivery_no;
	private String Field;
	
	
	
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(String order_qty) {
		this.order_qty = order_qty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(String delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getField() {
		return Field;
	}
	public void setField(String field) {
		Field = field;
	}
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
	