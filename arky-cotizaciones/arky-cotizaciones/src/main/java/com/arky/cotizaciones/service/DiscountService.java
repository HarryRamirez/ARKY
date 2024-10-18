package com.arky.cotizaciones.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.Discount;

@Service
public interface DiscountService {

List<Discount> getAll();
}
