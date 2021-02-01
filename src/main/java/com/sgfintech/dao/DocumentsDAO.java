package com.sgfintech.dao;

import com.sgfintech.entity.Customer;
import com.sgfintech.entity.Documents;
import com.sgfintech.entity.Product;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository(value = "documentsDAO")
@Transactional(rollbackFor = Exception.class)
public class DocumentsDAO {
    private static final Logger log = Logger.getLogger(DocumentsDAO.class);
    @Autowired
    private SessionFactory sessionFactory;

    public void save(final Documents documents) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(documents);
    }

    public void update(final Documents documents) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(documents);
    }

    public Documents findById(final int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Documents.class, id);
    }

    public List<Documents> findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("FROM Documents", Documents.class).getResultList();
    }
}
