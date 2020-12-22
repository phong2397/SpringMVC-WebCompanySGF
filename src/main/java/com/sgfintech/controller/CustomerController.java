package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.CompaniesDAO;
import com.sgfintech.entity.Companies;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        List<CustomerHandler> result = mergeDataService.searchCustomer(customerName,customerId,customerPhone);
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
    public @ResponseBody String doSearchManage(HttpServletRequest request, HttpServletResponse response) {
        String companyCode = request.getParameter("companyCode");
        ModelAndView mav = new ModelAndView("manage-customer");
        List<CustomerHandler> result = mergeDataService.searchCustomerCompany(companyCode);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        return responseStr;
    }

}
