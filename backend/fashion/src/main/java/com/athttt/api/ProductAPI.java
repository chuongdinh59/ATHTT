package com.athttt.api;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.athttt.model.ProductModel;
import com.athttt.service.ProductService;
import com.athttt.service.impl.ProductServiceImpl;

@RestController("/api/product")
public class ProductAPI {

	ProductService productService = new ProductServiceImpl();
	@GetMapping
	public List<ProductModel> getProducts(@RequestParam Map<String, Object> reqParam, 
			@RequestParam(value = "page", required = false) Integer page) {
		System.out.println(page);
		List<ProductModel> productList = productService.getProducts(reqParam, page);
		return productList;
	}

	@GetMapping(value = "/{id}")
	public ProductModel getProduct(@PathVariable("id") Integer id) {
		return productService.getProduct(id);
	}

}
