package com.athttt.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/product")
public class ProductAPI {
	@Autowired 
	@GetMapping
	public String getProduct(@RequestParam Map<String, Object> reqParam) { 
		return "OK";
	}
}
