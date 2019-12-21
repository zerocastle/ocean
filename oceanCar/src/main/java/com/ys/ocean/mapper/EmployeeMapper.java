package com.ys.ocean.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.MemberVO;

@Mapper
public interface EmployeeMapper {
	public EmployeeVO employeeLoginMapper(EmployeeVO vo);
	
	public List<MemberVO> employeeManagerList(@Param("e_id") String e_id);

	public List<EmployeeVO> getEmployeeListService();
	
	// 자기 회원들 들고오기
	public List<EmployeeVO> employeeFind(@Param("e_id") String e_id);
	
	// Z
	public EmployeeVO ship(@Param("e_id") String e_id);
	
	public int dataUpdate(EmployeeVO vo);

	public int dataDelete(EmployeeVO vo);

	public int insertEmployee(EmployeeVO employeeVO);
	
	 
}
