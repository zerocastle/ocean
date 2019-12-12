package com.ys.ocean.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.MemberFindVO;
import com.ys.ocean.vo.MemberVO;

@Mapper
public interface MemberMapper {
	// 회원 정보들 들고오기
	public List<MemberVO> memberGetList();

	// 회원 정보 발주 정보 들고오기
	public MemberFindVO memberAllFind(@Param("m_num") String m_num);

	// 회원들 현황
	public HashMap<String, Object> memberCount();

	// 배정된 직원이 없는 회원들
	public List<MemberVO> memberNon();

	// 직원들
	public List<EmployeeVO> bindEmployee();

	// 인서트 맴버
	public int insertMember(MemberVO memberVO);
	
	//배치된 인원 업데이터
	public int disMemberUpdate(Map param);
	
	//발주처리
	public int insertBal(Map param);
}
