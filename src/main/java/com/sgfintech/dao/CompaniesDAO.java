package com.sgfintech.dao;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Repository(value = "companiesDAO")
@Transactional(rollbackFor = Exception.class)
public class CompaniesDAO {
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public void update(final Companies ct) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(ct);
    }

    public Companies findById(final int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Companies.class, id);
    }

    public List<Companies> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("from Companies", Companies.class).getResultList();
    }
}
