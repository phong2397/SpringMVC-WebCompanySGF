package com.sgfintech.dao;


import com.sgfintech.entity.DetailTransaction;
import com.sgfintech.util.ConfigGateway;
import org.apache.log4j.Logger;
import org.hibernate.Query;
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
@Repository(value = "detailTransactionDAO")
@Transactional(rollbackFor = Exception.class)
public class DetailTransactionDAO {
    private static final Logger log = Logger.getLogger(DetailTransactionDAO.class);
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public void update(final DetailTransaction dt) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(dt);
    }

    public void save(final DetailTransaction detailTransaction) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(detailTransaction);
    }

    public DetailTransaction findById(long id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(DetailTransaction.class, id);
    }

    public List<DetailTransaction> findAll(int page) {
        log.info("List Detailtransaction - Findall - paging ");
        Session session = this.sessionFactory.getCurrentSession();
        String countQ = "select count (f.id) from DetailTransaction f";
        Query countQuery = session.createQuery(countQ);
        Long countResults = (Long) countQuery.uniqueResult();
        int pageSize = ConfigGateway.getPAGING();
        int lastPageNumber = (int) (Math.ceil(countResults / pageSize));
        if (lastPageNumber < 1) {
            lastPageNumber = 1;
        }
        if (page > lastPageNumber) {
            page = lastPageNumber;
        }
        Query query = session.createQuery("from DetailTransaction order by dateRequest desc");
        query.setFirstResult(0);
        query.setMaxResults(pageSize * page);
        List<DetailTransaction> fooList = query.list();
        log.info("List Detailtransaction : " + fooList);
        return fooList;
    }

    public List<DetailTransaction> findAllByActive(int page) {
        log.info("List Detailtransaction - Findall status Active - paging ");
        Session session = this.sessionFactory.getCurrentSession();
        String countQ = "select count (f.id) from DetailTransaction f";
        Query countQuery = session.createQuery(countQ);
        Long countResults = (Long) countQuery.uniqueResult();
        int pageSize = ConfigGateway.getPAGING();
        int lastPageNumber = (int) (Math.ceil(countResults / pageSize));
        if (lastPageNumber < 1) {
            lastPageNumber = 1;
        }
        if (page > lastPageNumber) {
            page = lastPageNumber;
        }
        Query query = session.createQuery("from DetailTransaction where status = ?1 order by dateRequest desc");
        query.setParameter(1, "active");
        query.setFirstResult(0);
        query.setMaxResults(pageSize * page);
        List<DetailTransaction> fooList = query.list();
        log.info("List Detailtransaction : " + fooList);
        return fooList;
    }

    public List<DetailTransaction> findAllByDone(int page) {
        log.info("List Detailtransaction - Findall status Active - paging ");
        Session session = this.sessionFactory.getCurrentSession();
        String countQ = "select count (f.id) from DetailTransaction f";
        Query countQuery = session.createQuery(countQ);
        Long countResults = (Long) countQuery.uniqueResult();
        int pageSize = ConfigGateway.getPAGING();
        int lastPageNumber = (int) (Math.ceil(countResults / pageSize));
        if (lastPageNumber < 1) {
            lastPageNumber = 1;
        }
        if (page > lastPageNumber) {
            page = lastPageNumber;
        }
        Query query = session.createQuery("from DetailTransaction where status = ?1 order by dateRequest desc");
        query.setParameter(1, "done");
        query.setFirstResult(0);
        query.setMaxResults(pageSize * page);
        List<DetailTransaction> fooList = query.list();
        log.info("List Detailtransaction : " + fooList);
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
