package com.athttt.api;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController("/api/order")
public class OrderAPI {
	
	@PostMapping
	public Boolean insertOrder(@RequestBody List<Integer> id) {
		return true;
	}
	
	
}
