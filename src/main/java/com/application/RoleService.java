package com.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.infrashtructure.RoleRepository;
import com.model.entities.Role;

@Service("roleService")
public class RoleService extends Services<Role, Integer> implements IRoleService {

	private @Autowired @Qualifier("roleRepository") RoleRepository roleRepository;

}
