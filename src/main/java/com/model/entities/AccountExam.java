package com.model.entities;
// Generated Apr 21, 2021, 6:14:42 PM by Hibernate Tools 5.1.10.Final

import java.math.BigDecimal;
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
 * AccountExam generated by hbm2java
 */
@Entity
@Table(name = "account_exam", schema = "dbo", catalog = "quizonline")
public class AccountExam implements java.io.Serializable {

	private Integer id;
	private Account account;
	private Exam exam;
	private BigDecimal score;
	private int answer_correct;
	private int answer_uncorrect;
	private Date createdDate;
	private int status;

	public AccountExam() {
	}

	public AccountExam(Account account, Exam exam, BigDecimal score, int answer_correct,
			int answer_uncorrect, Date createdDate, int status) {
		this.account = account;
		this.exam = exam;
		this.score = score;
		this.answer_correct = answer_correct;
		this.answer_uncorrect = answer_uncorrect;
		this.createdDate = createdDate;
		this.status = status;
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
	@JoinColumn(name = "exam_Id", nullable = false)
	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	@Column(name = "score", nullable = false, precision = 5, scale = 1)
	public BigDecimal getScore() {
		return this.score;
	}

	public void setScore(BigDecimal score) {
		this.score = score;
	}
	
	@Column(name = "answer_correct")
	public int getAnswer_correct() {
		return answer_correct;
	}

	public void setAnswer_correct(int answer_correct) {
		this.answer_correct = answer_correct;
	}

	@Column(name = "answer_uncorrect")
	public int getAnswer_uncorrect() {
		return answer_uncorrect;
	}

	public void setAnswer_uncorrect(int answer_uncorrect) {
		this.answer_uncorrect = answer_uncorrect;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created_Date", nullable = false, length = 10)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "status", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
