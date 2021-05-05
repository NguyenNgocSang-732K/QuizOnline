package com.services;

import java.util.List;

import com.model.entities.AccountExam;

public interface IAccountExamService {
    List<AccountExam> FindAllValid(int page, int pageSize);

    AccountExam FindById(int id);

    AccountExam Update(AccountExam accountExam);

    AccountExam Create(AccountExam accountExam);
}
