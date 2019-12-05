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

	// 마스터 분배하기
	@RequestMapping(value = "/move/master/distribution", method = RequestMethod.GET)
	public String moveMasterDistribution(Model model) {
		model.addAttribute("nonMember", memberService.memberNon());
		return "/commonChildPage/distribution";
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

	// 회원등록
	@ResponseBody
	@RequestMapping(value = "/master/insertMember", method = RequestMethod.POST)
	public String moveLoginService(Model model, @RequestBody MemberVO memberVO) {
		logger.info("마스터 : 직원들 관리");
		System.out.println(memberVO);
		JSONSerializer jsonSerializer = new JSONSerializer();
		int cnt = memberService.insertMember(memberVO);

		return jsonSerializer.toJSON(cnt).toString();
	}

}
