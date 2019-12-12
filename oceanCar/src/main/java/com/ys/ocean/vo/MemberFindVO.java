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
	
	Date reg_date;
	
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
	
	Date order_date;
	
	Date released;
	String order_state;
	String capital;
	String first_payment;

}
