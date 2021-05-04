package com.services;

import java.util.List;

import com.model.entities.Subject;

public interface ISubjectService {
    List<Subject> GetAll(int page, int pageSize, String searchText);

    Subject FindById(int id);

    Subject Update(Subject subject);

    Subject Create(Subject subject);
}
