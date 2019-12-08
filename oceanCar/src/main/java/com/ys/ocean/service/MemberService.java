package com.ys.ocean.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ys.ocean.mapper.MemberMapper;
import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.MemberFindVO;
import com.ys.ocean.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberService {

	private MemberMapper mapper;

	public List<MemberVO> getMemberListService() {
		return mapper.memberGetList();
	}

	// 회원 정보 발주 정보 들고오기
	public MemberFindVO memberAllFind(@Param("m_num") String m_num) {

		return mapper.memberAllFind(m_num);

	}

	// 회원들 현황
	public HashMap<String, Object> memberCount() {
		return mapper.memberCount();
	}

	// 배정된 직원이 없는 회원들
	public List<MemberVO> memberNon() {

		return mapper.memberNon();
	}

	public List<EmployeeVO> bindEmployee() {
		return mapper.bindEmployee();
	}

	// 인서트 맴버
	public int insertMember(MemberVO memberVO) {

		return mapper.insertMember(memberVO);
	}
	
	//배치된 인원 업데이터
	public int disMemberUpdate(Map param) {
		return mapper.disMemberUpdate(param);
	}

}
