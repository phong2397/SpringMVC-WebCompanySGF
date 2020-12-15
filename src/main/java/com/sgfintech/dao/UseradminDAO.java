package com.sgfintech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Repository(value = "useradminDAO")
@Transactional(rollbackFor = Exception.class)
public class UseradminDAO {
    @Autowired
    private SessionFactory sessionFactory;

}
