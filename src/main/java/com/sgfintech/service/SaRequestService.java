package com.sgfintech.service;

import com.sgfintech.controller.ApprovalController;
import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.mapper.CustomerMapper;
import com.sgfintech.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class SaRequestService {
    private static final Logger log = Logger.getLogger(SaRequestService.class);
    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    public int[][] updateRecordById(List<SaRequest> listid) {
        log.info("POST - updateRecordById");
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
        log.info("POST - updateemployeeDuyetById");
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

    public int[] countStatus() {
        try {
            SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("PROC_COUNTSTATUS");
            Map<String, Object> outParams = simpleJdbcCall.execute();
            return new int[]{
                    (Integer) outParams.get("total"),
                    (Integer) outParams.get("act"),
                    (Integer) outParams.get("deni"),
                    (Integer) outParams.get("wfs"),
                    (Integer) outParams.get("wait"),
                    (Integer) outParams.get("done")
            };
        } catch (Exception exception) {
            return new int[]{
                    0, 0, 0, 0, 0, 0
            };
        }

    }


}
