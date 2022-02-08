package com.te.student.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.transaction.Transaction;

import org.springframework.stereotype.Repository;

import com.te.student.bean.StudentsDetail;

@Repository
public class StudentDaoImplementation implements StudentDao {

	@Override
	public StudentsDetail authenticate(int id, String password) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("unit01");
		EntityManager manager = factory.createEntityManager();
		StudentsDetail detail = manager.find(StudentsDetail.class, id);
		if (detail != null) {
			if (password.equals(detail.getPassword())) {
				return detail;
			}
		}
		return null;
	}

	@Override
	public boolean addStudent(StudentsDetail detail) {
		EntityTransaction transaction = null;
		boolean isAdded = false;
		try {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("unit01");
			EntityManager manager = factory.createEntityManager();
			transaction = manager.getTransaction();

			StudentsDetail detail2 = new StudentsDetail();
			detail2.setId(detail.getId());
			detail2.setName(detail.getName());
			detail2.setAddress(detail.getAddress());
			detail2.setPassword(detail.getPassword());

			transaction.begin();
			manager.persist(detail2);
			transaction.commit();
			isAdded = true;

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}

		return isAdded;
	}

	@Override
	public boolean update(StudentsDetail detail, int id) {
		boolean isUpdated = false;
		EntityTransaction transaction = null;

		try {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("unit01");
			EntityManager manager = factory.createEntityManager();
			transaction = manager.getTransaction();

			StudentsDetail detail3 = new StudentsDetail();
			detail3.setId(id);
			detail3.setName(detail.getName());
			detail3.setAddress(detail.getAddress());
			detail3.setPassword(detail.getPassword());

			transaction.begin();
			manager.persist(detail3);
			transaction.commit();
			isUpdated = true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}

		return isUpdated;
	}

	@Override
	public List<StudentsDetail> getAllDetails() {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory("unit01");
		EntityManager manager = factory.createEntityManager();

		Query query = manager.createQuery("from StudentsDetail");
		List<StudentsDetail> details = query.getResultList();

		return details;
	}

	@Override
	public boolean delete(int id) {
		boolean isDeleted = false;
		EntityTransaction transaction = null;

		try {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("unit01");
			EntityManager manager = factory.createEntityManager();
			transaction = manager.getTransaction();

			StudentsDetail detail = manager.find(StudentsDetail.class, id);

			transaction.begin();
			manager.remove(detail);
			transaction.commit();
			isDeleted = true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}

		return isDeleted;
	}

	@Override
	public StudentsDetail getDetails(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("unit01");
		EntityManager manager = factory.createEntityManager();

		StudentsDetail detail = manager.find(StudentsDetail.class, id);

		return detail;
	}
}