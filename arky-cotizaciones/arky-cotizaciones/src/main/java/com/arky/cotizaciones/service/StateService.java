package com.arky.cotizaciones.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.State;

@Service
public interface StateService {

	List<State> getAll();
}
