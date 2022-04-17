package com.skilldistillery.finance.controllers;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.finance.data.TransactionDAO;
import com.skilldistillery.finance.entities.Transaction;

@Controller
public class TransactionController {
	
	@Autowired
	private TransactionDAO dao;


	@RequestMapping(path= {"/", "home.do"})
	public String index(Model model, Boolean messageFlag, String message) {
		List<Transaction> transactions = dao.getTransactions();
		model.addAttribute("transactions", transactions);
		if(messageFlag != null) {
			model.addAttribute("messageFlag", messageFlag);
			model.addAttribute("message", message);
		}
		return "index";
	}
	
	@RequestMapping(path= "addTransaction.do")
	public String addTransaction(Transaction transaction, String transaction_date, RedirectAttributes redirectAttributes) {
		LocalDate date = LocalDate.parse(transaction_date);
		transaction.setTransactionDate(date);
		transaction = dao.addNewTransaction(transaction);
		boolean flag = (transaction.getId() != 0);
		String message = (flag) ? "Transaction successfully added" : "Unable to add transaction";
		redirectAttributes.addAttribute("messageFlag", flag);
		redirectAttributes.addAttribute("message", message);
		return "redirect:/home.do";
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
	public String remove(int tid, Model model, RedirectAttributes redirectAttributes) {
		boolean removed = dao.remove(tid);
		String message = removed ? "Transaction succefully removed": "Problem deleting transaction";
		redirectAttributes.addAttribute("messageFlag", removed);
		redirectAttributes.addAttribute("message", message);
		return "redirect:/home.do";
	}
	
	@RequestMapping(path="showUpdateTransactionPage.do")
	public String showUpdateTransactionPage(int tid, Model model) {
		Transaction transaction = dao.findById(tid);
		model.addAttribute("transaction", transaction);
		return "editTransaction";
	}
	
	@RequestMapping(path = "updateTransaction.do", method = RequestMethod.POST)
	public String remove(Transaction transaction, Model model, String transaction_date, RedirectAttributes redirectAttributes) {
		LocalDate date = LocalDate.parse(transaction_date);
		transaction.setTransactionDate(date);
		boolean updated = dao.update(transaction);
		String message = updated ? "Transaction succesfully updated" : "Unable to updated transaction";
		redirectAttributes.addAttribute("messageFlag", updated);
		redirectAttributes.addAttribute("message", message);
		return "redirect:/home.do";
	}
}








