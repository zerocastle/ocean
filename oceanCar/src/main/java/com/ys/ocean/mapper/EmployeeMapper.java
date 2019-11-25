package com.ys.ocean.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ys.ocean.vo.EmployeeVO;

@Mapper
public interface EmployeeMapper {
	public EmployeeVO employeeLoginMapper(EmployeeVO vo);
}
