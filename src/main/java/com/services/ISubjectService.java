package com.services;

import java.util.List;

import com.model.entities.Subject;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.SubjectInputModel;
import com.model.entityModels.SubjectModel;

public interface ISubjectService {
    PaginationModel<SubjectModel> GetAll(int page, int pageSize, String searchText);

    List<Subject> FindAllValid();

    Subject FindById(int id);

    Subject Update(SubjectInputModel subject);

    int Create(SubjectInputModel subjectModel, int userId);

    boolean UpdateStatus(int subjectId, boolean status);

}
