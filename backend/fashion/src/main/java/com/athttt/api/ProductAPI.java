package com.athttt.api;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.athttt.model.ProductModel;
import com.athttt.service.ProductService;
import com.athttt.service.impl.ProductServiceImpl;

@RestController()
@RequestMapping("/api/product")
@CrossOrigin(origins = "http://127.0.0.1:5500")

public class ProductAPI {
	ProductService productService = new ProductServiceImpl();

	@GetMapping
	public List<ProductModel> getProducts(@RequestParam Map<String, Object> reqParam,
			@RequestParam(value = "page", defaultValue = "1", required = false) String page) {
		
		List<ProductModel> productList = productService.getProducts(reqParam, Integer.parseInt(page));
		return productList;
	}

	@GetMapping("/{id}")
	public ProductModel getProduct(@PathVariable Integer id) {
		return productService.getProduct(id);
	}

}
