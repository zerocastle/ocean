/**
 * 
 */
package com.ys.ocean.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ys.ocean.service.MemberService;

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

}
