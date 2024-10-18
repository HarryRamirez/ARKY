package com.arky.cotizaciones.dto;

public class CategoryDTO {

	private Integer categoryId;
	private String name;

	public CategoryDTO(Integer categoryId, String name) {
		super();
		this.categoryId = categoryId;
		this.name = name;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



}
