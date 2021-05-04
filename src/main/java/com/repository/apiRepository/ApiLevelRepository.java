package com.repository.apiRepository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.model.entities.Exam;
import com.model.entities.Level;
import com.model.models.ApiExamModel;
import com.model.models.ApiLevelModel;

@Repository("apiLevelRepository")
public interface ApiLevelRepository extends CrudRepository<Level, Integer> {

//	@Query("select new com.model.models.ApiLevelModel(id,name,createdDate,createdBy,status) from Level")
//	public List<ApiLevelModel> fetchLevelByExam();
//	
//	@Query("from Level")
//	public List<Level> fetchAllLevel();
//	
//	@Query("select l from Level l where id=:level_id")
//	public Level fetchLevelWhereLevelIdOfExam(@Param("level_id") Integer level_id);

	@Query("select new com.model.models.ApiLevelModel(id,name) from Level l")
	public List<ApiLevelModel> fetchLevel();
	
}
