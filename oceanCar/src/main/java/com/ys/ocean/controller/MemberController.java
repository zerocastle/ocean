/**
 * 
 */
package com.ys.ocean.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ys.ocean.service.MemberService;
import com.ys.ocean.vo.Oorder;

import lombok.AllArgsConstructor;

/**
 * @author kys
 *
 */

@Controller
@AllArgsConstructor
@RequestMapping(value = "/member/**")
public class MemberController {

	private MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@PostMapping(value = "/insertBal")
	public String logoutEmployee(Model model, HttpServletRequest request, @RequestBody Oorder param) {
		param.setO_code(UUID.randomUUID().toString());
		System.out.println(param);
		service.insertBal(param);
		return "/common/memberChild";

	}

}
