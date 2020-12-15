package com.sgfintech.dao;

import com.sgfintech.entity.Companies;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
}
