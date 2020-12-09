package com.sgfintech.mapper;

import com.sgfintech.entity.Product;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class ProductMapper implements RowMapper<Product> {

    @Override
    public Product mapRow(ResultSet resultSet, int i) throws SQLException {
        return null;
    }
}
