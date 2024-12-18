package com.arky.cotizaciones.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arky.cotizaciones.model.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Integer>{


	void deleteByQuotationId(Integer quotationId);
}
