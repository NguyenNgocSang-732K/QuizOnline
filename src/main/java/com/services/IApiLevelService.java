package com.services;

import java.util.List;

import com.model.entities.Level;
import com.model.models.ApiLevelModel;

public interface IApiLevelService {

//	List<ApiLevelModel> fetchLevelByExam();
//	
//	List<Level> fetchAllLevel();
//	
//	Level fetchLevelWhereLevelIdOfExam(Integer level_id);
	
	List<ApiLevelModel> fetchLevel();
}
