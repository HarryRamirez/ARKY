package com.arky.cotizaciones.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.arky.cotizaciones.dto.RequestUserDTO;
import com.arky.cotizaciones.dto.UserDTO;
import com.arky.cotizaciones.model.User;




@Service
public interface UserService {


	List<UserDTO> getAll();

	User saveUser(RequestUserDTO userDTO);

    Optional<UserDTO> getUser(int userId);



}
