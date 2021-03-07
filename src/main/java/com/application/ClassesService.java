package com.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.infrashtructure.ClassesRepository;
import com.model.entities.Classes;

@Service("classesService")
public class ClassesService extends Services<Classes, Integer> implements IClassesService {

	private @Autowired @Qualifier("classesRepository") ClassesRepository classesRepository;

}
