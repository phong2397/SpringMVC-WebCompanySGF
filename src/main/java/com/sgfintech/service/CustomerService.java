package com.sgfintech.service;

import com.sgfintech.entity.Customer;
import com.sgfintech.mapper.CustomerMapper;
import com.sgfintech.util.StringUtil;
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
public class CustomerService {
    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    public Customer getCustomerByPhone(String phone) {
        Customer c = null;
        String sql = "select * from sgft_customer where customer_phone = ?";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{phone};
            c = jdbcTemplate.queryForObject(sql, param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        return cu;
                    });
        } catch (Exception ex) {
            c = null;
        }
        return c;
    }


}
