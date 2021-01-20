package com.sgfintech.mapper;

import com.sgfintech.entity.Useradmin;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class UseradminMapper implements RowMapper<Useradmin> {
    @Override
    public Useradmin mapRow(ResultSet rs, int i) throws SQLException {
        Useradmin u = new Useradmin();
        u.setId(rs.getLong("id"));
        u.setUserLogin(rs.getString("user_login"));
        u.setPassWord(rs.getString("pass_word"));
        u.setRole(rs.getString("role"));
        u.setStatus(rs.getString("status"));
        u.setCount(rs.getLong("count"));
        u.setResetPasswordToken(rs.getString("reset_password_token"));
        return u;
    }
}
