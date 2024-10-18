package com.arky.cotizaciones.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.arky.cotizaciones.dto.ProductDTO;
import com.arky.cotizaciones.dto.RequestProductDTO;
import com.arky.cotizaciones.exception.ResourceNotFoundException;
import com.arky.cotizaciones.model.Product;
import com.arky.cotizaciones.repository.ProductRepository;
import com.arky.cotizaciones.service.ProductService;
import com.arky.cotizaciones.service.impl.ProductServiceImpl;

@RestController
@RequestMapping("/service")
public class ProductController {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductServiceImpl  productServiceImpl;



	@GetMapping("/all")
	public ResponseEntity<List<ProductDTO>> getAll(){
		return new ResponseEntity<>(productService.getAll(), HttpStatus.OK);
	}


	@GetMapping("/{id}")
	public ResponseEntity<ProductDTO> getProduct(@PathVariable("id") int productId){
		Optional<ProductDTO> productDTO =productService.getByProduct(productId);
		return	productDTO.map(product -> new ResponseEntity<>(product, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	@PostMapping("/save")
	public ResponseEntity<Product> save(@RequestBody RequestProductDTO productDto){
		try {
		Product product = productServiceImpl.saveProduct(productDto);
		return new ResponseEntity<>(product, HttpStatus.CREATED);
		}catch (ResourceNotFoundException e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}


	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") int productId){
		if(productRepository.findById(productId).isPresent()) {
			productService.deleteProduct(productId);
			return new ResponseEntity<>(HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}


    @PutMapping("/update/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable("id") Integer productId, @RequestBody RequestProductDTO requestProductDTO) {
        Product updatedProduct = productServiceImpl.updateProduct(productId, requestProductDTO);
        return ResponseEntity.ok(updatedProduct);
    }




	@GetMapping("/search")
    public List<Product> searchServices(@RequestParam String name) {
        return productService.searchproduct(name);
    }






}
