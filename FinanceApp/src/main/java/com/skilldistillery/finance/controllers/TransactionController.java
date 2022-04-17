package com.skilldistillery.finance.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(path= "addTransaction.do")
	public String addTransaction(Transaction transaction) {
		transaction = dao.addNewTransaction(transaction);
		return "index";
	}
	
	@RequestMapping(path= "searchtransactions.do")
	public String searchTransaction(Model model) {
		List<Transaction> transactions = dao.getTransactions();
		model.addAttribute("transactions", transactions);
		return "search";
	}
	
	@RequestMapping(path="transactionView.do")
	public String viewTransaction(int tid, Model model) {
		Transaction transaction = dao.findById(tid);
		model.addAttribute("transaction", transaction);
		return "transactionView";
	}
	
	@RequestMapping(path="removeTransaction.do", method = RequestMethod.POST)
	public String remove(int tid, Model model) {
		boolean removed = dao.remove(tid);
		String message = removed ? "Transaction succefully removed": "Problem deleting transaction";
		model.addAttribute("message", message);
		
		return "message";
	}
}








