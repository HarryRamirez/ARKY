package com.arky.cotizaciones.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arky.cotizaciones.model.State;

@Repository
public interface StateRepository extends JpaRepository<State, Integer>{

}
