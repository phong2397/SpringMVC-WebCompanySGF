package com.sgfintech.mapper;

import com.sgfintech.entity.Contract;
import com.sgfintech.util.StringUtil;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class ContractMapper implements RowMapper<Contract> {

    @Override
    public Contract mapRow(ResultSet rs, int i) throws SQLException {
        Contract c = new Contract();
        c.setIdContract(rs.getLong("id_contract"));
        c.setSystemTrace(rs.getString("system_trace"));
        c.setCustomerPhone(rs.getString("customer_phone"));
        c.setBorrow(rs.getLong("borrow"));
        c.setTimeBorrow(rs.getInt("time_borrow"));
        c.setRemainAmountBorrow(rs.getLong("remain_amount_borrow"));
        c.setFeeBorrow(rs.getDouble("fee_borrow"));
        c.setTransactionId(rs.getString("transaction_id"));
        c.setStatus(rs.getString("status"));
        if (!StringUtil.isEmpty(rs.getDate("date_repayment"))) {
            c.setDateRepayment(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("date_repayment")).toLocalDate());
        }
        if (!StringUtil.isEmpty(rs.getDate("date_repayment_util"))) {
            c.setDateRepaymentUtil(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("date_repayment_util")));
        }
        c.setAcceptedBy(rs.getString("accepted_by"));
        c.setNotedBy(rs.getBytes("noted_by"));
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            c.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("updated_date")));
        }
        return c;
    }
}
