package com.sgfintech.mapper;

import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Documents;
import com.sgfintech.util.StringUtil;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DocumentMapper implements RowMapper<Documents> {
    @Override
    public Documents mapRow(ResultSet rs, int i) throws SQLException {
        Documents d = new Documents();
        d.setId(rs.getInt("id_contract"));
        d.setCustomerId(rs.getString("customer_id"));
        d.setCustomerPhone(rs.getString("customer_phone"));
        d.setCustomerContract(rs.getString("customer_contract"));
        d.setCustomerSalary(rs.getString("customer_salary"));
        d.setCustomerHealth(rs.getString("customer_health"));
        d.setCustomerSocial(rs.getString("customer_social"));
        d.setCustomerAppendix(rs.getString("customer_appendix"));
        d.setCustomerPayslip(rs.getString("customer_payslip"));
        if (!StringUtil.isEmpty(rs.getDate("created_date"))) {
            d.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("created_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            d.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("updated_date")));
        }
        return d;
    }
}