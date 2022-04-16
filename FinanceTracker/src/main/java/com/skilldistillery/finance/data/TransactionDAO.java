package com.skilldistillery.finance.data;

import com.skilldistillery.finance.entities.Transaction;

public interface TransactionDAO {
	Transaction findById(int id);

}
