package com.te.student.dao;

import java.util.List;

import com.te.student.bean.StudentsDetail;

public interface StudentDao {
	public StudentsDetail authenticate(int id, String password);

	public boolean addStudent(StudentsDetail detail);

	public boolean update(StudentsDetail detail, int id);

	public List<StudentsDetail> getAllDetails();

	public boolean delete(int id);

	public StudentsDetail getDetails(int id);

}
