package com.model.entities;
// Generated Feb 24, 2021, 12:21:22 AM by Hibernate Tools 4.3.5.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.infrashtructure.EntityBase;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Role generated by hbm2java
 */
@Data
@Entity
@EqualsAndHashCode(callSuper = true)
@Table(name = "role", catalog = "quizonline")
public class Role extends EntityBase implements java.io.Serializable {

	private Integer id;
	private String name;
	private boolean status;
	private Date createDate;
	private Set<RoleAccount> roleAccounts = new HashSet<RoleAccount>(0);

	public Role() {
	}

	public Role(String name, boolean status, Date createDate) {
		this.name = name;
		this.status = status;
		this.createDate = createDate;
	}

	public Role(String name, boolean status, Date createDate, Set<RoleAccount> roleAccounts) {
		this.name = name;
		this.status = status;
		this.createDate = createDate;
		this.roleAccounts = roleAccounts;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "Name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "Create_Date", nullable = false, length = 10)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role", cascade = CascadeType.ALL)
	public Set<RoleAccount> getRoleAccounts() {
		return this.roleAccounts;
	}

	public void setRoleAccounts(Set<RoleAccount> roleAccounts) {
		this.roleAccounts = roleAccounts;
	}

}