package com.skilldistillery.finance.data;

import java.util.List;

import com.skilldistillery.finance.entities.Transaction;

public interface TransactionDAO {
	Transaction findById(int id);
	Transaction addNewTransaction(Transaction transaction);
	boolean update(Transaction transaction);
	boolean remove(int tid);
	List<Transaction> getTransactions();
}
