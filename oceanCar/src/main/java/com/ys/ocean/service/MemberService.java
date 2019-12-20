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

	// ȸ�� ���� ���� ���� ������
	public MemberFindVO memberAllFind(@Param("m_num") String m_num) {

		return mapper.memberAllFind(m_num);

	}

	// ȸ���� ��Ȳ
	public HashMap<String, Object> memberCount() {
		return mapper.memberCount();
	}

	// ������ ������ ���� ȸ����
	public List<MemberVO> memberNon() {

		return mapper.memberNon();
	}

	public List<EmployeeVO> bindEmployee() {
		return mapper.bindEmployee();
	}

	// �μ�Ʈ �ɹ�
	public int insertMember(MemberVO memberVO) {

		return mapper.insertMember(memberVO);
	}

	// ��ġ�� �ο� ��������
	public int disMemberUpdate(Map param) {
		return mapper.disMemberUpdate(param);
	}

	// ����ó��
	@Transactional(timeout = 10)
	public int insertBal(Oorder param) {

		Map map = new HashMap<String, String>();

		// ����
		mapper.insertBal(param);

		map.put("m_num", param.getM_num());

		mapper.updateState(map);
		map.clear();

		map.put("e_id", param.getE_id());
		map.put("price", param.getPrice());
		// ����
		System.out.println("��� : " + map);

		// hh
		int n = this.updateOrderPrice(map);

		return n;
	}

	public int updateOrderPrice(Map<String, String> map) {

		int n = mapper.updateOrderPrice(map);
		System.out.println("n : " + n);
		return n;
	}

	// ȸ�� �޸� ����ϱ�
	public int insertMemo(Map param) {
		return mapper.insertMemo(param);
	}

	// ȸ�� �޸� ���� ������
	public List<MemberMemo> selectMemoList(@Param("m_num") String m_num) {
		
		return mapper.selectMemoList(m_num);

	}

}
