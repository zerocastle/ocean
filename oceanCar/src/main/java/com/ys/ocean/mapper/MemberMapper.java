package com.ys.ocean.mapper;import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ys.ocean.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	public List<MemberVO> memberGetList();

}
