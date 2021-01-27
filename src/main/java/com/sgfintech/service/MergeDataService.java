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
import java.sql.Blob;
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
    public List<CustomerHandler> searchCustomer(String customerName, String customerId, String customerPhone) {
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
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    @SuppressWarnings("nonchecked")
    public List<CustomerHandler> searchCustomerCompany(String companyCode, String companyName) {
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
                        return new CustomerHandler(cu, com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<MergeDataOrder> getData(String status) {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com  where sa.company_code = com.company_code and sa.company_code  = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status=? ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{status};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<MergeDataOrder> getDataTongTiepNhan() {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com  where sa.company_code = com.company_code and sa.company_code  = cu.company_code and sa.customer_phone = cu.customer_phone";
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
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public int countStatus(String status) {
        String sql = "select COUNT(sa.status) from sgft_sa_request sa where sa.status = ? ";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            int count = jdbcTemplate.queryForObject(sql, new Object[]{status}, Integer.class);
            return count;
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        }
    }

    public int contractStatus(String status) {
        String sql = "select COUNT(con.status) from sgft_contract con where con.status = ? ";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            int count = jdbcTemplate.queryForObject(sql, new Object[]{status}, Integer.class);
            return count;
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        }
    }

    public List<MergeDataOrder> getDataShow(String status, boolean nodate) {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com where cu.company_code = com.company_code and sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status = ? ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{status};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            return resultList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<MergeDataOrder> getUserThamdinh(String status, String empThamdinh) {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com where cu.company_code = com.company_code and sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status = ? and sa.employee_thamdinh = ?  ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{status, empThamdinh};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            return resultList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<MergeDataOrder> getUserDuyet(String status, String empDuyet) {
        String sql = "select sa.*, cu.*,com.* from sgft_sa_request sa, sgft_customer cu,sgft_companies com where cu.company_code = com.company_code and sa.company_code = cu.company_code and sa.customer_phone = cu.customer_phone and sa.status = ? and sa.employee_duyet = ?  ORDER BY sa.id DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        try {
            Object[] param = new Object[]{status, empDuyet};
            List<MergeDataOrder> resultList = jdbcTemplate.query(sql, param,
                    (rs, arg1) -> {
                        Customer c = new CustomerMapper().mapRow(rs, arg1);
                        SaRequest s = new SaRequestMapper().mapRow(rs, arg1);
                        Companies com = new CompanyMapper().mapRow(rs, arg1);
                        return new MergeDataOrder(c, s, com);
                    });
            return resultList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<MergeDataOrder> findhistoryModal(String phone) {
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
            return resultList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<MergeDataWithdraw> getContractModal(String customerPhone) {
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
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }

    public List<MergeDataWithdraw> gachnodata(String date) {
        String sql = "";
        Object[] param = null;
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        sql = "select co.*,cu.*,com.* from sgft_contract co,sgft_customer cu ,  sgft_companies com where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code and co.status in ('act','notcomplete')  ORDER BY co.id_contract DESC";
        param = new Object[]{};

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

    public List<MergeDataWithdraw> getDataWithdraw(String status, boolean nodate, String date) { //no check date = true
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
            return resultList;
        } catch (Exception ex) {
            return null;
        }
    }


    public List<MergeDataWithdraw> theodoikhoantamung(String date) {

        String sql = "select co.*,com.*,cu.* from sgft_contract co , sgft_companies com,sgft_customer cu where co.customer_phone = cu.customer_phone and cu.company_code = com.company_code ORDER BY co.id_contract DESC";
        if (StringUtil.isEmpty(jdbcTemplate)) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }

        try {
            Object[] param = new Object[]{};
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
