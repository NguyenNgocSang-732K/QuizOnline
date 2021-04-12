package com.model.entities;
// Generated Apr 9, 2021, 9:14:06 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Exam generated by hbm2java
 */
@Entity
@Table(name = "exam", schema = "dbo", catalog = "quizonline")
public class Exam implements java.io.Serializable {

	private Integer id;
	private Level level;
	private Subject subject;
	private String code;
	private String name;
	private int status;
	private Date createdDate;
	private int createdBy;
	private Set<AccountExam> accountExams = new HashSet<AccountExam>(0);
	private Set<ExamQuestion> examQuestions = new HashSet<ExamQuestion>(0);

	public Exam() {
	}

	public Exam(Level level, Subject subject, String code, String name, int status, Date createdDate, int createdBy) {
		this.level = level;
		this.subject = subject;
		this.code = code;
		this.name = name;
		this.status = status;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
	}

	public Exam(Level level, Subject subject, String code, String name, int status, Date createdDate, int createdBy,
			Set<AccountExam> accountExams, Set<ExamQuestion> examQuestions) {
		this.level = level;
		this.subject = subject;
		this.code = code;
		this.name = name;
		this.status = status;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.accountExams = accountExams;
		this.examQuestions = examQuestions;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "level_Id", nullable = false)
	public Level getLevel() {
		return this.level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subject_Id", nullable = false)
	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@Column(name = "code", nullable = false, length = 100)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "status", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "exam")
	public Set<AccountExam> getAccountExams() {
		return this.accountExams;
	}

	public void setAccountExams(Set<AccountExam> accountExams) {
		this.accountExams = accountExams;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "exam")
	public Set<ExamQuestion> getExamQuestions() {
		return this.examQuestions;
	}

	public void setExamQuestions(Set<ExamQuestion> examQuestions) {
		this.examQuestions = examQuestions;
	}

}
