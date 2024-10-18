package com.arky.cotizaciones.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.arky.cotizaciones.model.Discount;
import com.arky.cotizaciones.service.DiscountService;

@RestController
@RequestMapping("discount")
public class DiscountController {

	@Autowired
	private DiscountService discountService;

	@GetMapping("/all")
	public ResponseEntity<List<Discount>> getAll(){
		 return new ResponseEntity<>(discountService.getAll(), HttpStatus.OK);
	}
}
