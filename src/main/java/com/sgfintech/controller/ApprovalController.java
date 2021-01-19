package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.service.SaRequestService;
import com.sgfintech.util.Consts;
import com.sgfintech.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

    @Autowired
    UseradminDAO useradminDAO;

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

    @RequestMapping(value = {"/tuchoithamdinh"}, method = RequestMethod.GET)
    public String declineThamdinhPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        int countAct = mergeDataService.countStatus("act");
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countDeni = mergeDataService.countStatus("deni");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String empThamdinh = u.getUserLogin();
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getUserThamdinh("deni", empThamdinh);
        List<SaRequest> saRequest = saRequestDAO.findAll();
        mm.addAttribute("sa", saRequest);
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        mm.addAttribute("countAct", countAct);
        mm.addAttribute("countWait", countWait);
        mm.addAttribute("countWFS", countWFS);
        mm.addAttribute("countDeni", countDeni);
        return "tuchoithamdinh";
    }

    @RequestMapping(value = {"/thamdinhlogin"}, method = RequestMethod.GET)
    public String showthamdinhLogin(ModelMap mm, HttpServletRequest request, HttpSession session) {
        int countAct = mergeDataService.countStatus("act");
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countDone = mergeDataService.countStatus("done");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        String empThamdinh = u.getUserLogin();
        List<MergeDataOrder> listThamdinhLogin = mergeDataService.getUserThamdinh("wait", empThamdinh);
        mm.addAttribute(Consts.Attr_ResultView, listThamdinhLogin);
        mm.addAttribute("countAct", countAct);
        mm.addAttribute("countWait", countWait);
        mm.addAttribute("countWFS", countWFS);
        mm.addAttribute("countDone", countDone);
        return "thamdinhlogin";
    }

    @RequestMapping(value = {"/tongtiepnhan"}, method = RequestMethod.GET)
    public String tongtiepnhanPage(ModelMap mm, HttpServletRequest request) {
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countAct = mergeDataService.countStatus("act");
        int countDone = mergeDataService.countStatus("done");
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataTongTiepNhan();
        List<SaRequest> sa = saRequestDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        mm.addAttribute("sa", sa);
        mm.addAttribute("countWait", countWait);
        mm.addAttribute("countWFS", countWFS);
        mm.addAttribute("countAct", countAct);
        mm.addAttribute("countDone", countDone);
        return "tongtiepnhan";
    }

    @RequestMapping(value = {"/thamdinh"}, method = RequestMethod.GET)
    public String thamdinhPage(ModelMap mm, HttpServletRequest request) {
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countAct = mergeDataService.countStatus("act");
        int countDone = mergeDataService.countStatus("done");
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getData("wait");
        List<SaRequest> sa = saRequestDAO.findAll();
        List<Useradmin> admin = useradminDAO.findAll();
        mm.addAttribute("admin", admin);
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        mm.addAttribute("sa", sa);
        mm.addAttribute("countWait", countWait);
        mm.addAttribute("countWFS", countWFS);
        mm.addAttribute("countAct", countAct);
        mm.addAttribute("countDone", countDone);
        return "thamdinh";
    }

    @Autowired
    SaRequestService saRequestService;

    @RequestMapping(value = "/updateEmployeeThamdinh", method = RequestMethod.POST)
    public @ResponseBody
    String updateEmployeeThamdinh(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<SaRequest> lst = new ArrayList<>();
        String[] data = request.getParameterValues("datarequest[]");
        System.out.println(data);

        String employeeThamdinh = request.getParameter("employeeThamdinh");
        for (String d : data) {
            SaRequest s = new SaRequest();
            s.setId(Long.parseLong(d));
            s.setEmployeeThamdinh(employeeThamdinh);
            lst.add(s);
        }
        try {
            int[][] countUpdate = saRequestService.updateRecordById(lst);
            if (countUpdate.length < 1) {
                return "error";
            } else {
                return "success";
            }
        } catch (Exception ex) {
            return "error";
        }
    }

    @RequestMapping(value = "/changes", method = RequestMethod.POST)
    public @ResponseBody
    String changeStatusOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("datarequest");
        String textDecline = request.getParameter("textDecline");
        String status = request.getParameter("status");
        String step = request.getParameter("step");
        String employeeThamdinh = request.getParameter("employeeThamdinh");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            if (!StringUtil.isEmpty(employeeThamdinh) && u.getUserLogin().equals(employeeThamdinh)) {
                SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
                sa.setStatus(status.trim());
                sa.setDescription(textDecline);
                sa.setEmployeeThamdinh(employeeThamdinh);
                sa.setEmployeeThamdinhDate(LocalDateTime.now());
                sa.setUpdatedDate(LocalDateTime.now());
                saRequestDAO.update(sa);
                return "success";
            } else {
                return "errorEmployee";
            }
        } catch (Exception ex) {
            return "error";
        }
    }

}
