package com.sgfintech.service;

import com.sgfintech.controller.ApprovalController;
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
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import java.sql.Blob;
import java.util.List;
import java.util.Map;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class MergeDataService {

    private static final Logger log = Logger.getLogger(MergeDataService.class);

    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    @SuppressWarnings("nonchecked")
    public List<CustomerHandler> searchCustomer(String customerName, String customerId, String customerPhone) {
        log.info("Merge data from customer and company - Search");
        String sql = "select com.*,cu.* from sgft_companies com,sgft_customer cu where  com.company_code = cu.company_code  " +
                "and cu.customer_name like ? and cu.customer_phone like ?  and cu.customer_id like ? ";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{"%" + customerName + "%", "%" + customerPhone + "%", "%" + customerId + "%"};
            List<CustomerHandler> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new CustomerHandler(cu, com);
                    });
            log.info("Result List searchCustomer: " + resultList);
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    @SuppressWarnings("nonchecked")
    public List<CustomerHandler> searchCustomerCompany(String companyCode, String companyName) {
        log.info("Merge data from customer and company - searchCustomerCompany");
        String sql = "select com.*,cu.* from sgft_companies com,sgft_customer cu where  com.company_code = cu.company_code  " +
                "and com.company_code like ? and com.company_name like ?";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{"%" + companyCode + "%", "%" + companyName + "%"};
            List<CustomerHandler> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new CustomerHandler(cu, com);
                    });
            log.info("Result List searchCustomerCompany: " + resultList);
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<CustomerHandler> getDataCustomer() {
        log.info("List CustomerHandler (company and customer) - getDataCustomer");
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
                        log.info("");
                        return new CustomerHandler(cu, com);
                    });
            log.info("Result List getDataCustomer: " + resultList);
            return resultList;

        } catch (Exception ex) {
            log.error(ex.getMessage());
            return null;
        }
    }

//    public List<MergeDataOrder> getData(String status) {
//        log.info("List MergeDataOrder (saRequest and company and customer) - getData  ");
//        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com  where sa.company_code = com.company_code and sa.company_code  = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status=? ORDER BY sa.id DESC";
//        if (StringUtil.isEmpty(jdbcTemplate)) {
//            jdbcTemplate = new JdbcTemplate(dataSource);
//        }
//        try {
//
//            Object[] param = new Object[]{status};
//            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
//                    (rs, arg1) -> {
//                        Customer c = new CustomerMapper().mapRow(rs, arg1);
//                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
//                        Companies com = new CompanyMapper().mapRow(rs, arg1);
//                        return new MergeDataOrder(c, s, com);
//                    });
//            log.info("Result List getData: " + resultList);
//            return resultList;
//        } catch (Exception ex) {
//            return null;
//        }
//    }

    public List<MergeDataOrder> getDataTongTiepNhan() {
        log.info("List MergeDataOrder (saRequest and company and customer) - getDataTongTiepNhan ");
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com  where sa.company_code = com.company_code and sa.company_code  = cu.company_code and sa.customer_phone = cu.customer_phone ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            log.info("Result list getDataTongTiepNhan: " + resultList);
            return resultList;
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }


    public List<MergeDataOrder> getUser() {
        log.info("List MergeDataOrder (saRequest and company and customer) - getUser(Thamdinh or Kyduyet)");
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com where cu.company_code = com.company_code and sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone  ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            log.info("Result list getUserThamdinh: " + resultList);
            return resultList;
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }

    public List<MergeDataOrder> findhistoryModal(String phone) {
        log.info("List MergeDataOrder (saRequest and company and customer) - findhistoryModal ");
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com where cu.company_code = com.company_code and sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone and sa.customer_phone = ? ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{phone};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            log.info("Result list findhistoryModal: " + resultList);
            return resultList;
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }

    public List<MergeDataWithdraw> getContractModal(String customerPhone) {
        log.info("List MergeDataOrder (contract and company and customer) - getContractModal - req param customerPhone ");
        String sql = "select co.*,cu.*,com.* from sgft_contract co,sgft_customer cu ,  sgft_companies com where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code and co.customer_phone=? ORDER BY co.id_contract DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{customerPhone};
            List<MergeDataWithdraw> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer cu = new CustomerMapper().mapRow(rs, arg1);
                        Contract co = new ContractMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataWithdraw(cu, co, com);
                    });
            log.info("Result list findhistoryModal: " + resultList);
            return resultList;
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }


    public List<MergeDataWithdraw> getDataWithdraw(String status, boolean nodate, String date) { //no check date = true
        log.info("List MergeDataWithdraw (contract and company and customer) - getDataWithdraw ");
        String sql = "";
        Object[] param = null;
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        if (nodate == true) {
            sql = "select co.*,cu.*,com.* from sgft_contract co,sgft_customer cu ,  sgft_companies com where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code and co.status= ?  ORDER BY co.id_contract DESC";
            param = new Object[]{status};
        } else {
            sql = "select co.*,cu.*,com.* from sgft_contract co,sgft_customer cu ,  sgft_companies com where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code and co.status=? and date_format(co.created_date , '%Y %M %d') = date_format(?,'%Y %M %d') ORDER BY co.id_contract DESC";
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
            log.info("Result list getDataWithdraw: " + resultList);
            return resultList;
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }


}
