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
	public int insertBal(Oorder param);
	
	//발주처리에 따른 맴버 상태 업데이트
	public int updateState(Map param);
	
	//발주처리후 실적 쌓기
	public int updateOrderPrice(Map param);
	
	//출고 처리
	public int updateOrder(Map param);
	
	//출고 날짜 업데이트
	public int updateOrderDate(Map param);

	//회원 메모 등록하기
	public int insertMemo (Map param);
	
	//회원 메모 정보 들고오기
	public List<MemberMemo> selectMemoList(@Param("m_num") String m_num);
	
	//월간 그래프 출력
	public List<HashMap<String,String>> monthGraph();
	
	//직원 랭크처리
	public List<EmployeeVO> selectRank();
	
	//켈린더 넣기
	public int insertCalendar(CalendarVO param);
	
	//켈린더 리스트 불러오기
	public List<CalendarVO> getCalendarList();
	
	
}
