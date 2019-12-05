package com.ys.ocean.mapper;import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ys.ocean.vo.MemberFindVO;
import com.ys.ocean.vo.MemberVO;

@Mapper
public interface MemberMapper {
	// ȸ�� ������ �������
	public List<MemberVO> memberGetList();
	//ȸ�� ���� ���� ���� �������
	public MemberFindVO memberAllFind(@Param("m_num")String m_num);
	//ȸ���� ��Ȳ
	public HashMap<String,Object> memberCount();
	// ������ ������ ���� ȸ����
	public List<HashMap<String,Object>> memberNon();
	// �μ�Ʈ �ɹ�
	public int insertMember(MemberVO memberVO);

}