package com.ys.ocean.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String m_num;
	private String m_name;
	private String phone;
	private String m_state;
	private String m_order;
	private String memo;
	private Date reg_date;
	private Date update_date;

	private String e_id;

}
