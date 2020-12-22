package com.sgfintech.service;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.mapper.CompanyMapper;
import com.sgfintech.mapper.ContractMapper;
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


    @SuppressWarnings("nonchecked")
    public List<CustomerHandler> searchCustomer(String customerName,String customerId,String customerPhone) {
        String sql = "select com.*,cu.* from sgft_companies com,sgft_customer cu where  com.company_code = cu.company_code  " +
                "and cu.customer_name like ? and cu.customer_phone like ?  and cu.customer_id like ? ";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{"%" + customerName + "%","%" + customerPhone + "%","%" + customerId + "%"};
            List<CustomerHandler> resultList = jdbcTemplate.query(sql,param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new CustomerHandler(cu,com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    @SuppressWarnings("nonchecked")
    public List<CustomerHandler> searchCustomerCompany(String companyCode) {
        String sql = "select com.*,cu.* from sgft_companies com,sgft_customer cu where  com.company_code = cu.company_code  " +
                "and com.company_code like ? ";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{"%" + companyCode + "%"};
            List<CustomerHandler> resultList = jdbcTemplate.query(sql,param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new CustomerHandler(cu,com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<CustomerHandler> getDataCustomer() {
        String sql = "select com.*,cu.* from sgft_companies com,sgft_customer cu where  com.company_code = cu.company_code ";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{};
            List<CustomerHandler> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                      Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new CustomerHandler(cu,com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<MergeDataOrder> getData(String status) {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com  where sa.company_code = com.company_code and sa.company_code  = cu.company_code and sa.customer_phone = cu.customer_phone and date_format(sa.created_date , '%Y %M %d') = date_format(sysdate(),'%Y %M %d') and sa.status=?";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{status};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1, true);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s,com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<MergeDataOrder> getDataShow(String status, boolean nodate) {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com where sa.company_code = com.company_code and sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status=?";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{status};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1, true);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s,com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<MergeDataWithdraw> getDataWithdraw(String status, boolean nodate, String date) { //no check date = true
        String sql = "";
        Object[] param = null;
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        if (nodate == true) {
            sql = "select cu.*, co.*,com.* from sgft_customer cu , sgft_contract co, sgft_companies com where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code  and co.status=?";
            param = new Object[]{status};
        } else {
            sql = "select cu.*, co.*,com.* from sgft_customer cu , sgft_contract co, sgft_companies com where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code and co.status=? and date_format(co.created_date , '%Y %M %d') = date_format(?,'%Y %M %d')";
            param = new Object[]{status, date};
        }
        try {
            List<MergeDataWithdraw> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Contract co = new ContractMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataWithdraw(cu, co, com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

}
