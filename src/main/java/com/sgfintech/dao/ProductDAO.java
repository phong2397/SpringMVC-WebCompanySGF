package com.sgfintech.dao;

import com.sgfintech.entity.Customer;
import com.sgfintech.entity.Product;
import com.sgfintech.entity.SaRequest;
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

    public void save(final Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(product);
    }

    public void update(final Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(product);
    }

    public Product findById(final long id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.find(Product.class, id);
    }

    public List<Product> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM Product", Product.class).getResultList();
    }
}
