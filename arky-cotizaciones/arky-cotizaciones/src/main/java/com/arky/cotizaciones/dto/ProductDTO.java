package com.arky.cotizaciones.dto;

public class ProductDTO {

	private Integer productId;
	private String name;
	private Double net;
	private String description;
	private String category;


	public ProductDTO(Integer productId, String name, Double net, String description, String category) {
		super();
		this.productId = productId;
		this.name = name;
		this.net = net;
		this.description = description;
		this.category = category;
	}


	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Double getNet() {
		return net;
	}


	public void setNet(Double net) {
		this.net = net;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}




}
