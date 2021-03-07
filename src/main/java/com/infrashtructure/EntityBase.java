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
	private Integer id;

	@Column(name = "Status")
	private boolean status;

	@Temporal(TemporalType.DATE)
	@Column(name = "Create_Date")
	private Date createDate;

//	public abstract Integer getId();
//
//	public abstract void setId(Integer id);

	public abstract boolean isStatus();

	public abstract void setStatus(boolean status);
	
	public abstract Date getCreateDate();

	public abstract void setCreateDate(Date createDate);
}
