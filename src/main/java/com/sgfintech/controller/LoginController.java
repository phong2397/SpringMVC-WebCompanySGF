package com.sgfintech.controller;

import com.sgfintech.entity.Useradmin;
import com.sgfintech.service.UseradminService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    private UseradminService useradminService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login(ModelMap mm) {
        mm.addAttribute(Consts.Attr_Euser, new Useradmin());
        mm.addAttribute(Consts.Attr_ToDay, getDateString());
        return "login";
    }

    String getDateString() {
        Calendar rightNow = Calendar.getInstance();
        Date date = rightNow.getTime();
        Locale vn = new Locale("vi", "VN");
        DateFormat localFormat = DateFormat.getDateInstance(DateFormat.DEFAULT, vn);
        return "Ngày hệ thống :" + localFormat.format(date);
    }
}
