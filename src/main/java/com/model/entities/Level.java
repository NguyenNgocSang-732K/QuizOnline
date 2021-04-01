package com.model.entities;
// Generated Apr 1, 2021, 9:46:29 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Level generated by hbm2java
 */
@Entity
@Table(name = "level", schema = "dbo", catalog = "quizonline")
public class Level implements java.io.Serializable {

	private Integer id;
	private String name;
	private Date createdDate;
	private int createdBy;
	private int status;
	private Set<Question> questions = new HashSet<Question>(0);
	private Set<Exam> exams = new HashSet<Exam>(0);

	public Level() {
	}

	public Level(String name, Date createdDate, int createdBy, int status) {
		this.name = name;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
	}

	public Level(String name, Date createdDate, int createdBy, int status, Set<Question> questions, Set<Exam> exams) {
		this.name = name;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.questions = questions;
		this.exams = exams;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created_Date", nullable = false, length = 10)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "created_By", nullable = false)
	public int getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name = "status", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "level")
	public Set<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "level")
	public Set<Exam> getExams() {
		return this.exams;
	}

	public void setExams(Set<Exam> exams) {
		this.exams = exams;
	}

}
