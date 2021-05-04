package com.repository;

import com.model.entities.Subject;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("subjectRepository")
public interface SubjectRepository extends JpaRepository<Subject, Integer> {

	Page<Subject> findAll(Pageable pageable);

	Page<Subject> findByNameContaining(String searchContent, Pageable pageable);
}
