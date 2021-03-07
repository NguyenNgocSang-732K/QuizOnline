package com.infrashtructure;

import org.springframework.stereotype.Repository;

import com.model.entities.Classes;

@Repository("classesRepository")
public interface ClassesRepository extends IRepository<Classes, Integer>{

}
