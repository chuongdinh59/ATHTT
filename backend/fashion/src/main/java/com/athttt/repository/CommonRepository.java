package com.athttt.repository;

import java.util.List;

public interface CommonRepository<T> {
	List<T> findAll();

	T findById(Long id);

	List<T> findByCondition(String sql);

	Long insert(Object object);

	void update(Object object);

	void delete(Long id);
}
