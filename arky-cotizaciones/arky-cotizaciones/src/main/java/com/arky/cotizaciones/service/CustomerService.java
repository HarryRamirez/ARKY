package com.arky.cotizaciones.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.dto.CustomerDTO;
import com.arky.cotizaciones.model.Customer;



@Service
public interface CustomerService {


    List<CustomerDTO> getAll();

    Optional<CustomerDTO> getByCustomer(int customerId);

    Customer saveCustomer(Customer customer);

    Customer updateCustomer(int customerId, Customer customer);

    void deleteCustomer(int customerId);

    List<Customer> searchCustomer( String email);


}
