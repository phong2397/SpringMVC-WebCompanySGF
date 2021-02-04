package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.CompaniesDAO;
import com.sgfintech.dao.DocumentsDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.*;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.service.UseradminService;
import com.sgfintech.util.Consts;
import com.sgfintech.util.MailUtil;
import com.sgfintech.util.StringUtil;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.List;


/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class CustomerController {
    private static final Logger log = Logger.getLogger(CustomerController.class);

    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    CompaniesDAO companiesDAO;

    @Autowired
    UseradminDAO useradminDAO;

    @Autowired
    private UseradminService useradminService;


    @RequestMapping(value = {"/thongtinkhachhang"}, method = RequestMethod.GET)
    public String listInfoCustomer(Model model) {
        log.info("GET - thongtinkhachhang page");
        return "thongtinkhachhang";
    }

    @RequestMapping(value = "/searchByInfoCustomer", method = RequestMethod.POST)
    public @ResponseBody
    String searchByInfoCustomer(HttpServletRequest request, HttpServletResponse response) {
        log.info("POST - Search thong tin khach hang theo so dien thoai, so cmnd, ho va ten");
        String customerName = request.getParameter("customerName");
        log.info("Customer Name: " + customerName);
        String customerId = request.getParameter("customerId");
        log.info("Customer ID: " + customerId);
        String customerPhone = request.getParameter("customerPhone");
        log.info("Customer Phone: " + customerPhone);
        List<CustomerHandler> result = mergeDataService.searchCustomer(customerName, customerId, customerPhone);
        log.info("Return result list of merge data companies and customer search customer or customerid or customer phone ");
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        return responseStr;
    }

    @RequestMapping(value = {"/quanlydanhsach"}, method = RequestMethod.GET)
    public String manageList(ModelMap mm) {
        log.info("GET - Go into quan ly danh sach page");
        List<Companies> listdata = companiesDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "quanlydanhsach";
    }

    @RequestMapping(value = "/searchByInfoCompany", method = RequestMethod.POST)
    public @ResponseBody
    String searchByInfoCompany(HttpServletRequest request, HttpServletResponse response) {
        log.info("POST - Search thong tin khach hang theo ma cong ty va ten cong ty");
        String companyCode = request.getParameter("companyCode");
        log.info("Company Code: " + companyCode);
        String companyName = request.getParameter("companyName");
        log.info("Company Name: " + companyName);
        List<CustomerHandler> result = mergeDataService.searchCustomerCompany(companyCode, companyName);
        log.info("Return result list: " + result);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        log.info("ResponseStr: " + responseStr);
        return responseStr;
    }

    @RequestMapping(value = {"/taoquyenuser"}, method = RequestMethod.GET)
    public String createUser(ModelMap mm, HttpSession session) {
        log.info("GET - Go into taoquyenuser page");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            log.info("session user login == null return login");
            return "redirect:login";
        } else {
            log.info("session user login != null return taoquyenuser");
            List<Useradmin> listdata = useradminDAO.findAll();
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            return "taoquyenuser";
        }
    }

    @RequestMapping(value = "/changeUserAdmin", method = RequestMethod.POST)
    public @ResponseBody
    String changeUserAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - changeUserAdmin");
        String userLogin = request.getParameter("userLogin");
        log.info("userLogin: " + userLogin);
        String userPass = request.getParameter("userPass");
        log.info("userPass: " + userPass);
        String userRole = request.getParameter("userRole");
        log.info("userRole: " + userRole);
        if (userRole.equals("root")) {
            log.error("Error - Not allow role roor create user admin");
            return "errorRoot";
        } else {
            try {
                Useradmin u = useradminService.checkUser(userLogin);
                if (!StringUtil.isEmpty(u)) {
                    log.error("Error - Check exist User Admin");
                    return "errorExist";
                } else {
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    messageDigest.update(userPass.getBytes(), 0, userPass.length());
                    String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
                    Useradmin user = new Useradmin();
                    user.setStatus("0");
                    user.setCount(0l);
                    user.setRole(userRole);
                    user.setUserLogin(userLogin);
                    user.setPassword(hashedPass);
                    useradminDAO.save(user);
                    log.info("Return success create info user admin (status , count , role , user login, password)");
                    return "success";
                }

            } catch (Exception ex) {
                log.error("Exception :" + ex.getMessage());
                return "error";
            }

        }
    }

    @RequestMapping(value = "/resetPassAdmin", method = RequestMethod.POST)
    public @ResponseBody
    String resetPassAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - resetPassAdmin");
        String data = request.getParameter("idata");
        log.info("id userlogin: " + data);
        String defaultPass = "1234567";
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            Useradmin user = useradminDAO.findById(Long.parseLong(data));
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(defaultPass.getBytes(), 0, defaultPass.length());
            String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
            user.setPassword(hashedPass);
            useradminDAO.update(user);
            log.info("Return success reset pass");
            return "success";
        } catch (Exception ex) {
            log.error("Error log: " + ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/lockuserAdmin", method = RequestMethod.POST)
    public @ResponseBody
    String lockuserAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - lockuserAdmin");
        String data = request.getParameter("idlock");
        log.info("id userlogin: " + data);
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u.getUserLogin().equals("root") || u.getUserLogin().equals("tnthamdinh") || u.getUserLogin().equals("tncollection")) {
            log.info("Check userlogin == root || truong tham dinh || truong collection || truong ke toan ");
            try {
                Useradmin user = useradminDAO.findById(Long.parseLong(data));
                log.info("Find user id : " + user);
                user.setStatus("1");
                user.setUpdatedDate(LocalDateTime.now());
                useradminDAO.update(user);
                log.info("Return success lock user");
                return "success";
            } catch (Exception ex) {
                log.error("Exception: " + ex.getMessage());
                return "error";
            }
        } else {
            log.error("Not allow lock user ");
            return "errorlockRole";
        }

    }

    @RequestMapping(value = "/unlockuserAdmin", method = RequestMethod.POST)
    public @ResponseBody
    String unlockuserAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - unlockuserAdmin ");
        String data = request.getParameter("idlock");
        log.info("Id user login : " + data);
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u.getUserLogin().equals("root") || u.getUserLogin().equals("tnthamdinh") || u.getUserLogin().equals("tncollection") || u.getUserLogin().equals("ketoantruong")) {
            log.info("Check userlogin == root || truong tham dinh || truong collection || truong ke toan ");
            try {
                Useradmin user = useradminDAO.findById(Long.parseLong(data));
                log.info("Find user id : " + user);
                user.setStatus("0");
                user.setUpdatedDate(LocalDateTime.now());
                useradminDAO.update(user);
                log.info("Return success unlock user");
                return "success";
            } catch (Exception ex) {
                log.error("Exception: " + ex.getMessage());
                return "error";
            }
        } else {
            log.error("Not allow unlock user ");
            return "errorlockRole";
        }

    }

    @RequestMapping(value = {"/thaydoimatkhau"}, method = RequestMethod.GET)
    public String thaydoimatkhau(ModelMap mm, HttpSession session) {
        log.info("GET - thaydoimatkhau page");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (!StringUtil.isEmpty(u)) {
            Useradmin user = useradminDAO.findById(u.getId());
            log.info("Find user id login : " + user);
            mm.addAttribute(Consts.Attr_ResultView, user);
            log.info("Return thaydoimatkhau page");
            return "thaydoimatkhau";
        } else {
            return "redirect:login";
        }
    }


    @RequestMapping(value = "/changePassAdmin", method = RequestMethod.POST)
    public @ResponseBody
    String changePassAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - changePassAdmin ");
        String password = request.getParameter("password");
        log.info("Data password: " + password);
        String oldpassword = request.getParameter("oldpassword");
        log.info("Data oldpassword: " + oldpassword);
        String data = request.getParameter("id");
        log.info("Id user login : " + data);
        try {
            Useradmin user = useradminDAO.findById(Long.parseLong(data));
            if (user.getPassword().equals(StringUtil.hashPw(oldpassword))) {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                messageDigest.update(password.getBytes(), 0, password.length());
                String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
                user.setPassword(hashedPass);
                useradminDAO.update(user);
                log.info("Return success thay doi mat khau user");
                return "success";
            } else {
                log.error("Return not exist user");
                return "errorNoExist";
            }

        } catch (Exception ex) {
            log.error("Exception: " + ex);
            return "error";
        }
    }

    @RequestMapping(value = "/changeUserLogin", method = RequestMethod.POST)
    public @ResponseBody
    String changeUserLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - changeUserLogin ");
        String data = request.getParameter("id");
        String dataUserLogin = request.getParameter("userlogin");
        Useradmin user = useradminDAO.findById(Long.parseLong(data));
        if (!StringUtil.isEmpty(dataUserLogin)) {
            user.setUserLogin(dataUserLogin);
            useradminDAO.update(user);
            return "success";
        } else {
            return "emptyError";

        }
    }
}

