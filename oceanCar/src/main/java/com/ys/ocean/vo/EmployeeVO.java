package com.ys.ocean.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EmployeeVO {

	private String e_id;
	private String pw;
	private String name;
	private String phone;
	private Date reg_date;
	private int payment;
	private String e_type;

}
