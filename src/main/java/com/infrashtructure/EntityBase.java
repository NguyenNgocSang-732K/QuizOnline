package com.infrashtructure;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;

import java.util.Date;
import javax.persistence.*;

@MappedSuperclass
public abstract class EntityBase implements Serializable {

	public EntityBase() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	protected Integer id;

//	@Column(name = "Status")
//	protected Integer status;
//
//	@Temporal(TemporalType.DATE)
//	@Column(name = "Create_Date")
//	protected Date createDate;
//	
//	@Column(name = "Create_By")
//	protected int createBy;

	@Column(name = "Status")
	public abstract int getStatus();

	public abstract void setStatus(int status);

	@Temporal(TemporalType.DATE)
	@Column(name = "Create_Date")
	public abstract Date getCreateDate();

	public abstract void setCreateDate(Date createDate);
	
	@Column(name = "Create_By")
	public abstract int getCreateBy();

	public abstract void setCreateBy(int createBy);
}
