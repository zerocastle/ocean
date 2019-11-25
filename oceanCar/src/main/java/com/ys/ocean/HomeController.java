package com.ys.ocean;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.ocean.mapper.MemberMapper;
import com.ys.ocean.service.MemberService;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private MemberService memberService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("�ε��� ȣ���ϱ� ");

		return "index";
	}

	// ������ ȸ���� ���� ������ �̵�
	@RequestMapping(value = "/move/master/memberManager", method = RequestMethod.GET)
	public String moveMasterMemberManager(Model model) {
		logger.info("������ : ȸ���� ����");
		model.addAttribute("memberList", memberService.getMemberListService());
		return "/master/memberManager";
	}

	// ������ ������ ���� ������ �̵�
	@RequestMapping(value = "/move/master/employeeManager", method = RequestMethod.GET)
	public String moveMasterEmployeeManager(Model model) {
		logger.info("������ : ������ ����");

		return "/master/employeeManager";
	}
	
	// ������ �����
	@RequestMapping(value = "/move/master/monthChart", method = RequestMethod.GET)
	public String moveMasterEmployee(Model model) {
		
		
		return "/master/chart";
	}

	// �α��� ������ �̵�
	@RequestMapping(value = "/common/login", method = RequestMethod.GET)
	public String moveLoginService(Model model) {
		logger.info("������ : ������ ����");

		return "/login/login";
	}

}
