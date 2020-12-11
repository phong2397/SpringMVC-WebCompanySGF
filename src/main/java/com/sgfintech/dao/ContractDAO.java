package com.sgfintech.dao;

import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
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
@Repository(value = "contractDAO")
@Transactional(rollbackFor = Exception.class)
public class ContractDAO {
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public void save(final Contract ct) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(ct);
    }

    public void update(final Contract ct) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(ct);
    }

    public List<Contract> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM Contract", Contract.class).getResultList();
    }
}
