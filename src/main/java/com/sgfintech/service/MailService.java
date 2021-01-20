package com.sgfintech.service;

import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.Useradmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class MailService {

    @Autowired
    private UseradminService useradminService;
    @Autowired
    private UseradminDAO useradminDAO;

    public Useradmin findUserByEmail(String email) {
        return useradminService.checkUser(email);
    }

    public Useradmin findUserByResetToken(String resetToken) {
        return useradminService.findByResetToken(resetToken);
    }


}
