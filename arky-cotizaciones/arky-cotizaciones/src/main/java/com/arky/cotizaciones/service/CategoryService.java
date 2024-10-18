package com.arky.cotizaciones.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.Category;

@Service
public interface CategoryService {

	List<Category> getAll();

	Category saveCategory(Category category);
}
