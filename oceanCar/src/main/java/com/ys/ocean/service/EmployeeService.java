package com.ys.ocean.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ys.ocean.mapper.EmployeeMapper;
import com.ys.ocean.vo.EmployeeVO;
import com.ys.ocean.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EmployeeService {

	private EmployeeMapper mapper;

	public EmployeeVO employeeService(EmployeeVO vo) {
		return mapper.employeeLoginMapper(vo);
	}
	
	public List<MemberVO> employeeManagerList(@Param("e_id") String e_id){
		
		return mapper.employeeManagerList(e_id);
	}

}
