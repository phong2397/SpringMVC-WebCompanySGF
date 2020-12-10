package com.sgfintech.service;

import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.handler.MergeData;
import com.sgfintech.mapper.CustomerMapper;
import com.sgfintech.mapper.SaRequestMapper;
import com.sgfintech.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class MergeDataService {
    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    public List<MergeData> getDataShow(String status) {
        String sql = "select sa.*, cu.* from sgft_sa_request sa, sgft_customer cu where sa.company_code  = cu.company_code and sa.customer_phone = cu.customer_phone and date_format(sa.created_date , '%Y %M %d') = date_format(sysdate(),'%Y %M %d') and sa.status=?";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{ status };
            List<MergeData> resultList = jdbcTemplate.query(sql,param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs,arg1, true);
                        SaRequest s = new SaRequestMapper().mapRow(rs,arg1);
                        return new MergeData(c, s);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }
    
     public List<MergeData> getDataShow(String status, boolean nodate) {
        String sql = "select sa.*, cu.* from sgft_sa_request sa, sgft_customer cu where sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status=?";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{ status };
            List<MergeData> resultList = jdbcTemplate.query(sql,param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs,arg1, true);
                        SaRequest s = new SaRequestMapper().mapRow(rs,arg1);
                        return new MergeData(c, s);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

}
