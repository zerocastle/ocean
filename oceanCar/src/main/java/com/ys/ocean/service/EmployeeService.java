package com.ys.ocean.service;

import org.springframework.stereotype.Service;

import com.ys.ocean.mapper.EmployeeMapper;
import com.ys.ocean.vo.EmployeeVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EmployeeService {

	private EmployeeMapper mapper;

	public EmployeeVO employeeService(EmployeeVO vo) {
		return mapper.employeeLoginMapper(vo);
	}

}
