package com.sgfintech.dao;

import com.sgfintech.entity.Customer;
import com.sgfintech.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Repository(value = "productDAO")
@Transactional(rollbackFor = Exception.class)
public class ProductDAO {

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

    public Product findById(final int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Product.class, id);
    }

    public List<Product> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM Product", Product.class).getResultList();
    }
}
