package com.ys.ocean.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberFindVO {

	String m_num;
	String m_name;
	String phone;
	String m_state;
	String m_order;
	String memo;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	Date reg_date;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	Date update_date;
	String e_id;

	String o_code;
	String car_type;
	String month_num;
	String credit_worth;
	String c_option;
	String price;
	String fee_per;
	String add_price;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	Date order_date;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	Date released;
	String order_state;
	String capital;
	String first_payment;

}
