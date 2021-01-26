package com.sgfintech.mapper;

import com.sgfintech.entity.Companies;
import com.sgfintech.util.StringUtil;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class CompanyMapper implements RowMapper<Companies> {

    @Override
    public Companies mapRow(ResultSet rs, int i) throws SQLException {
        Companies c = new Companies();
        c.setId(rs.getLong("id"));
        c.setCompanyCode(rs.getString("company_code"));
        c.setCompanyName(rs.getString("company_name"));
        c.setCompanyAddress(rs.getString("company_address"));
        c.setConpanyTax(rs.getString("conpany_tax"));
        c.setConpanyPhone(rs.getString("company_phone"));
        if (!StringUtil.isEmpty(rs.getDate("created_date"))) {
            c.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("created_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            c.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("updated_date")));
        }
        return c;
    }
}
