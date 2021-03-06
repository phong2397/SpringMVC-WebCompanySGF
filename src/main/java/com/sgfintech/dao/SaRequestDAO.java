package com.sgfintech.dao;

import com.sgfintech.entity.SaRequest;
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
@Repository(value = "saRequestDAO")
@Transactional(rollbackFor = Exception.class)
public class SaRequestDAO {
    private static final Logger log = Logger.getLogger(SaRequestDAO.class);
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public void save(final SaRequest s) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(s);
    }

    public void update(final SaRequest s) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(s);
    }

    public SaRequest findById(final long id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.find(SaRequest.class, id);
    }

    public List<SaRequest> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM SaRequest", SaRequest.class).getResultList();
    }
}
