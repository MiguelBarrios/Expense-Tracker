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
		return em.find(Transaction.class, 1);
		
	}

	@Override
	public Transaction addNewTransaction(Transaction transaction) {
		em.persist(transaction);
		em.flush();
		return transaction;
	}

	@Override
	public List<Transaction> getTransactions() {
		String query = "SELECT t from Transaction t";
		List<Transaction> transactions = em.createQuery(query, Transaction.class).getResultList();
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

}

/**
 * //		String query = "SELECT s FROM Staff s where s.id <= 10";
//		List<Staff> staff = em.createQuery(query, Staff.class).getResultList();
//		System.out.println(staff);
//		
//		
//		// Query a single property
//		String query2 = "SELECT s.firstName FROM Staff s where s.id <= 10";
//		List<String> names = em.createQuery(query2, String.class).getResultList();
//		System.out.println(names);
//		
//		// query multiple properties, but not all in a table
//		String jpql = "SELECT s.firstName, s.lastName FROM Staff s";
//		List<Object[]> res = em.createQuery(jpql, Object[].class).getResultList();
//		for(Object[] item : res) {
//			System.out.println(item[0] + " " + item[1]);
//		}
//		
		
		// adding params/ binding variables
//		String jpql = "SELECT s FROM Staff s WHERE s.email = :email";
//		List<Staff> staff = em.createQuery(jpql, Staff.class)
//				.setParameter("email", "larry.kong@example.com")
//				.getResultList();
//		
//		System.out.println(staff);
 **/
