package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.ContractDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
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
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;

    @RequestMapping(value = {"/khachhangtattoan"}, method = RequestMethod.GET)
    public String khachhangtattoanPage(ModelMap mm, HttpSession session) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            int countAct = mergeDataService.contractStatus("act");
            int countDone = mergeDataService.contractStatus("done");
            List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("done", true, "");
            List<Contract> contract = contractDAO.findAll();
            mm.addAttribute("con", contract);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            mm.addAttribute("countDone", countDone);
            mm.addAttribute("countAct", countAct);
            return "khachhangtattoan";
        }
    }

    @RequestMapping(value = "/findContractHistoryModal", method = RequestMethod.POST)
    public @ResponseBody
    String ContractModal(HttpServletRequest request, HttpServletResponse response) {
        String customerPhone = request.getParameter("dataRequest");
        List<MergeDataWithdraw> result = mergeDataService.getContractModal(customerPhone);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        return responseStr;
    }
}
