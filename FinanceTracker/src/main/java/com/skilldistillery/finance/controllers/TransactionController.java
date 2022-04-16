package com.skilldistillery.finance.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TransactionController {

	@RequestMapping(path= {"/", "home.do"})
	public String home() {
		return "index";
	}
}
