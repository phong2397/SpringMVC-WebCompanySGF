package com.sgfintech.mapper;

import com.sgfintech.entity.SaRequest;
import com.sgfintech.util.StringUtil;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class SaRequestMapper implements RowMapper<SaRequest> {

    @Override
    public SaRequest mapRow(ResultSet rs, int i) throws SQLException {
        SaRequest s = new SaRequest();
        s.setId(rs.getLong("id"));
        s.setCompanyCode(rs.getString("company_code"));
        s.setCustomerPhone(rs.getString("customer_phone"));
        s.setBorrow(rs.getLong("borrow"));
        s.setTimeBorrow(rs.getInt("timne_borrow"));
        s.setInterestRate(rs.getDouble("interest_rate"));
        s.setFeeBorrow(rs.getDouble("fee_borrow"));
        s.setStatus(rs.getString("status"));
        s.setEmployeeSua(rs.getString("employee_sua"));
        if (!StringUtil.isEmpty(rs.getDate("employee_sua_date"))) {
            s.setEmployeeSuaDate(StringUtil.convertToLocalDateViaInstant(rs.getDate("employee_sua_date")));
        }
        s.setEmployeeThamdinh(rs.getString("employee_thamdinh"));
        if (!StringUtil.isEmpty(rs.getDate("employee_thamdinh_date"))) {
            s.setEmployeeThamdinhDate(StringUtil.convertToLocalDateViaInstant(rs.getDate("employee_thamdinh_date")));
        }
        s.setEmployeeDuyet(rs.getString("employee_duyet"));
        if (!StringUtil.isEmpty(rs.getDate("employee_thamdinh_date"))) {
            s.setEmployeeDuyetDate(StringUtil.convertToLocalDateViaInstant(rs.getDate("employee_duyet_date")));
        }
        s.setDescription(rs.getString("description"));
//        s.setData(rs.getByte("data"));
        if (!StringUtil.isEmpty(rs.getDate("created_date"))) {
            s.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getDate("created_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            s.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getDate("updated_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_time_bororw"))) {
            s.setUpdatedTimeBororw(StringUtil.convertToLocalDateViaInstant(rs.getDate("updated_time_bororw")));
        }
        return s;
    }
}
