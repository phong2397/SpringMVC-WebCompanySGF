package com.sgfintech.mapper;

import com.sgfintech.entity.Customer;
import com.sgfintech.util.StringUtil;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class CustomerMapper implements RowMapper<Customer> {
    @Override
    public Customer mapRow(ResultSet rs, int i) throws SQLException {
        Customer c = new Customer();
        c.setId(rs.getLong("id"));
        c.setCompanyCode(rs.getString("company_code"));
        c.setCustomerPhone(rs.getString("customer_phone"));
        c.setCustomerName(rs.getString("customer_name"));
        c.setCustomerEmail(rs.getString("customer_email"));
        c.setCustomerCode(rs.getString("customer_code"));
        c.setCustomerSalary(rs.getLong("customer_salary"));
        c.setCustomerBank(rs.getString("customer_bank"));
        c.setCustomerBankAcc(rs.getString("customer_bank_acc"));
        c.setCustomerBankName(rs.getString("customer_bank_name"));
        c.setCustomerId(rs.getString("customer_id"));
        c.setCustomerAddress(rs.getString("customer_address"));
        c.setCustomerAddressTemp(rs.getString("customer_address_temp"));
        c.setCustomerIdLocation(rs.getString("customer_id_location"));
        c.setCustomerSocialInsurance(rs.getString("customer_social_insurance"));
        c.setCustomerHealthInsurance(rs.getString("customer_health_insurance"));
        c.setCustomerPosition(rs.getString("customer_position"));
        c.setCustomerTax(rs.getString("customer_tax"));
        c.setCustomerContract(rs.getLong("customer_contract"));
        c.setCustomerGender(rs.getString("customer_gender"));
        if (!StringUtil.isEmpty(rs.getDate("customer_contract_expired"))) {
            c.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_contract_expired")));
        }
        if (!StringUtil.isEmpty(rs.getDate("customer_birthday"))) {
            c.setCustomerBirthday(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_birthday")).toLocalDate());
        }
        c.setCustomerRelative(rs.getString("customer_relative"));
        c.setCustomerRelativePhone(rs.getString("customer_relative_phone"));
        c.setStatus(rs.getString("status"));
        if (!StringUtil.isEmpty(rs.getDate("customer_id_date"))) {
            c.setCustomerIdDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_id_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("customer_contract_expired"))) {
            c.setCustomerContractExpired(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_contract_expired")));
        }
        if (!StringUtil.isEmpty(rs.getDate("created_date"))) {
            c.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("created_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            c.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("updated_date")));
        }

        return c;
    }

    public Customer mapRow(ResultSet rs, int i, boolean ismerge) throws SQLException {
        Customer c = new Customer();
        c.setId(rs.getLong("cu.id"));
        c.setCompanyCode(rs.getString("company_code"));
        c.setCustomerPhone(rs.getString("customer_phone"));
        c.setCustomerName(rs.getString("customer_name"));
        c.setCustomerEmail(rs.getString("customer_email"));
        c.setCustomerCode(rs.getString("customer_code"));
        c.setCustomerSalary(rs.getLong("customer_salary"));
        c.setCustomerBank(rs.getString("customer_bank"));
        c.setCustomerBankAcc(rs.getString("customer_bank_acc"));
        c.setCustomerBankName(rs.getString("customer_bank_name"));
        c.setCustomerId(rs.getString("customer_id"));
        c.setCustomerAddress(rs.getString("customer_address"));
        c.setCustomerAddressTemp(rs.getString("customer_address_temp"));
        c.setCustomerIdLocation(rs.getString("customer_id_location"));
        c.setCustomerSocialInsurance(rs.getString("customer_social_insurance"));
        c.setCustomerHealthInsurance(rs.getString("customer_health_insurance"));
        c.setCustomerPosition(rs.getString("customer_position"));
        c.setCustomerTax(rs.getString("customer_tax"));
        c.setCustomerContract(rs.getLong("customer_contract"));
        c.setCustomerGender(rs.getString("customer_gender"));
        if (!StringUtil.isEmpty(rs.getDate("customer_contract_expired"))) {
            c.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_contract_expired")));
        }
        c.setCustomerRelative(rs.getString("customer_relative"));
        c.setCustomerRelativePhone(rs.getString("customer_relative_phone"));
        if (!StringUtil.isEmpty(rs.getDate("customer_birthday"))) {
            c.setCustomerBirthday(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_birthday")).toLocalDate());
        }
        c.setStatus(rs.getString("status"));
        if (!StringUtil.isEmpty(rs.getDate("customer_id_date"))) {
            c.setCustomerIdDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_id_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("customer_contract_expired"))) {
            c.setCustomerContractExpired(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("customer_contract_expired")));
        }
        if (!StringUtil.isEmpty(rs.getDate("created_date"))) {
            c.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("created_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            c.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("updated_date")));
        }
        return c;
    }
}
