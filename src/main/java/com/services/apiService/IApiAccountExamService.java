package com.services.apiService;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.model.entities.AccountExam;

public interface IApiAccountExamService {

	AccountExam fetchAllExamOfAccount(int account_id, int exam_id);

	// đếm số bài thi của account đã làm
	Integer countTotalExamUserDone(int account_id);

	AccountExam createAccountExam(AccountExam accountExam);

	public List<AccountExam> getExamByAccount(int account_id);
}
