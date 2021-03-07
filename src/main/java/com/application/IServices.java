package com.application;

import java.io.Serializable;
import java.util.List;

import com.infrashtructure.EntityBase;


public interface IServices<Entity extends EntityBase, ID extends Serializable> {

	List<Entity> FindAll();

	List<Entity> FindAll(int page, int size);

	List<Entity> FindAllUnValid();

	List<Entity> FindAllUnValid(int page, int size);

	Entity FindById(ID id);

	Entity Save(Entity entity);

	boolean Delete(ID id);
}
