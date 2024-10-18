package com.arky.cotizaciones.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arky.cotizaciones.dto.ProductDTO;
import com.arky.cotizaciones.dto.RequestProductDTO;
import com.arky.cotizaciones.exception.ResourceNotFoundException;
import com.arky.cotizaciones.model.Category;
import com.arky.cotizaciones.model.Product;
import com.arky.cotizaciones.repository.CategoryRepository;
import com.arky.cotizaciones.repository.ProductRepository;
import com.arky.cotizaciones.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{


	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CategoryRepository categoryRepository;




	@Override
	public List<ProductDTO> getAll() {

		return productRepository.findAll().stream()
				.map(product -> new ProductDTO(
						product.getProductId(),
						product.getName(),
						product.getNet(),
						product.getDescription(),
						product.getCategory().getName()

						)).collect(Collectors.toList());
	}

	
	@Override
	public Optional<ProductDTO> getByProduct(int productId) {

		return productRepository.findById(productId)
				.map(product -> new ProductDTO(
						product.getProductId(),
						product.getName(),
						product.getNet(),
						product.getDescription(),
						product.getCategory().getName()
						));
	}


	
	

	public Product saveProduct(RequestProductDTO productDto) {

		Category category = categoryRepository.findById(productDto.getCategoryId())
				.orElseThrow(() -> new ResourceNotFoundException("Category not found"));

		Product product = new Product();
		product.setName(productDto.getName());
		product.setNet(productDto.getNet());
		product.setDescription(productDto.getDescription());
		product.setCategory(category);

			return productRepository.save(product);
	}



    public Product updateProduct(Integer productId, RequestProductDTO requestProductDTO) {
      
        Product product = productRepository.findById(productId)
            .orElseThrow(() -> new RuntimeException("Product not found"));

        
        product.setName(requestProductDTO.getName());
        product.setNet(requestProductDTO.getNet());
        product.setDescription(requestProductDTO.getDescription());

        
        if (requestProductDTO.getCategoryId() != null) {
            Category category = categoryRepository.findById(requestProductDTO.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Category not found"));
            product.setCategory(category);
        }

       
        return productRepository.save(product);
    }



	@Override
	public void deleteProduct(int productId) {
		productRepository.findById(productId).ifPresent(product -> {
			productRepository.delete(product);
		});

	}



	
	@Override
	public List<Product> searchproduct(String name) {

		return productRepository.findByNameContainingIgnoreCase(name);
	}




}
