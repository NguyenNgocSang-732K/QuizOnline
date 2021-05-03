package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.AccountExam;
import com.model.models.ApiExamModel;
import com.repository.ApiAccountExamRepository;
import com.repository.ApiExamRepository;

@Service("apiAccountExamService")
public class ApiAccountExamService implements IApiAccountExamService {

	private @Autowired ApiAccountExamRepository apiAccountExamRepository;

	@Override
	public AccountExam fetchAllExamOfAccount(int account_id, int exam_id) {
		// TODO Auto-generated method stub
		return apiAccountExamRepository.fetchAllExamOfAccount(account_id, exam_id);
	}

	// đếm số bài thi của account
	@Override
	public Integer countTotalExamUserDone(int account_id) {
		return apiAccountExamRepository.countTotalExamUserDone(account_id);
	}

}
