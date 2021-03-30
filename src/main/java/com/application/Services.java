package com.application;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infrashtructure.EntityBase;
import com.infrashtructure.IRepository;


@Service("baseServices")
@Transactional
public class Services<Entity extends EntityBase, ID extends Serializable> implements IServices<Entity, ID> {

	private @Autowired IRepository<Entity, ID> baseRepository;

	public Services() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Services(IRepository<Entity, ID> baseRepository) {
		super();
		this.baseRepository = baseRepository;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Entity> FindAll() {
		// TODO Auto-generated method stub
		return (List<Entity>) baseRepository.FindAllValid();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Entity> FindAllUnValid() {
		// TODO Auto-generated method stub
		return (List<Entity>) baseRepository.FindAllUnvalid();
	}

	@Override
	@Transactional(readOnly = true)
	public Entity FindById(ID id) {
		// TODO Auto-generated method stub
		Optional<Entity> entity = baseRepository.findById(id);
		if (entity != null) {
			return entity.get();
		}
		return null;
	}

	@Override
	@Transactional
	public Entity Save(Entity entity) {
		Entity saved = baseRepository.save(entity);
		return saved;
	}

	@Override
	@Transactional
	public boolean Delete(ID id) {
		// TODO Auto-generated method stub
		try {
			baseRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return false;
		}
	}

	@Override
	public List<Entity> FindAll(int page, int size) {
		// TODO Auto-generated method stub
		int offset = (page - 1) * size;
		int limit = size;
		return (List<Entity>) baseRepository.FindAllValid(offset, limit);
	}

	@Override
	public List<Entity> FindAllUnValid(int page, int size) {
		// TODO Auto-generated method stub
		int offset = (page - 1) * size + 1;
		int limit = size;
		return (List<Entity>) baseRepository.FindAllUnvalid(offset, limit);
	}
}
