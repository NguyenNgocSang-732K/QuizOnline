package com.model.entities;
// Generated Apr 1, 2021, 9:46:29 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * StudentAnswer generated by hbm2java
 */
@Entity
@Table(name = "student_answer", schema = "dbo", catalog = "quizonline")
public class StudentAnswer implements java.io.Serializable {

	private Integer id;
	private Account account;
	private Answer answer;
	private ExamQuestion examQuestion;
	private Date createdDate;
	private int createdBy;

	public StudentAnswer() {
	}

	public StudentAnswer(Account account, ExamQuestion examQuestion, Date createdDate, int createdBy) {
		this.account = account;
		this.examQuestion = examQuestion;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
	}

	public StudentAnswer(Account account, Answer answer, ExamQuestion examQuestion, Date createdDate, int createdBy) {
		this.account = account;
		this.answer = answer;
		this.examQuestion = examQuestion;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
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
	@JoinColumn(name = "account_Id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "answer_Id")
	public Answer getAnswer() {
		return this.answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "exam_question_Id", nullable = false)
	public ExamQuestion getExamQuestion() {
		return this.examQuestion;
	}

	public void setExamQuestion(ExamQuestion examQuestion) {
		this.examQuestion = examQuestion;
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

}
