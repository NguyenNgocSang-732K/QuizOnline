package com.repository;

import com.model.entities.Level;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("levelRepository")
public interface LevelRepository extends JpaRepository<Level, Integer> {
	List<Level> findLevelByStatusOrderByStt(int status);
}
