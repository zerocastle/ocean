package com.ys.ocean;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	// ���� ������ �й��ϱ�
	@RequestMapping(value = "/move/master/distribution", method = RequestMethod.GET)
	public String moveMasterDistribution(Model model) {
		/*
		 * JSONSerializer jsonSerializer = new JSONSerializer();
		 * model.addAttribute("nonMember",
		 * jsonSerializer.toJSON(memberService.memberNon()));
		 * System.out.println(jsonSerializer.toJSON(memberService.memberNon()));
		 */
		model.addAttribute("nonMember", memberService.memberNon());
		model.addAttribute("employee", memberService.bindEmployee());
		return "/commonChildPage/distribution";
	}

	// ȸ�� �й��ϱ� ���� ������Ʈ
	@ResponseBody
	@RequestMapping(value = "/member/update/distribute", method = RequestMethod.POST)
	public String updateDistribute(Model model,  @RequestParam(value="params[]") List<String> param) {
		System.out.println(param);
		HashMap map = new HashMap<>();
		map.put("employee",param.get(param.size() - 1));
		map.put("params", param);
		System.out.println("�� : " + map);
		int cnt = memberService.disMemberUpdate(map);
		System.out.println("��� �� : " + cnt);
		return "";

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

	// ȸ����� ������ �̵�
	@RequestMapping(value = "/move/master/regMember", method = RequestMethod.GET)
	public String moveInsertMember(Model model) {

		logger.info("ȸ�� ��� �������� �̵�");

		return "/commonChildPage/regMember";
	}

	// ȸ�����
	@ResponseBody
	@RequestMapping(value = "/master/insertMember", method = RequestMethod.POST)
	public String insertMember(Model model, @RequestBody MemberVO memberVO) {
		logger.info("������ : ������ ����");
		System.out.println(memberVO);
		JSONSerializer jsonSerializer = new JSONSerializer();
		int cnt = memberService.insertMember(memberVO);
		System.out.println();
		JSONObject object = new JSONObject();
		object.put("signal", cnt);
		return object.toString();
	}
	
	
	
	
	// �ɹ��κ� ================================================================
	// �α��� ������ �̵�
		@RequestMapping(value = "/move/employee/managerMember", method = RequestMethod.GET)
		public String moveManagerMember(Model model) {
			logger.info("���� ȸ������");

			return "/employee/managerMember";
		}

}
