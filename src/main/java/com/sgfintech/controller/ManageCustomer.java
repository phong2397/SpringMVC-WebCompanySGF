package com.sgfintech.controller;

import com.sgfintech.handler.CompanyHandler;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ManageCustomer {

    @Autowired
    MergeDataService mergeDataService;

    @RequestMapping(value = {"/manage-customer"}, method = RequestMethod.GET)
    public String welcomePage(Model mm) {
        List<CompanyHandler> listdata = mergeDataService.getDataManange();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "manage-customer";
    }

}
