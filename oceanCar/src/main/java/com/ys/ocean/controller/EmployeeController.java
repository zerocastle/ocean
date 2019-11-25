package com.ys.ocean.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ys.ocean.service.EmployeeService;
import com.ys.ocean.vo.EmployeeVO;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/employee/**")
public class EmployeeController {

	private EmployeeService service;

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@ResponseBody
	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET }, produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String loginEmployee(Model model, @RequestBody EmployeeVO vo, HttpServletRequest request) throws Exception {
		logger.info("로그인");

		System.out.println("넘어온 값 : " + vo);

		// String resultJsonObject = null;
		HttpSession session = request.getSession();

		EmployeeVO object = service.employeeService(vo);

		JSONObject jsonObejct = new JSONObject();

		if (object != null) {
			jsonObejct.put("signal", "success");

			session.setAttribute("employee", object);
			jsonObejct.put("employee", session.getAttribute("member"));
			return jsonObejct.toString();
		} else {
			jsonObejct.put("signal", "fail");
			return jsonObejct.toString();
		}
	}

	// 로그 아웃

	@GetMapping(value = "/logout")
	public String logoutEmployee(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		EmployeeVO vo = (EmployeeVO) session.getAttribute("Employee");

		session.invalidate();
		System.out.println("session값을 지워 줍니다 .");
		return "/index";

	}

}
