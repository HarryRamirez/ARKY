package com.arky.cotizaciones.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.dto.ProductDTO;
import com.arky.cotizaciones.model.Product;

@Service
public interface ProductService {

	List<ProductDTO> getAll();

	Optional<ProductDTO> getByProduct(int productId);


	void deleteProduct(int productId);

	List<Product> searchproduct(String name);

}
