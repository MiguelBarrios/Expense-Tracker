package com.skilldistillery.finance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.finance.data.TransactionDAO;
import com.skilldistillery.finance.entities.Transaction;

@Controller
public class TransactionController {
	
	@Autowired
	private TransactionDAO dao;

	@RequestMapping(path= {"/", "home.do"})
	public String index(Model model) {
		Transaction trans = dao.findById(1);
		System.out.println(trans);
		model.addAttribute("transaction", trans);
		return "index";
	}
}
