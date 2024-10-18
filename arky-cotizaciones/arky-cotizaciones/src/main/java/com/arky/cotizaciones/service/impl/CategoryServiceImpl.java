package com.arky.cotizaciones.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.Category;
import com.arky.cotizaciones.repository.CategoryRepository;
import com.arky.cotizaciones.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;


	@Override
	public List<Category> getAll() {

		return categoryRepository.findAll();
	}


	@Override
	public Category saveCategory(Category category) {

		return categoryRepository.save(category);
	}



}
