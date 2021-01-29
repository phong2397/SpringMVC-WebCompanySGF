package com.sgfintech.controller;

import com.sgfintech.dao.ContractDAO;
import com.sgfintech.dao.UseradminDAO;
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
public class OverdueController {
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;

    @Autowired
    UseradminDAO useradminDAO;

    private static final Logger log = Logger.getLogger(OverdueController.class);

    @RequestMapping(value = {"/thuphi"}, method = RequestMethod.GET)
    public String thuphiPage(ModelMap mm, HttpSession session) {

        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "redirect:login";
        } else {
            List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("act", true, "");
            List<Contract> contract = contractDAO.findAll();
            mm.addAttribute("con", contract);
            List<Useradmin> admin = useradminDAO.findAll();
            mm.addAttribute("admin", admin);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "thuphi";
        }
    }

}
