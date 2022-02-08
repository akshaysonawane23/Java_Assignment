package com.te.student.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class StudentsDetail implements Serializable {

	@Id
	private int id;

	private String name;
	private String address;
	private String password;

}
