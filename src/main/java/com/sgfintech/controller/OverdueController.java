package com.sgfintech.controller;

import com.sgfintech.dao.ContractDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
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
public class OverdueController {
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;

    @Autowired
    UseradminDAO useradminDAO;

    @RequestMapping(value = {"/thuphi"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("act", true, "");
        List<Contract> contract = contractDAO.findAll();
        mm.addAttribute("con", contract);
        List<Useradmin> admin = useradminDAO.findAll();
        mm.addAttribute("admin", admin);
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "thuphi";
    }

}
