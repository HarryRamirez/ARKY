package com.arky.cotizaciones.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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

import com.arky.cotizaciones.dto.CustomerDTO;
import com.arky.cotizaciones.model.Customer;
import com.arky.cotizaciones.repository.CustomerRepository;
import com.arky.cotizaciones.service.CustomerService;
import com.arky.cotizaciones.service.impl.CustomerServiceImpl;





@RestController
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	
    public CustomerController(CustomerServiceImpl customerServiceImpl) {
        this.customerServiceImpl = customerServiceImpl;
    }


	@GetMapping("/all")
	public ResponseEntity<List<CustomerDTO>> getAll(){
		return new ResponseEntity<>(customerService.getAll(), HttpStatus.OK);
	}


	@GetMapping("/{id}")
	public ResponseEntity<CustomerDTO> getCustomer(@PathVariable("id") int customerId){
		return customerService.getByCustomer(customerId)
				.map(customer -> new ResponseEntity<>(customer, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}


	@PostMapping("/save")
	public ResponseEntity<Customer> save(@RequestBody Customer customer){
		return new ResponseEntity<>(customerService.saveCustomer(customer), HttpStatus.CREATED);
	}


	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") int customerId) {
	    if (customerRepository.findById(customerId).isPresent()) {
	        customerService.deleteCustomer(customerId);
	        return new ResponseEntity<>(HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	}


    @PutMapping("/update/{id}")
    public ResponseEntity<Customer> update(@PathVariable("id") int customerId, @RequestBody Customer customer) {
        Customer updatedCustomer = customerService.updateCustomer(customerId, customer);

        if (updatedCustomer != null) {
            return new ResponseEntity<>(updatedCustomer, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @GetMapping("/search")
    public ResponseEntity<List<Customer>> searchCustomer(@RequestParam String email) {
        List<Customer> customers = customerService.searchCustomer(email);

        if (!customers.isEmpty()) {
            return new ResponseEntity<>(customers, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }
    
    
    
    @GetMapping("/excel")
    public ResponseEntity<byte[]> exportCustomersToExcel() throws IOException {
        ByteArrayInputStream excelStream = customerServiceImpl.exportCustomersToExcel();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=customers.xlsx");

        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(excelStream.readAllBytes());
    }

}


