package com.services.apiService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.models.ApiLevelModel;
import com.repository.apiRepository.ApiLevelRepository;

@Service("apiLevelService")
public class ApiLevelService implements IApiLevelService {

	private @Autowired ApiLevelRepository apiLevelRepository;

	public ApiLevelRepository getApiLevelRepository() {
		return apiLevelRepository;
	}

	@Override
	public List<ApiLevelModel> fetchLevel() {
		return apiLevelRepository.fetchLevel();
	}

//	@Override
//	public List<ApiLevelModel> fetchLevelByExam() {
//		List<ApiLevelModel> levelsModel = apiLevelRepository.fetchLevelByExam();
//		return levelsModel;
//	}
//
//	@Override
//	public List<Level> fetchAllLevel() {
//		return apiLevelRepository.fetchAllLevel();
//	}
//
//	@Override
//	public Level fetchLevelWhereLevelIdOfExam(Integer level_id) {
//		return apiLevelRepository.fetchLevelWhereLevelIdOfExam(level_id);
//	}

}
