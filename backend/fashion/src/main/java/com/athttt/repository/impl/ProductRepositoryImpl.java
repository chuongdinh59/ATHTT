package com.athttt.repository.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.athttt.constant.SystemConstant;
import com.athttt.entity.ProductEntity;
import com.athttt.service.ProductService;
import com.athttt.utils.MapUtils;
import com.athttt.utils.QueryBuilderUtils;
import com.athttt.utils.ValidateUtils;

import enums.SpecialSearchParamsEnum;

public class ProductRepositoryImpl extends CommonRepositoryImpl<ProductEntity> implements ProductService {

	@Override
	public List<ProductEntity> getProducts(Map<String, Object> searchMap) {
		List<ProductEntity> productEntities = new ArrayList<>();
		/*
		 * search map is empty return all product *Note: panigation later
		 */
		if (ValidateUtils.isEmptyMap(searchMap)) {
			return super.findAll();
		}
		
		StringBuilder fromStatement = buildFromStatment(searchMap);
		StringBuilder whereStatement = buildSpecialField(searchMap).append(buildNormalField(searchMap));
		StringBuilder query = new StringBuilder("SELECT p.* \n").append(fromStatement).append(whereStatement);
		
		System.out.println(query.toString());
		productEntities = super.findByCondition(query.toString());
		return productEntities;
	}

	public StringBuilder buildFromStatment(Map<String, Object> searchMap) {
//		List<String> params = getSpecialSearchParams();
		StringBuilder fromStatement = new StringBuilder("FROM Product p");
		for (String key : searchMap.keySet()) {
			if (key.equals("categoryId")) {
				fromStatement.append("\nJOIN Category c ON p.category_id = c.id");
			}
		}
		return fromStatement;

	}

	public StringBuilder buildSpecialField(Map<String, Object> searchMap) {
		StringBuilder whereStatement = new StringBuilder(SystemConstant.WHERE_ONE_EQUALS_ONE);
		
		Float minPrice = MapUtils.getValueFromString(searchMap.getOrDefault("minPrice", null), Float.class);
		Float maxPrice = MapUtils.getValueFromString(searchMap.getOrDefault("maxPrice", null), Float.class);
		
		if(minPrice != null || maxPrice != null) {
			whereStatement.append(QueryBuilderUtils.withBetween("p.price", minPrice, maxPrice));
		}
		
		Integer categoryId = MapUtils.getValueFromString(searchMap.getOrDefault("categoryId", null), Integer.class);
		
		if (categoryId != null) {
			whereStatement.append(QueryBuilderUtils.withOperator("p.category_id", categoryId, SystemConstant.EQUAL_OPERATOR));
		}
		return whereStatement;
	}

	public StringBuilder buildNormalField(Map<String, Object> searchMap) {
		StringBuilder whereStatement = new StringBuilder();
		List<String> specialParams = getSpecialSearchParams();
		for (String key : searchMap.keySet()) {
			if (!specialParams.contains(key.toString().toLowerCase())) {
				Object value = searchMap.get(key);
				if (value instanceof String) {
					whereStatement.append(QueryBuilderUtils.withLike("p." + key.toString(), value.toString()));
				} else {
					whereStatement.append(
							QueryBuilderUtils.withOperator("p." + key.toString(), value, SystemConstant.EQUAL_OPERATOR));
				}
			}

			
		}
		 return whereStatement;
	}

	private List<String> getSpecialSearchParams() {
		List<String> params = new ArrayList<>();

		for (SpecialSearchParamsEnum item : SpecialSearchParamsEnum.values()) {
			params.add(item.getValue().toLowerCase());
		}

		return params;
	}
	
	
	
	public static void main(String[] args) {
		/* TEST */
		ProductRepositoryImpl s = new ProductRepositoryImpl();
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("categoryId", 6);
//		searchMap.put("name", "Đồng hồ");
//		searchMap.put("supplier", "Cellph");
		searchMap.put("minPrice", 20000);
		for ( ProductEntity p : s.getProducts(searchMap)) {
			System.out.println(p.getName());
		}
	
	}
}
