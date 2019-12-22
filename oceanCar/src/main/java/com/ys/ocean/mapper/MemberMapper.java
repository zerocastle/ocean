package com.ys.ocean.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ys.ocean.vo.CalendarVO;
import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.MemberFindVO;
import com.ys.ocean.vo.MemberMemo;
import com.ys.ocean.vo.MemberVO;
import com.ys.ocean.vo.Oorder;

@Mapper
public interface MemberMapper {
	// ȸ�� ������ ������
	public List<MemberVO> memberGetList();

	// ȸ�� ���� ���� ���� ������
	public MemberFindVO memberAllFind(@Param("m_num") String m_num);

	// ȸ���� ��Ȳ
	public HashMap<String, Object> memberCount();

	// ������ ������ ���� ȸ����
	public List<MemberVO> memberNon();

	// ������
	public List<EmployeeVO> bindEmployee();

	// �μ�Ʈ �ɹ�
	public int insertMember(MemberVO memberVO);
	
	//��ġ�� �ο� ��������
	public int disMemberUpdate(Map param);
	
	//����ó��
	public int insertBal(Oorder param);
	
	//����ó���� ���� �ɹ� ���� ������Ʈ
	public int updateState(Map param);
	
	//����ó���� ���� �ױ�
	public int updateOrderPrice(Map param);
	
	//��� ó��
	public int updateOrder(Map param);
	
	//��� ��¥ ������Ʈ
	public int updateOrderDate(Map param);

	//ȸ�� �޸� ����ϱ�
	public int insertMemo (Map param);
	
	//ȸ�� �޸� ���� ������
	public List<MemberMemo> selectMemoList(@Param("m_num") String m_num);
	
	//���� �׷��� ���
	public List<HashMap<String,String>> monthGraph();
	
	//���� ��ũó��
	public List<EmployeeVO> selectRank();
	
	//�̸��� �ֱ�
	public int insertCalendar(CalendarVO param);
	
	//�̸��� ����Ʈ �ҷ�����
	public List<CalendarVO> getCalendarList();
	
	
}
