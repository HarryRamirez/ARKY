package com.arky.cotizaciones.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.Role;
import com.arky.cotizaciones.repository.RoleRepository;
import com.arky.cotizaciones.service.RoleService;



@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleRepository roleRepository;


	@Override
	public List<Role> getAll() {

		return roleRepository.findAll();
	}

	@Override
	public Optional<Role> getByRole(int role) {

		return roleRepository.findById(role);
	}


}
