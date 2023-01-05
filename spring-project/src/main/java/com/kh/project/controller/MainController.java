package com.kh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/movie/*")
public class MainController {
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String testTeaser() {
		return "main";
	}
	

	
	
//	@RequestMapping(value = "/ticketing", method = RequestMethod.GET)
//	public String testTicketing() {
//		System.out.println("티저 요청 테스트");
//		return "ticketing";
//	}
	
}
