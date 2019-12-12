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
		logger.info("인덱스 호출하기 ");

		return "index";
	}

	// 마스터 회원들 관리 페이지 이동
	@RequestMapping(value = "/move/master/memberManager", method = RequestMethod.GET)
	public String moveMasterMemberManager(Model model) {
		logger.info("마스터 : 회원들 관리");
		JSONSerializer jsonSerializer = new JSONSerializer();
		model.addAttribute("memberList", memberService.getMemberListService());
		model.addAttribute("memberCount", jsonSerializer.toJSON(memberService.memberCount()));
		return "/master/memberManager";
	}

	// 마스터 직원들 관리 페이지 이동
	@RequestMapping(value = "/move/master/employeeManager", method = RequestMethod.GET)
	public String moveMasterEmployeeManager(Model model) {
		logger.info("마스터 : 직원들 관리");
		System.out.println("뭔데 : " + memberService.memberCount());
		return "/master/employeeManager";
	}

	// 마스터 매출액
	@RequestMapping(value = "/move/master/monthChart", method = RequestMethod.GET)
	public String moveMasterEmployee(Model model) {

		return "/master/chart";
	}

	// 무브 마스터 분배하기
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

	// 회원 분배하기 다중 업데이트
	@ResponseBody
	@RequestMapping(value = "/member/update/distribute", method = RequestMethod.POST)
	public String updateDistribute(Model model,  @RequestParam(value="params[]") List<String> param) {
		System.out.println(param);
		HashMap map = new HashMap<>();
		map.put("employee",param.get(param.size() - 1));
		map.put("params", param);
		System.out.println("얍 : " + map);
		int cnt = memberService.disMemberUpdate(map);
		System.out.println("결과 값 : " + cnt);
		return "";

	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/common/login", method = RequestMethod.GET)
	public String moveLoginService(Model model) {
		logger.info("마스터 : 직원들 관리");

		return "/login/login";
	}

	// 공통 회원 자식 페이지 이동
	@RequestMapping(value = "/common/memberChild", method = RequestMethod.GET)
	public String memberChild(Model model, @Param("mData") String mData) {
		logger.info("회원");
		logger.info(mData);
		JSONObject jsonObj = new JSONObject();
		JSONSerializer jsonSerializer = new JSONSerializer();

		model.addAttribute("key", JSONArray.fromObject(memberService.memberAllFind(mData)));
		return "/commonChildPage/memberChildPage";
	}

	// 회원드록 페이지 이동
	@RequestMapping(value = "/move/master/regMember", method = RequestMethod.GET)
	public String moveInsertMember(Model model) {

		logger.info("회원 등록 페이지로 이동");

		return "/commonChildPage/regMember";
	}

	// 회원등록
	@ResponseBody
	@RequestMapping(value = "/master/insertMember", method = RequestMethod.POST)
	public String insertMember(Model model, @RequestBody MemberVO memberVO) {
		logger.info("마스터 : 직원들 관리");
		System.out.println(memberVO);
		JSONSerializer jsonSerializer = new JSONSerializer();
		int cnt = memberService.insertMember(memberVO);
		System.out.println();
		JSONObject object = new JSONObject();
		object.put("signal", cnt);
		return object.toString();
	}
	
	
	
	
	// 맴버부분 ================================================================
	// 로그인 페이지 이동
		@RequestMapping(value = "/move/employee/managerMember", method = RequestMethod.GET)
		public String moveManagerMember(Model model) {
			logger.info("직원 회원관리");

			return "/employee/managerMember";
		}

}
