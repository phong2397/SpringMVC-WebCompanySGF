package com.sgfintech.controller;

import com.sgfintech.dao.ContractDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class WaitWithdrawController {
    @Autowired
    ContractDAO contractDAO;


    @RequestMapping(value = {"/chothuhoi"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        List<Contract> listdata = contractDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "chothuhoi";
    }
}
