package com.arky.cotizaciones.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.arky.cotizaciones.model.State;
import com.arky.cotizaciones.service.StateService;

@RestController
@RequestMapping("/state")
public class StateController {

	@Autowired
	private StateService stateService;

	@GetMapping("/all")
	public ResponseEntity<List<State>> getAll(){
		return new ResponseEntity<>(stateService.getAll(),HttpStatus.OK);
	}
}
