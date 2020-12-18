package com.sgfintech.controller;

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
    public String welcomePage(Model model) {
        return "list-customer";
    }

    @RequestMapping(value = "/doSearch", method = RequestMethod.GET)
    public String doSearch(@RequestParam String customerName,@RequestParam String customerId,@RequestParam String customerPhone, ModelMap mm) {
        List<CustomerHandler> result = mergeDataService.searchCustomer(customerName,customerId,customerPhone);
        mm.addAttribute(Consts.Attr_ResultView, result);
        return "list-customer";
    }

    @RequestMapping(value = {"/manage-customer"}, method = RequestMethod.GET)
    public String manageCustomer(ModelMap mm) {
        List<Companies> listdata = companiesDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "manage-customer";
    }

    @RequestMapping(value = "/doSearchManage", method = RequestMethod.GET)
    public String doSearchManage(@RequestParam String companyCode, ModelMap mm) {
        List<CustomerHandler> result = mergeDataService.searchCustomerCompany(companyCode);
        mm.addAttribute("result", result);
        return "manage-customer";
    }

}
