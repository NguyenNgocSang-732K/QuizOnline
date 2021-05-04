package com.services;

import java.util.List;

import com.model.entities.StudentAnswer;

public interface IStudentAnswerService {
    List<StudentAnswer> FetAll(int page, int pageSize);

    StudentAnswer FindById(int id);

    StudentAnswer Update(StudentAnswer studentAnswer);

    StudentAnswer Create(StudentAnswer studentAnswer);
    
    List<StudentAnswer> CreateRange(List<StudentAnswer> studentAnswers);
    
    StudentAnswer FindStudentAnswerByAccountExamQuestion(int accountId, int examQuestionId);
}
