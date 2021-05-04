package com.services;

import java.util.List;

import com.model.entities.Exam;

public interface IExamService {

	List<Exam> FindExamsByLevelSubjectAccount(int levelId, int subjectId, int accountId);

	Exam GetExamForUser(int levelId, int subjectId, int accountId);

	Exam CreateExamForUser(int leveld, int subjectId, int accountId, int quantityQuestion);

	Exam FindById(int id);

	Exam Update(Exam exam);

	Exam Create(Exam exam);

}
