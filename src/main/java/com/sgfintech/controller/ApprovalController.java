package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.handler.MergeDataOrder;
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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ApprovalController {

    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    SaRequestDAO saRequestDAO;

    @RequestMapping(value = {"/tuchoi"}, method = RequestMethod.GET)
    public String declinePage(ModelMap mm, HttpServletRequest request) {
        int countAct = mergeDataService.countStatus("act");
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countDeni = mergeDataService.countStatus("deni");
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getData("deni");
        List<SaRequest> saRequest = saRequestDAO.findAll();
        mm.addAttribute("sa", saRequest);
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        mm.addAttribute("countAct", countAct);
        mm.addAttribute("countWait", countWait);
        mm.addAttribute("countWFS", countWFS);
        mm.addAttribute("countDeni", countDeni);
        return "tuchoi";
    }

    @RequestMapping(value = {"/thamdinh"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm, HttpServletRequest request) {
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countAct = mergeDataService.countStatus("act");
        int countDone = mergeDataService.countStatus("done");
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getData("wait");
        List<SaRequest> sa = saRequestDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        mm.addAttribute("sa", sa);
        mm.addAttribute("countWait", countWait);
        mm.addAttribute("countWFS", countWFS);
        mm.addAttribute("countAct", countAct);
        mm.addAttribute("countDone", countDone);
        return "thamdinh";
    }

    @RequestMapping(value = "/findHistoryModal", method = RequestMethod.POST)
    public @ResponseBody
    String findHistoryModal(HttpServletRequest request, HttpServletResponse response) {
        String customerPhone = request.getParameter("dataRequest");
        List<MergeDataOrder> result = mergeDataService.getSarequestModal(customerPhone);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        return responseStr;
    }

    @RequestMapping(value = "/changes", method = RequestMethod.POST)
    public @ResponseBody
    String changeStatusOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("datarequest");
        String status = request.getParameter("status");
        String step = request.getParameter("step");
        try {
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
            Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
            sa.setStatus(status.trim());
            sa.setEmployeeThamdinh(u.getUserLogin());
            sa.setEmployeeThamdinhDate(LocalDateTime.now());
            sa.setUpdatedDate(LocalDateTime.now());
            saRequestDAO.update(sa);
            return "success";
        } catch (Exception ex) {
            return "error";
        }
    }
}
