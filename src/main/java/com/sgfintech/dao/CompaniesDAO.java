package com.sgfintech.dao;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Queue;

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

    public long countCompanyByCode(String companyCode) {
        Session session = this.sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Long> cr = cb.createQuery(Long.class);
        Root<Companies> items = cr.from(Companies.class);
        cr.select(cb.count(items)).where(cb.equal(items.get("companyCode"), companyCode));
        Query<Long> query = session.createQuery(cr);
        List<Long> itemProjected = query.getResultList();
        return itemProjected.get(0);
    }

    public void save(Companies companies) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(companies);
    }
}
