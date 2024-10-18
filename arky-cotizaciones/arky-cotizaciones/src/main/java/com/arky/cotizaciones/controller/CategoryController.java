package com.arky.cotizaciones.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.arky.cotizaciones.model.Category;
import com.arky.cotizaciones.service.CategoryService;

@RestController
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/all")
	public ResponseEntity<List<Category>> getAll(){
		return new ResponseEntity<>(categoryService.getAll(), HttpStatus.OK);
	}

	@PostMapping("/save")
	public ResponseEntity<Category> save(@RequestBody Category category){
		return new ResponseEntity<>(categoryService.saveCategory(category), HttpStatus.CREATED);
	}
}
