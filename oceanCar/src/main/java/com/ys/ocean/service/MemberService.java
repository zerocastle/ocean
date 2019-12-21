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
import com.ys.ocean.vo.MemberMemo;
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

	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	public MemberFindVO memberAllFind(@Param("m_num") String m_num) {

		return mapper.memberAllFind(m_num);

	}

	// 회占쏙옙占쏙옙 占쏙옙황
	public HashMap<String, Object> memberCount() {
		return mapper.memberCount();
	}

	// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 회占쏙옙占쏙옙
	public List<MemberVO> memberNon() {

		return mapper.memberNon();
	}

	public List<EmployeeVO> bindEmployee() {
		return mapper.bindEmployee();
	}

	// 占싸쇽옙트 占심뱄옙
	public int insertMember(MemberVO memberVO) {

		return mapper.insertMember(memberVO);
	}

	// 占쏙옙치占쏙옙 占싸울옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public int disMemberUpdate(Map param) {
		return mapper.disMemberUpdate(param);
	}

	// 占쏙옙占쏙옙처占쏙옙
	@Transactional(timeout = 10)
	public int insertBal(Oorder param) {

		Map map = new HashMap<String, String>();

		// 占쏙옙占쏙옙
		mapper.insertBal(param);

		map.put("m_num", param.getM_num());

		mapper.updateState(map);
		map.clear();

		map.put("e_id", param.getE_id());
		map.put("price", param.getPrice());
		// 占쏙옙占쏙옙
		System.out.println("占쏙옙占� : " + map);

		// hh
		int n = this.updateOrderPrice(map);

		return n;
	}

	public int updateOrderPrice(Map<String, String> map) {

		int n = mapper.updateOrderPrice(map);
		System.out.println("n : " + n);
		return n;
	}

	// 회占쏙옙 占쌨몌옙 占쏙옙占쏙옙歐占�
	public int insertMemo(Map param) {
		return mapper.insertMemo(param);
	}

	// 회占쏙옙 占쌨몌옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	public List<MemberMemo> selectMemoList(@Param("m_num") String m_num) {

		return mapper.selectMemoList(m_num);

	}

	// 월간 그래프 출력
	public List<HashMap<String, String>> monthGraph() {
		
		return mapper.monthGraph();

	}
	//직원 랭크
	public List<EmployeeVO> selectRank(){
		return mapper.selectRank();
	}

}
