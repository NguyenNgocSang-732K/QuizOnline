package com.services.apiService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.entities.AccountExam;
import com.repository.apiRepository.ApiAccountExamRepository;

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

	@Override
	public AccountExam createAccountExam(AccountExam accountExam) {
		return apiAccountExamRepository.save(accountExam);
	}

	@Override
	public List<AccountExam> getExamByAccount(int account_id) {
		return apiAccountExamRepository.getExamByAccount(account_id);
	}

}
