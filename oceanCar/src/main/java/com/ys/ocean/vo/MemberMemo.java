/**
 * 
 */
package com.ys.ocean.vo;

import java.util.Date;

import lombok.Data;

/**
 * @author kys
 *
 */
@Data
public class MemberMemo {
	
	private int memoNum;
	private String memo;
	
	private Date cdata;
	private String writer;

	private String m_num;
}
