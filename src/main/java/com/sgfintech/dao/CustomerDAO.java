package com.sgfintech.dao;

import com.sgfintech.entity.Customer;
import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
        Transaction tx = session.beginTransaction();
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
        Transaction tx = session.beginTransaction();
        ScrollableResults customers = session.getNamedQuery("GetCustomers")
                .setCacheMode(CacheMode.IGNORE)
                .scroll(ScrollMode.FORWARD_ONLY);

    }

    public void saveAllStateless(final List<Customer> list) {
        StatelessSession statelessSession = sessionFactory.openStatelessSession();
        Transaction tx = statelessSession.beginTransaction();
        for (Customer c :
                list) {
            statelessSession.insert(c);
        }
        tx.commit();
        statelessSession.close();
    }


}
