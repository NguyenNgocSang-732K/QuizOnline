package com.model.entities;
// Generated Apr 29, 2021, 1:44:15 AM by Hibernate Tools 5.1.10.Final

import java.math.BigDecimal;
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
 * Question generated by hbm2java
 */
@Entity
@Table(name = "question", schema = "dbo", catalog = "quizonline")
public class Question implements java.io.Serializable {

	private Integer id;
	private Level level;
	private Subject subject;
	private String content;
	private Integer answerType;
	private String image;
	private BigDecimal score;
	private Date createdDate;
	private int createdBy;
	private int status;
	private Set<Answer> answers = new HashSet<Answer>(0);
	private Set<ExamQuestion> examQuestions = new HashSet<ExamQuestion>(0);

	public Question() {
	}

	public Question(Level level, Subject subject, String content, BigDecimal score, Date createdDate, int createdBy, int status) {
		this.level = level;
		this.subject = subject;
		this.content = content;
		this.score = score;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
	}

	public Question(Level level, Subject subject, String content, Integer answerType, String image, BigDecimal score,
			Date createdDate, int createdBy, int status, Set<Answer> answers, Set<ExamQuestion> examQuestions) {
		this.level = level;
		this.subject = subject;
		this.content = content;
		this.answerType = answerType;
		this.image = image;
		this.score = score;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.answers = answers;
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

	@Column(name = "content", nullable = false)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "answer_Type")
	public Integer getAnswerType() {
		return this.answerType;
	}

	public void setAnswerType(Integer answerType) {
		this.answerType = answerType;
	}

	@Column(name = "image", length = 100)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column(name = "score", nullable = false, precision = 5, scale = 1)
	public BigDecimal getScore() {
		return this.score;
	}

	public void setScore(BigDecimal score) {
		this.score = score;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "question")
	public Set<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "question")
	public Set<ExamQuestion> getExamQuestions() {
		return this.examQuestions;
	}

	public void setExamQuestions(Set<ExamQuestion> examQuestions) {
		this.examQuestions = examQuestions;
	}

}
