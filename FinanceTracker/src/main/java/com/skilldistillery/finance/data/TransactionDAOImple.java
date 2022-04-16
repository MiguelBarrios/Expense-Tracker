package com.skilldistillery.finance.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.finance.entities.Transaction;


@Service
@Transactional
public class TransactionDAOImple implements TransactionDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Transaction findById(int id) {
		Transaction transaction = em.find(Transaction.class, id);
		return transaction;
	}

}
