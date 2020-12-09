package com.sgfintech.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Repository(value = "contractDAO")
@Transactional(rollbackFor = Exception.class)
public class ContractDAO {
    @Autowired
    private SessionFactory sessionFactory;


}
