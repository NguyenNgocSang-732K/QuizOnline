package com.repository;

import com.model.entities.AccountExam;
import com.model.entities.Subject;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("accountExamRepository")
public interface AccountExamRepository extends JpaRepository<AccountExam, Integer> {

}
