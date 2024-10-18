package com.arky.cotizaciones.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.arky.cotizaciones.dto.RequestUserDTO;
import com.arky.cotizaciones.dto.UserDTO;
import com.arky.cotizaciones.exception.ResourceNotFoundException;
import com.arky.cotizaciones.model.User;
import com.arky.cotizaciones.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/all")
	public ResponseEntity<List<UserDTO>> getAll() {
		return new ResponseEntity<>(userService.getAll(), HttpStatus.OK);
	}



    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getUser(@PathVariable("id") int userId) {
    	Optional<UserDTO> userDTO = userService.getUser(userId);
    	return 	userDTO.map(user -> new ResponseEntity<>(user, HttpStatus.OK))
        		.orElse( new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }



	@PostMapping("/save")
	public ResponseEntity<User> save(@RequestBody RequestUserDTO userDTO){

		try {
			User user = userService.saveUser(userDTO);
			return new ResponseEntity<>(user, HttpStatus.CREATED);
		}catch (ResourceNotFoundException e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

	}









}
