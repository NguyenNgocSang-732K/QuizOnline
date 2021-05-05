package com.services.apiService;

import java.util.List;

import com.model.entities.Subject;
import com.model.models.ApiSubjectModel;

public interface IApiSubjectService {

	List<ApiSubjectModel> fetchAllSubject();

	List<Subject> getAllSubjectInEntities();

}
