package com.ys.ocean.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Oorder {

	private String o_code;
	private String car_type;
	private int month_num;
	private int credit_worth;
	private String c_option;
	private int price;
	private int free_per;
	private int add_price;
	private Date order_date;
	private Date released;
	private String order_state;
	private String capital;
	private int first_payment;

	private String m_num; //Æ÷¸°Å°

}
