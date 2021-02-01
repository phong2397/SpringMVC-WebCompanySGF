package com.sgfintech.dao;

import com.sgfintech.entity.Contract;
import org.apache.log4j.Logger;
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
    private static final Logger log = Logger.getLogger(ContractDAO.class);
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

    public Contract findById(final long id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Contract.class, id);
    }
}
