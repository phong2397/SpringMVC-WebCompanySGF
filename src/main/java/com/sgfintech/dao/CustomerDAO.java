package com.sgfintech.dao;

import com.sgfintech.entity.Customer;
import org.hibernate.*;
import org.hibernate.query.Query;
import org.hibernate.resource.transaction.spi.TransactionStatus;
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
@Repository(value = "customerDAO")
@Transactional(rollbackFor = Exception.class)
public class CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(final Customer customer) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(customer);
    }

    public void update(final Customer customer) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(customer);
    }

    public Customer findById(final int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Customer.class, id);
    }

    public List<Customer> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM Customer", Customer.class).getResultList();
    }

    public void saveAll(final List<Customer> list) {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.getTransaction();
        for (int i = 0; i < list.size() ; i++) {
            Customer c = list.get(i);
            session.save(c);
            if (i % 50 == 0) {
                session.flush();
                session.clear();
            }
        }
        tx.commit();
        session.close();
    }

    public void updateAll(final List<Customer> list) {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.getTransaction();
        ScrollableResults customers = session.getNamedQuery("GetCustomers")
                .setCacheMode(CacheMode.IGNORE)
                .scroll(ScrollMode.FORWARD_ONLY);

    }

    public void saveAllStateless(final List<Customer> list) {
        StatelessSession statelessSession = sessionFactory.openStatelessSession();
        for (Customer c :
                list) {
            statelessSession.insert(c);
        }
        statelessSession.close();
    }

    public List<Customer> getAllItemByCode(String companyCode) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Customer> cr = cb.createQuery(Customer.class);
            Root<Customer> root = cr.from(Customer.class);
            cr.select(root).where(cb.equal(root.get("companyCode"), companyCode));
            Query<Customer> query = session.createQuery(cr);
            List<Customer> result = query.getResultList();
            return result;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public Customer findByPhone(String phone) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Customer> cr = cb.createQuery(Customer.class);
            Root<Customer> root = cr.from(Customer.class);
            cr.select(root).where(cb.equal(root.get("customerPhone"), phone));
            Query<Customer> query = session.createQuery(cr);
            Customer result = query.getSingleResult();
            return result;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }


}
