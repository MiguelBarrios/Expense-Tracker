package com.skilldistillery.finance.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Transaction {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private double amount;
	
	@Column(name="user_id")
	private int userId;
	
	private String category;
	
	@Column(name="sub_catagory")
	private String subCategory;
	
	@Column(name="transaction_date")
	private LocalDate transactionDate;
	
	private String payee;
	
	public Transaction() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public LocalDate getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(LocalDate transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getPayee() {
		return payee;
	}

	public void setPayee(String payee) {
		this.payee = payee;
	}

	@Override
	public String toString() {
		return "Transaction [id=" + id + ", amount=" + amount + ", userId=" + userId + ", category=" + category
				+ ", subCategory=" + subCategory + ", transactionDate=" + transactionDate + ", payee=" + payee + "]";
	}

	
	

}
