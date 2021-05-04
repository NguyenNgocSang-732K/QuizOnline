package com.model.entities;
// Generated Apr 21, 2021, 6:14:42 PM by Hibernate Tools 5.1.10.Final

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
 * Answer generated by hbm2java
 */
@Entity
@Table(name = "answer", schema = "dbo", catalog = "quizonline")
public class Answer implements java.io.Serializable {

	private Integer id;
	private Question question;
	private String content;
	private boolean iscorrect;
	private Date createdDate;
	private int createdBy;
	private int status;
	private Set<StudentAnswer> studentAnswers = new HashSet<StudentAnswer>(0);

	public Answer() {
	}

	public Answer(Question question, String content, boolean iscorrect, Date createdDate, int createdBy, int status) {
		this.question = question;
		this.content = content;
		this.iscorrect = iscorrect;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
	}

	public Answer(Question question, String content, boolean iscorrect, Date createdDate, int createdBy, int status,
			Set<StudentAnswer> studentAnswers) {
		this.question = question;
		this.content = content;
		this.iscorrect = iscorrect;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.studentAnswers = studentAnswers;
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
	@JoinColumn(name = "question_Id", nullable = false)
	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	@Column(name = "content", nullable = false, length = 250)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "iscorrect", nullable = false)
	public boolean isIscorrect() {
		return this.iscorrect;
	}

	public void setIscorrect(boolean iscorrect) {
		this.iscorrect = iscorrect;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "answer")
	public Set<StudentAnswer> getStudentAnswers() {
		return this.studentAnswers;
	}

	public void setStudentAnswers(Set<StudentAnswer> studentAnswers) {
		this.studentAnswers = studentAnswers;
	}

}
