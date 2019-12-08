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
	
	//��ġ�� �ο� ��������
	public int disMemberUpdate(Map param) {
		return mapper.disMemberUpdate(param);
	}

}
