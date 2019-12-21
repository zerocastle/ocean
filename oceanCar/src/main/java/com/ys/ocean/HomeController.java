package com.ys.ocean;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ys.ocean.service.EmployeeService;
import com.ys.ocean.service.MemberService;
import com.ys.ocean.vo.CalendarVO;
import com.ys.ocean.vo.EmployeeVO;
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

	private EmployeeService employeeService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("占싸듸옙占쏙옙 호占쏙옙占싹깍옙 ");
		model.addAttribute("employee", memberService.selectRank());
		model.addAttribute("calendar", JSONArray.fromObject(memberService.getCalendarList()).toString());
		return "/index";
	}

	// 회원관리이동
	@RequestMapping(value = "/move/master/memberManager", method = RequestMethod.GET)
	public String moveMasterMemberManager(Model model) {
		logger.info("占쏙옙占쏙옙占쏙옙 : 회占쏙옙占쏙옙 占쏙옙占쏙옙");
		JSONSerializer jsonSerializer = new JSONSerializer();
		model.addAttribute("memberList", memberService.getMemberListService());
		model.addAttribute("memberCount", jsonSerializer.toJSON(memberService.memberCount()));
		return "/master/memberManager";
	}

	// 지구언관리이동
	@RequestMapping(value = "/move/master/employeeManager", method = RequestMethod.GET)
	public String moveMasterEmployeeManager(Model model) {
		logger.info("employeeManager");

		model.addAttribute("employeeList", employeeService.getEmployeeListService());

		return "/master/employeeManager";
	}

	// 월매출 이동
	@RequestMapping(value = "/move/master/monthChart", method = RequestMethod.GET)
	public String moveMasterEmployee(Model model) {

		model.addAttribute("chart", JSONArray.fromObject(memberService.monthGraph()));

		return "/master/chart";
	}

	// 분배하기 페이지동
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

	// 분배하기
	@ResponseBody
	@RequestMapping(value = "/member/update/distribute", method = RequestMethod.POST)
	public String updateDistribute(Model model, @RequestParam(value = "params[]") List<String> param) {
		System.out.println(param);
		HashMap map = new HashMap<>();
		map.put("employee", param.get(param.size() - 1));
		map.put("params", param);
		System.out.println("占쏙옙 : " + map);
		int cnt = memberService.disMemberUpdate(map);
		System.out.println("占쏙옙占� 占쏙옙 : " + cnt);
		return "";

	}

	// 공통 로그인
	@RequestMapping(value = "/common/login", method = RequestMethod.GET)
	public String moveLoginService(Model model) {
		logger.info("占쏙옙占쏙옙占쏙옙 : 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");

		return "/login/login";
	}

	// 회원정보 뿌려주기
	@RequestMapping(value = "/common/memberChild", method = RequestMethod.GET)
	public String memberChild(Model model, @Param("mData") String mData) {
		logger.info("회占쏙옙");
		logger.info(mData);
		JSONObject jsonObj = new JSONObject();
		JSONSerializer jsonSerializer = new JSONSerializer();

		model.addAttribute("key", JSONArray.fromObject(memberService.memberAllFind(mData)));
		model.addAttribute("memo", memberService.selectMemoList(mData));
		return "/commonChildPage/memberChildPage";
	}

	// 직원 정보 뿌려주기
	@RequestMapping(value = "/common/employeeChild", method = RequestMethod.GET)
	public String employeeChild(Model model, @Param("eData") String eData) {
		logger.info("employeeChild");
		logger.info(eData);
		JSONObject jsonObj = new JSONObject();
		JSONSerializer jsonSerializer = new JSONSerializer();

		model.addAttribute("key", JSONArray.fromObject(employeeService.employeeFind(eData)));
		return "/commonChildPage/employeeChildPage";
	}

	// 회占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싱듸옙
	@RequestMapping(value = "/move/master/regMember", method = RequestMethod.GET)
	public String moveInsertMember(Model model) {

		logger.info("moveInsertMember");

		return "/commonChildPage/regMember";
	}

	// 회占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싱듸옙
	@RequestMapping(value = "/move/master/regEmployee", method = RequestMethod.GET)
	public String moveInsertEmployee(Model model) {

		logger.info("moveInsertEmployee");

		return "/commonChildPage/regEmployee";
	}

	// 회占쏙옙占쏙옙占�
	@ResponseBody
	@RequestMapping(value = "/master/insertMember", method = RequestMethod.POST)
	public String insertMember(Model model, @RequestBody MemberVO memberVO) {
		logger.info("占쏙옙占쏙옙占쏙옙 : 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");
		System.out.println(memberVO);
		JSONSerializer jsonSerializer = new JSONSerializer();
		int cnt = memberService.insertMember(memberVO);
		System.out.println();
		JSONObject object = new JSONObject();
		object.put("signal", cnt);
		return object.toString();
	}

	// 회占쏙옙占쏙옙占�
	@ResponseBody
	@RequestMapping(value = "/master/insertEmployee", method = RequestMethod.POST)
	public String insertEmployee(Model model, @RequestBody EmployeeVO employeeVO) {
		logger.info("EmployeeVO : employeeVO");
		System.out.println(employeeVO);

		int cnt = employeeService.insertEmployee(employeeVO);
		System.out.println();
		JSONObject object = new JSONObject();
		object.put("signal", cnt);
		return object.toString();
	}

	// 켈린더 인서트
	@ResponseBody
	@RequestMapping(value = "/calendar/insert", method = { RequestMethod.POST, RequestMethod.GET }, produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void insertCalendar(Model model, @RequestBody CalendarVO param) {

		System.out.println(param);
		memberService.insertCalendar(param);
	}

	// 켈린더 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "/calendar/getList", method = { RequestMethod.POST, RequestMethod.GET }, produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String getCalendarList(Model model, @RequestBody CalendarVO param) {

		return JSONArray.fromObject(memberService.getCalendarList()).toString();
	}

	// 占쏙옙占쏙옙占싸븝옙 ================================================================
	// 직원이 관리하는 맴버 조회
	@RequestMapping(value = "/move/employee/managerMember", method = RequestMethod.GET)
	public String moveManagerMember(Model model, @RequestParam("e_id") String e_id) {
		logger.info("占쏙옙占쏙옙 회占쏙옙占쏙옙占쏙옙");

		model.addAttribute("memberList", employeeService.employeeManagerList(e_id));
		model.addAttribute("ship",employeeService.ship(e_id));
		return "/employee/managerMember";
	}

}
