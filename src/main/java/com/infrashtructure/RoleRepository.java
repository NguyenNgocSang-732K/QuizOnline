package com.infrashtructure;

import org.springframework.stereotype.Repository;

import com.model.entities.Role;

@Repository("roleRepository")
public interface RoleRepository extends IRepository<Role, Integer>{

}
