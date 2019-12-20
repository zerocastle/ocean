package com.ys.ocean.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EmployeeFindVO {
	String e_id;
	String pw;
	String name;
	String phone;
	Date reg_date;
	String payment;
	String e_type;
}
