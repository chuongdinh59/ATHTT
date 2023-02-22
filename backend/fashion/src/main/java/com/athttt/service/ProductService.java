package com.athttt.service;

import java.util.List;
import java.util.Map;

import com.athttt.entity.ProductEntity;

public interface ProductService {
	List<ProductEntity> getProducts(Map<String, Object> searchMap);
	
}
