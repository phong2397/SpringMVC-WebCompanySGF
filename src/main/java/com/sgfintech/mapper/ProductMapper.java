package com.sgfintech.mapper;

import com.sgfintech.entity.Product;
import com.sgfintech.util.StringUtil;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class ProductMapper implements RowMapper<Product> {

    @Override
    public Product mapRow(ResultSet rs, int i) throws SQLException {
        Product p = new Product();
        p.setProductCode(rs.getString("product_code"));
        p.setId(rs.getLong("id"));
        p.setProductName(rs.getString("product_name"));
        p.setProductDetail(rs.getString("product_detail"));
        p.setStatus(rs.getString("status"));
        if (!StringUtil.isEmpty(rs.getDate("created_date"))) {
            p.setCreatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("created_date")));
        }
        if (!StringUtil.isEmpty(rs.getDate("updated_date"))) {
            p.setUpdatedDate(StringUtil.convertToLocalDateViaInstant(rs.getTimestamp("updated_date")));
        }
        return p;
    }
}
