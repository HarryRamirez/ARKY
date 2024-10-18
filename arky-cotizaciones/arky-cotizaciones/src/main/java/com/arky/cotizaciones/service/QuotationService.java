package com.arky.cotizaciones.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.dto.QuotationDTO;
import com.arky.cotizaciones.dto.QuotationFind;
import com.arky.cotizaciones.model.Quotation;





@Service
public interface QuotationService {


	List<QuotationDTO> getAll();

	Optional<QuotationFind> getByQuotation(int quotationId);

	void deleteQuotation(int quotationId);

	Integer countByEstadoId(int stateId);

	List<Quotation> searchQuotation(String name);

}
