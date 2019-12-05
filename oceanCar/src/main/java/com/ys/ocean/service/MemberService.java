package com.ys.ocean.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ys.ocean.mapper.MemberMapper;
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

	// ȸ�� ���� ���� ���� �������
	public MemberFindVO memberAllFind(@Param("m_num") String m_num) {

		return mapper.memberAllFind(m_num);

	}

	// ȸ���� ��Ȳ
	public HashMap<String, Object> memberCount() {
		return mapper.memberCount();
	}

	// ������ ������ ���� ȸ����
	public List<HashMap<String,Object>> memberNon() {

		return mapper.memberNon();
	}

	// �μ�Ʈ �ɹ�
	public int insertMember(MemberVO memberVO) {

		return mapper.insertMember(memberVO);
	}

}