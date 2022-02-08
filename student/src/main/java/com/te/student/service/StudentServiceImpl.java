package com.te.student.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.te.student.bean.StudentsDetail;
import com.te.student.dao.StudentDaoImplementation;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDaoImplementation dao;

	@Override
	public StudentsDetail authenticate(int id, String password) {
		if (id < 0) {
			return null;
		}
		return dao.authenticate(id, password);
	}

	@Override
	public boolean addStudent(StudentsDetail detail) {

		return dao.addStudent(detail);
	}

	@Override
	public boolean update(StudentsDetail detail, int id) {

		return dao.update(detail, id);
	}

	@Override
	public List<StudentsDetail> getAllDetails() {
		return dao.getAllDetails();
	}

	@Override
	public boolean delete(int id) {

		return dao.delete(id);

	}

	@Override
	public StudentsDetail getDetails(int id) {

		if (id <= 0) {
			return null;
		} else {
			return dao.getDetails(id);
		}

	}

}
