package com.sgfintech.service;

import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.mapper.CustomerMapper;
import com.sgfintech.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class SaRequestService {

    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    public int[][] updateRecordById(List<SaRequest> listid) {
        if (jdbcTemplate == null) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        String sql = "update sgft_sa_request set employee_thamdinh = ? where id = ?";
        int[][] updateCounts = jdbcTemplate.batchUpdate(sql, listid, listid.size(), new ParameterizedPreparedStatementSetter<SaRequest>() {
            @Override
            public void setValues(PreparedStatement preparedStatement, SaRequest saRequest) throws SQLException {
                preparedStatement.setString(1, saRequest.getEmployeeThamdinh());
                preparedStatement.setLong(2, saRequest.getId());
            }
        });
        return updateCounts;
    }

    public int[][] updateemployeeDuyetById(List<SaRequest> listid) {
        if (jdbcTemplate == null) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        String sql = "update sgft_sa_request set employee_duyet = ? where id = ?";
        int[][] updateCounts = jdbcTemplate.batchUpdate(sql, listid, listid.size(), new ParameterizedPreparedStatementSetter<SaRequest>() {
            @Override
            public void setValues(PreparedStatement preparedStatement, SaRequest saRequest) throws SQLException {
                preparedStatement.setString(1, saRequest.getEmployeeDuyet());
                preparedStatement.setLong(2, saRequest.getId());
            }
        });
        return updateCounts;
    }


}
