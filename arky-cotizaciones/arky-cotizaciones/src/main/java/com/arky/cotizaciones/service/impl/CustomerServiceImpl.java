package com.arky.cotizaciones.service.impl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arky.cotizaciones.dto.CustomerDTO;
import com.arky.cotizaciones.model.Customer;
import com.arky.cotizaciones.repository.CustomerRepository;
import com.arky.cotizaciones.service.CustomerService;





@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerRepository customerRepository;
	
    public CustomerServiceImpl(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }



	@Override
	public List<CustomerDTO> getAll() {

		return customerRepository.findAll().stream()
				.map(customer -> new CustomerDTO(
						customer.getCustomerId(),
						customer.getName(),
						customer.getEmail(),
						customer.getPhone(),
						customer.getAddress(),
						customer.getRut(),
						customer.getRubro()
						)).collect(Collectors.toList());
	}


	@Override
	public Optional<CustomerDTO> getByCustomer(int customerId) {

		return customerRepository.findById(customerId)
				.map(customer -> new CustomerDTO(
						customer.getCustomerId(),
						customer.getName(),
						customer.getEmail(),
						customer.getPhone(),
						customer.getAddress(),
						customer.getRut(),
						customer.getRubro()
						));
	}

	@Override
	public Customer saveCustomer(Customer customer) {

		return customerRepository.save(customer);
	}

	@Override
	public Customer updateCustomer(int customerId, Customer customer) {
	    return customerRepository.findById(customerId).map(existCustomer -> {
	        existCustomer.setName(customer.getName());
	        existCustomer.setEmail(customer.getEmail());
	        existCustomer.setPhone(customer.getPhone());
	        existCustomer.setAddress(customer.getAddress());
	        existCustomer.setRut(customer.getRut());
	        existCustomer.setRubro(customer.getRubro());
	        return customerRepository.save(existCustomer);
	    }).orElse(null);
	}



	@Override
	public void deleteCustomer(int customerId) {
	    customerRepository.findById(customerId).ifPresent(customer -> {
	        customerRepository.delete(customer);
	    });
	}



	@Override
	public List<Customer> searchCustomer(String email) {
		List<Customer> searchResult = new ArrayList<>();
		for(Customer customer: customerRepository.findAll()) {
			if(customer.getEmail().contains(email)) {
				searchResult.add(customer);
			}
		}
		return searchResult;
	}


	
	
    public ByteArrayInputStream exportCustomersToExcel() {
        List<CustomerDTO> customers = getAll();

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Customers"); 
            Row headerRow = sheet.createRow(0);

            
            String[] columns = {"ID", "Nombre", "Email", "Teléfono", "Dirección", "RUT", "Rubro"};
            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
            }

            
            int rowIdx = 1;
            for (CustomerDTO customer : customers) {
                Row row = sheet.createRow(rowIdx++);
                row.createCell(0).setCellValue(customer.getCustomerId());
                row.createCell(1).setCellValue(customer.getName());
                row.createCell(2).setCellValue(customer.getEmail());
                row.createCell(3).setCellValue(customer.getPhone());
                row.createCell(4).setCellValue(customer.getAddress());
                row.createCell(5).setCellValue(customer.getRut());
                row.createCell(6).setCellValue(customer.getRubro());
            }
            
            
            for (int i = 0; i < columns.length; i++) {
                sheet.autoSizeColumn(i);
            }

            
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            return new ByteArrayInputStream(outputStream.toByteArray());

        } catch (IOException e) {
            throw new RuntimeException("Error al generar el archivo Excel", e);
        }
    }


}
