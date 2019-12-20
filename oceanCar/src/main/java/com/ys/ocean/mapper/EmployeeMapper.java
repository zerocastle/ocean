package com.ys.ocean.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.MemberVO;

@Mapper
public interface EmployeeMapper {
	public EmployeeVO employeeLoginMapper(EmployeeVO vo);
	
	public List<MemberVO> employeeManagerList(@Param("e_id") String e_id);

	public List<EmployeeVO> getEmployeeListService();
	
	// 직원 클릭 팝업창 --> 직원 정보 가져오기
	public List<EmployeeVO> employeeFind(@Param("e_id") String e_id);

	public int dataUpdate(EmployeeVO vo);

	public int dataDelete(EmployeeVO vo);

	public int insertEmployee(EmployeeVO employeeVO);
}
