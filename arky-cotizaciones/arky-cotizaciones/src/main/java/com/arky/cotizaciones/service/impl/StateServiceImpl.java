package com.arky.cotizaciones.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.State;
import com.arky.cotizaciones.repository.StateRepository;
import com.arky.cotizaciones.service.StateService;

@Service
public class StateServiceImpl implements StateService{

	@Autowired
	private StateRepository stateRepository;


	@Override
	public List<State> getAll() {

		return stateRepository.findAll();
	}

}
