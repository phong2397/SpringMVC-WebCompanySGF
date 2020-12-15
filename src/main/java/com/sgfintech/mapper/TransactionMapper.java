package com.sgfintech.mapper;

import com.sgfintech.entity.Transaction;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class TransactionMapper implements RowMapper<Transaction> {

    @Override
    public Transaction mapRow(ResultSet rs, int i) throws SQLException {
        return null;
    }
}
