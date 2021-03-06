package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.ContractDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.service.SaRequestService;
import com.sgfintech.util.Consts;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TotalListController {

    private static final Logger log = Logger.getLogger(TotalListController.class);
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;
    @Autowired
    SaRequestService saRequestService;

    @RequestMapping(value = {"/khachhangtattoan"}, method = RequestMethod.GET)
    public String customerRepayPage(ModelMap mm, HttpSession session) {
        log.info("GET - khachhangtattoan page ");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("done", true, "");
            log.info("List data:  " + listdata);
            List<Contract> contract = contractDAO.findAll();
            log.info("List contract:  " + contract);
            mm.addAttribute("con", contract);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            int count[] = saRequestService.countStatus();
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countDone", count[5]);
            return "khachhangtattoan";
        }
    }

    @RequestMapping(value = "/findContractHistoryModal", method = RequestMethod.POST)
    public @ResponseBody
    String findContractHistoryModal(HttpServletRequest request, HttpServletResponse response) {
        log.info("POST - ContractModal ");
        String customerPhone = request.getParameter("dataRequest");
        log.info("customer phone: " + customerPhone);
        List<MergeDataWithdraw> result = mergeDataService.getContractModal(customerPhone);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        log.info("Response Str: : " + responseStr);
        return responseStr;
    }
}
