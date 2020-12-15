package com.sgfintech.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class SaRequestService {

    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;



}
