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
}
