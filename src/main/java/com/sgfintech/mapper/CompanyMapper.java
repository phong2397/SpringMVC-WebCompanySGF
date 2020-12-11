package com.sgfintech.mapper;

import com.sgfintech.entity.Companies;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class CompanyMapper implements RowMapper<Companies> {

    @Override
    public Companies mapRow(ResultSet rs, int i) throws SQLException {
        
        return null;
    }
}
