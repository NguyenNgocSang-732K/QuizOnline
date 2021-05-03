package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.model.entities.Subject;
import com.model.models.ApiSubjectModel;

@Repository("subjectRepository")
public interface ApiSubjectRepository extends CrudRepository<Subject, Integer> {

	@Query("select new com.model.models.ApiSubjectModel(id,name,createdDate,createdBy,status,image) from Subject")
	public List<ApiSubjectModel> fetchAllSubject();
	
	@Query("from Subject")
	public List<Subject> getAllSubjectInEntities();
	
	
}
