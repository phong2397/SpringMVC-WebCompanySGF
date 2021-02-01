package com.sgfintech.controller;

import com.sgfintech.dao.ContractDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ProcessedController {
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;

    private static final Logger log = Logger.getLogger(ProcessedController.class);


    @RequestMapping(value = {"/khachhangthanhtoan"}, method = RequestMethod.GET)
    public String khachhangthanhtoanPage(ModelMap mm, HttpSession session) {
        log.info("GET - khachhangthanhtoanPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("done", true, "");
            log.info("List Data: " + listdata);
            List<Contract> contract = contractDAO.findAll();
            log.info("List contract: " + contract);
            mm.addAttribute("con", contract);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            return "khachhangthanhtoan";
        }
    }
}

