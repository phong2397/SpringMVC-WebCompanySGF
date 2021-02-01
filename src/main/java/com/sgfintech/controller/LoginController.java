package com.sgfintech.controller;

import com.sgfintech.entity.Useradmin;
import com.sgfintech.service.UseradminService;
import com.sgfintech.util.Consts;
import com.sgfintech.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class LoginController {
    private static final Logger log = Logger.getLogger(LoginController.class);

    @Autowired
    private UseradminService useradminService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap mm) {
        log.info("GET - auth_login page");
        mm.addAttribute(Consts.Attr_Euser, new Useradmin());
        mm.addAttribute(Consts.Attr_ToDay, getDateString());
        return "auth_login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String checkLogin(HttpServletRequest request, HttpSession session, ModelMap mm) {
        log.info("POST - checkLogin");
        String user = request.getParameter("user");
        log.info("User: " + user);
        String pass = request.getParameter("pass");
        log.info("Pass: " + pass);

        Useradmin u = useradminService.checkUser(user);

        if (StringUtil.isEmpty(u)) {
            log.info("Check user not empty");
            session.setAttribute(Consts.Check_User, "Tài khoản không tồn tại trên hệ thống");
            return "redirect:login";
        } else {
            String hp = StringUtil.hashPw(pass);
            if (!hp.equals(u.getPassWord())) {
                log.info("Check user pass ");
                session.setAttribute(Consts.Check_Pass, "Mật khẩu không chính xác");
                return "redirect:login";
            } else {
                log.info("Right user log into page ");
                u.setPassWord("");
                session.setAttribute(Consts.Session_Euser, u);
                return "redirect:home";
            }
        }

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        log.info("GET - log out");
        session.invalidate();
        return "redirect:/login";
    }

    String getDateString() {
        Calendar rightNow = Calendar.getInstance();
        Date date = rightNow.getTime();
        Locale vn = new Locale("vi", "VN");
        DateFormat localFormat = DateFormat.getDateInstance(DateFormat.DEFAULT, vn);
        return "Ngày hệ thống :" + localFormat.format(date);
    }
}
