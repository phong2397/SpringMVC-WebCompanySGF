package com.sgfintech.service;

import com.sgfintech.entity.Useradmin;
import com.sgfintech.mapper.UseradminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import java.util.Optional;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Service
@Transactional
public class UseradminService {

    @Autowired
    private DataSource dataSource;

    private JdbcTemplate jdbcTemplate;

    @SuppressWarnings("unchecked")
    public Useradmin checkUser(String user) {
        Useradmin u = new Useradmin();
        if (jdbcTemplate == null) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        String sql = "select * from sgft_useradmin where user_login = ?";
        Object[] param = new Object[]{user};
        UseradminMapper mapper = new UseradminMapper();
        try {
            u = jdbcTemplate.queryForObject(sql, param, mapper);
        } catch (Exception ex) {
            u = null;
        }
        return u;
    }

    @SuppressWarnings("unchecked")
    public String randomUserXetDuyet() {
        if (jdbcTemplate == null) {
            jdbcTemplate = new JdbcTemplate(dataSource);
        }
        String sql = "select user_login from sgft_useradmin where role = 'nvkyduyet' and status = 0 order by rand() limit 1";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
        } catch (Exception exception) {
            exception.printStackTrace();
            return "";
        }
    }
}
