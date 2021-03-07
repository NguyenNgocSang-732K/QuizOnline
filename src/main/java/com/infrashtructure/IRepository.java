package com.infrashtructure;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.query.Param;

@NoRepositoryBean
public interface IRepository<Entity extends EntityBase, ID extends Serializable> extends JpaRepository<Entity, ID> {

	@Query(nativeQuery = true, value = "select * from #{#entityName} t where t.status=true")
	public List<Entity> FindAllValid();

	@Query(nativeQuery = true, value = "select * from #{#entityName} t where t.status=false")
	public List<Entity> FindAllUnvalid();

	@Query(nativeQuery = true, value = "select * from #{#entityName} t where t.status=true LIMIT :offset,:size")
	public List<Entity> FindAllValid(@Param("offset") int offset, @Param("size") int size);

	@Query(nativeQuery = true, value = "select * from #{#entityName} t where t.status=false LIMIT :offset,:size")
	public List<Entity> FindAllUnvalid(@Param("offset") int offset, @Param("size") int size);

}