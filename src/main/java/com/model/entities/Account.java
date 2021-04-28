package com.model.entities;
// Generated Apr 29, 2021, 1:44:15 AM by Hibernate Tools 5.1.10.Final

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
 * Account generated by hbm2java
 */
@Entity
@Table(name = "account", schema = "dbo", catalog = "quizonline")
public class Account implements java.io.Serializable {

	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String photo;
	private String email;
	private String phone;
	private String address;
	private int isActive;
	private String otp;
	private int accountType;
	private Date createdDate;
	private int createdBy;
	private int status;
	private Set<AccountExam> accountExams = new HashSet<AccountExam>(0);
	private Set<StudentAnswer> studentAnswers = new HashSet<StudentAnswer>(0);

	public Account() {
	}

	public Account(String username, String password, String fullname, String email, String phone, int isActive,
			int accountType, Date createdDate, int createdBy, int status) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.isActive = isActive;
		this.accountType = accountType;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
	}

	public Account(String username, String password, String fullname, String photo, String email, String phone,
			String address, int isActive, String otp, int accountType, Date createdDate, int createdBy, int status,
			Set<AccountExam> accountExams, Set<StudentAnswer> studentAnswers) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.photo = photo;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.isActive = isActive;
		this.otp = otp;
		this.accountType = accountType;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.status = status;
		this.accountExams = accountExams;
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

	@Column(name = "username", nullable = false, length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 250)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "fullname", nullable = false, length = 250)
	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	@Column(name = "photo", length = 250)
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "email", nullable = false, length = 250)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", nullable = false, length = 12)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "address", length = 250)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "isActive", nullable = false)
	public int getIsActive() {
		return this.isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Column(name = "otp", length = 10)
	public String getOtp() {
		return this.otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	@Column(name = "account_Type", nullable = false)
	public int getAccountType() {
		return this.accountType;
	}

	public void setAccountType(int accountType) {
		this.accountType = accountType;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<AccountExam> getAccountExams() {
		return this.accountExams;
	}

	public void setAccountExams(Set<AccountExam> accountExams) {
		this.accountExams = accountExams;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<StudentAnswer> getStudentAnswers() {
		return this.studentAnswers;
	}

	public void setStudentAnswers(Set<StudentAnswer> studentAnswers) {
		this.studentAnswers = studentAnswers;
	}

}
