package com.services.apiService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.Subject;
import com.model.models.ApiSubjectModel;
import com.repository.apiRepository.ApiSubjectRepository;

@Service("apiSubjectService")
public class ApiSubjectService implements IApiSubjectService {

	private @Autowired ApiSubjectRepository apiSubjectRepository;

	@Override
	public List<ApiSubjectModel> fetchAllSubject() {
		return apiSubjectRepository.fetchAllSubject();
	}

	@Override
	public List<Subject> getAllSubjectInEntities() {
		// TODO Auto-generated method stub
		return apiSubjectRepository.getAllSubjectInEntities();
	}

}
