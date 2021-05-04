package com.services;

import com.model.entities.AccountExam;
import com.repository.AccountExamRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("accountExamService")
public class AccountExamService implements IAccountExamService {

	@Qualifier("accountExamRepository")
	private @Autowired AccountExamRepository _accountExamRepository;

	@Override
	public List<AccountExam> FindAllValid(int page, int pageSize) {
		return null;
	}

	@Override
	public AccountExam FindById(int id) {
		// TODO Auto-generated method stub
		Optional<AccountExam> accountExam = _accountExamRepository.findById(id);
		if (accountExam.isEmpty())
			return null;
		return accountExam.get();
	}

	@Override
	public AccountExam Update(AccountExam editing) {
		AccountExam accountExam = this.FindById(editing.getId());
		if (accountExam == null) {
			return null;
		}
		//--
		
		
		//--
		AccountExam subjectSaved = _accountExamRepository.save(accountExam);
		return subjectSaved;
	}

	@Override
	public AccountExam Create(AccountExam accountExam) {
		// TODO Auto-generated method stub
		return _accountExamRepository.save(accountExam);
	}


}
