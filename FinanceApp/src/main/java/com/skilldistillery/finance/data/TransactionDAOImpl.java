package com.skilldistillery.finance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.finance.entities.Transaction;

@Transactional
@Service
public class TransactionDAOImpl implements TransactionDAO{

	  @PersistenceContext
	  private EntityManager em;
	
	@Override
	public Transaction findById(int id) {
		return em.find(Transaction.class, id);
		
	}

	@Override
	public Transaction addNewTransaction(Transaction transaction) {
		em.persist(transaction);
		em.flush();
		return transaction;
	}

	@Override
	public List<Transaction> getTransactions() {
		String query = "SELECT t from Transaction t\n"
				+ "ORDER BY id DESC";
		
		List<Transaction> transactions = em.createQuery(query, Transaction.class).getResultList();
		return transactions;
	}
	
	@Override
	public List<Transaction> getFilteredTransactions(String category, String keyword) {
		List<Transaction> transactions = null;
		
		if(category == null) {
			transactions = getTransactions();
		}
		else {
			String query = "SELECT t FROM Transaction t\n"
				+ "WHERE category = :category";
		
			transactions = em.createQuery(query, Transaction.class)
			.setParameter("category", category).getResultList();
		}
		
		return transactions;
	}

	@Override
	public boolean remove(int tid) {
		Transaction transaction = em.find(Transaction.class, tid);
		
		if(transaction != null)
			em.remove(transaction);
		
		//em.flush();
		return !em.contains(transaction);

	}

	@Override
	public boolean update(Transaction transaction) {
		int count = 0;
		
		String query = "UPDATE Transaction t SET\n"
				+ "amount = :amount,\n"
				+ "category = :category,\n"
				+ "subCategory = :subCategory,\n"
				+ "transactionDate = :transactionDate,\n"
				+ "payee = :payee\n"
				+ "WHERE id = :tid";
			
		count = em.createQuery(query)
				.setParameter("amount", transaction.getAmount())
				.setParameter("category", transaction.getCategory())
				.setParameter("subCategory", transaction.getSubCategory())
				.setParameter("transactionDate", transaction.getTransactionDate())
				.setParameter("payee", transaction.getPayee())
				.setParameter("tid", transaction.getId())
				.executeUpdate();
		
		return (count == 1); 
	}

}