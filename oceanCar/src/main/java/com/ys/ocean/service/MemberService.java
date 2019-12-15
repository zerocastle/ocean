package com.ys.ocean.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ys.ocean.mapper.MemberMapper;
import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.Key;
import com.ys.ocean.vo.MemberFindVO;
import com.ys.ocean.vo.MemberVO;
import com.ys.ocean.vo.Oorder;

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

	// 배치된 인원 업데이터
	public int disMemberUpdate(Map param) {
		return mapper.disMemberUpdate(param);
	}

	// 발주처리
	@Transactional(timeout = 10)
	public int insertBal(Oorder param) {
		
		Map map = new HashMap<String,String>();

		//ㅐㅐ
		mapper.insertBal(param);
		
		map.put("m_num", param.getM_num());
		
		
		mapper.updateState(map);
		map.clear();

		map.put("e_id",param.getE_id());
		map.put("price",param.getPrice());
		//ㅐㅐ
		System.out.println("찍고 : " + map);
		
		//hh
		int n = this.updateOrderPrice(map);

		return n;
	};
	
	public int updateOrderPrice(Map<String,String> map) {
		
		int n = mapper.updateOrderPrice(map);
		System.out.println("n : " + n);
		return n;
	}

}
