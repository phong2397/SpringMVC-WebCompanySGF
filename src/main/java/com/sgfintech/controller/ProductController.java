package com.sgfintech.controller;

import com.sgfintech.dao.ProductDAO;
import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Product;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@Controller
public class ProductController {
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ProductDAO productDAO;

    @RequestMapping(value = {"/cauhinh"}, method = RequestMethod.GET)
    public String manageCustomer(ModelMap mm) {
        List<Product> listdata = productDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "cauhinh";
    }
}
