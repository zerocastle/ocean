package com.ys.ocean;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ys.ocean.service.MemberService;
import com.ys.ocean.vo.MemberVO;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;

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
		JSONSerializer jsonSerializer = new JSONSerializer();
		model.addAttribute("memberList", memberService.getMemberListService());
		model.addAttribute("memberCount", jsonSerializer.toJSON(memberService.memberCount()));
		return "/master/memberManager";
	}

	// ������ ������ ���� ������ �̵�
	@RequestMapping(value = "/move/master/employeeManager", method = RequestMethod.GET)
	public String moveMasterEmployeeManager(Model model) {
		logger.info("������ : ������ ����");
		System.out.println("���� : " + memberService.memberCount());
		return "/master/employeeManager";
	}

	// ������ �����
	@RequestMapping(value = "/move/master/monthChart", method = RequestMethod.GET)
	public String moveMasterEmployee(Model model) {

		return "/master/chart";
	}

	// ������ �й��ϱ�
	@RequestMapping(value = "/move/master/distribution", method = RequestMethod.GET)
	public String moveMasterDistribution(Model model) {
		model.addAttribute("nonMember", memberService.memberNon());
		return "/commonChildPage/distribution";
	}


	// �α��� ������ �̵�
	@RequestMapping(value = "/common/login", method = RequestMethod.GET)
	public String moveLoginService(Model model) {
		logger.info("������ : ������ ����");

		return "/login/login";
	}

	// ���� ȸ�� �ڽ� ������ �̵�
	@RequestMapping(value = "/common/memberChild", method = RequestMethod.GET)
	public String memberChild(Model model, @Param("mData") String mData) {
		logger.info("ȸ��");
		logger.info(mData);
		JSONObject jsonObj = new JSONObject();
		JSONSerializer jsonSerializer = new JSONSerializer();

		model.addAttribute("key", JSONArray.fromObject(memberService.memberAllFind(mData)));
		return "/commonChildPage/memberChildPage";
	}

	// ȸ�����
	@ResponseBody
	@RequestMapping(value = "/master/insertMember", method = RequestMethod.POST)
	public String moveLoginService(Model model, @RequestBody MemberVO memberVO) {
		logger.info("������ : ������ ����");
		System.out.println(memberVO);
		JSONSerializer jsonSerializer = new JSONSerializer();
		int cnt = memberService.insertMember(memberVO);

		return jsonSerializer.toJSON(cnt).toString();
	}

}
