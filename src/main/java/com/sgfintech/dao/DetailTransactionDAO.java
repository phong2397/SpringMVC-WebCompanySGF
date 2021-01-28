package com.sgfintech.dao;


import com.sgfintech.entity.DetailTransaction;
import com.sgfintech.util.ConfigGateway;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Repository(value = "detailTransactionDAO")
@Transactional(rollbackFor = Exception.class)
public class DetailTransactionDAO {
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public void update(final DetailTransaction dt) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(dt);
    }

    public List<DetailTransaction> findAll(int page) {
        Session session = this.sessionFactory.getCurrentSession();
        String countQ = "select count (f.id) from DetailTransaction f";
        Query countQuery = session.createQuery(countQ);
        Long countResults = (Long) countQuery.uniqueResult();
        int pageSize = ConfigGateway.getPAGING();
        int lastPageNumber = (int) (Math.ceil(countResults / pageSize));
        if (page > lastPageNumber) {
            page = lastPageNumber;
        }
        Query query =  session.createQuery("from DetailTransaction order by dateRequest desc");
        query.setFirstResult(0);
        query.setMaxResults(pageSize*page);
        List<DetailTransaction> fooList = query.list();
        return fooList;
    }
//
//    @Test
//    public void givenEntitiesExist_whenRetrievingLastPage_thenCorrectSize() {
//        int pageSize = 10;
//        String countQ = "Select count (f.id) from Foo f";
//        Query countQuery = session.createQuery(countQ);
//        Long countResults = (Long) countQuery.uniqueResult();
//        int lastPageNumber = (int) (Math.ceil(countResults / pageSize));
//
//        Query selectQuery = session.createQuery("From Foo");
//        selectQuery.setFirstResult((lastPageNumber - 1) * pageSize);
//        selectQuery.setMaxResults(pageSize);
//        List<Foo> lastPage = selectQuery.list();
//
//        assertThat(lastPage, hasSize(lessThan(pageSize + 1)));
//    }


}
