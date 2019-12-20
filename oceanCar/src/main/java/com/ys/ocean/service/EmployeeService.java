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

	// 직원 목록
	public List<EmployeeVO> getEmployeeListService() {
		return mapper.getEmployeeListService();
	}

	// 클릭-->팝업창 회원 정보 불러오기
	public List<EmployeeVO> employeeFind(@Param("e_id") String e_id) {
		// TODO Auto-generated method stub
		return mapper.employeeFind(e_id);
	}

	public int dataUpdate(EmployeeVO vo) {
		return mapper.dataUpdate(vo);
		
	}

	public int dataDelete(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return mapper.dataDelete(vo);
	}

	public int insertEmployee(EmployeeVO employeeVO) {
		// TODO Auto-generated method stub
		return mapper.insertEmployee(employeeVO);
	}

}
