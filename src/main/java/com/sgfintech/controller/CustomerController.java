package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.CompaniesDAO;
import com.sgfintech.dao.DocumentsDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.*;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
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

    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    CompaniesDAO companiesDAO;

    @Autowired
    UseradminDAO useradminDAO;

    @RequestMapping(value = {"/list-customer"}, method = RequestMethod.GET)
    public String listCustomer(Model model) {
        return "list-customer";
    }

    @RequestMapping(value = "/doSearch", method = RequestMethod.POST)
    public @ResponseBody
    String doSearch(HttpServletRequest request, HttpServletResponse response) {
        String customerName = request.getParameter("customerName");
        String customerId = request.getParameter("customerId");
        String customerPhone = request.getParameter("customerPhone");
        List<CustomerHandler> result = mergeDataService.searchCustomer(customerName, customerId, customerPhone);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        return responseStr;
    }

    @RequestMapping(value = {"/manage-customer"}, method = RequestMethod.GET)
    public String manageCustomer(ModelMap mm) {
        List<Companies> listdata = companiesDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "manage-customer";
    }

    @RequestMapping(value = "/doSearchManage", method = RequestMethod.POST)
    public @ResponseBody
    String doSearchManage(HttpServletRequest request, HttpServletResponse response) {
        String companyCode = request.getParameter("companyCode");
        String companyName = request.getParameter("companyName");
        List<CustomerHandler> result = mergeDataService.searchCustomerCompany(companyCode, companyName);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        return responseStr;
    }

    @RequestMapping(value = {"/taoquyenuser"}, method = RequestMethod.GET)
    public String createUser(ModelMap mm) {
        List<Useradmin> listdata = useradminDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "taoquyenuser";
    }

    @RequestMapping(value = "/changeUserAdmin", method = RequestMethod.POST)
    public @ResponseBody
    String changeUserAdmin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String userLogin = request.getParameter("userLogin");
        String userPass = request.getParameter("userPass");
        String userRole = request.getParameter("userRole");
        if (userRole.equals("root")) {
            return "errorRoot";
        } else {
            if (userRole.equals("") || userPass.equals("") || userLogin.equals("")) {
                return "error";
            }
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                messageDigest.update(userPass.getBytes(), 0, userPass.length());
                String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
                Useradmin u = new Useradmin();
                u.setStatus("0");
                u.setCount(0l);
                u.setRole(userRole);
                u.setUserLogin(userLogin);
                u.setPassWord(hashedPass);
                useradminDAO.save(u);
                return "success";
            } catch (Exception ex) {
                return "error";
            }

        }
    }
}
