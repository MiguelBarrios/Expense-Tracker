package com.skilldistillery.finance.data;

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

}
