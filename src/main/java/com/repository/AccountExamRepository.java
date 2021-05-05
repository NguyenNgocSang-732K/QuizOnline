package com.repository;

import com.model.entities.AccountExam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("accountExamRepository")
public interface AccountExamRepository extends JpaRepository<AccountExam, Integer> {
}
