package com.arky.cotizaciones.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.model.Role;



@Service
public interface RoleService {


	List<Role> getAll();

	Optional<Role> getByRole(int role);
}
