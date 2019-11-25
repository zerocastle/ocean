package com.ys.ocean.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ys.ocean.mapper.MemberMapper;
import com.ys.ocean.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberService {
	
	private MemberMapper mapper;
	
	public List<MemberVO> getMemberListService() {
		return mapper.memberGetList();
	}

}
