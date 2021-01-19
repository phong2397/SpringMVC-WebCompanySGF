package com.sgfintech.dao;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;


/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Repository(value = "useradminDAO")
@Transactional(rollbackFor = Exception.class)
public class UseradminDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public List<Useradmin> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("from Useradmin", Useradmin.class).getResultList();
    }

    public void update(final Useradmin useradmin) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(useradmin);
    }
    
    public Useradmin findById(final long id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.find(Useradmin.class, id);
    }

    public void save(Useradmin useradmin) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(useradmin);
    }
}
