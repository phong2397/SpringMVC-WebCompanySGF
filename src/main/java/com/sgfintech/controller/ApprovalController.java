package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.service.SaRequestService;
import com.sgfintech.service.UseradminService;
import com.sgfintech.util.Consts;
import com.sgfintech.util.StringUtil;
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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ApprovalController {

    private static final Logger log = Logger.getLogger(ApprovalController.class);

    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    SaRequestDAO saRequestDAO;

    @Autowired
    UseradminDAO useradminDAO;

    @Autowired
    UseradminService useradminService;

    @Autowired
    SaRequestService saRequestService;


    @RequestMapping(value = {"/tuchoi"}, method = RequestMethod.GET)
    public String declinePage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        log.info("GET - Go into tuchoiPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataOrder> listMergeDataOrders = mergeDataService.getData("deni");
            log.info("Data merge table order and customer and companies: " + listMergeDataOrders);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            log.info("Data saRequest table: " + saRequest);
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDataOrders);
            int[] count = saRequestService.countStatus();
            log.info("Data count status array: " + count);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countDeni", count[4]);
            return "tuchoi";
        }
    }

//    @RequestMapping(value = {"/declineThamDinhPage"}, method = RequestMethod.GET)
//    public String declineThamDinhPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
//        log.info("GET - Go into tuchoiThamdinhPage");
//        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
//        if (u == null) {
//            return "redirect:login";
//        } else {
//            String empThamdinh = u.getUserLogin();
//            List<MergeDataOrder> listMergeDataOrders = mergeDataService.getUserThamdinh("deni", empThamdinh);
//            log.info("Data merge table order and customer and companies: " + listMergeDataOrders);
//            List<SaRequest> saRequest = saRequestDAO.findAll();
//            log.info("Data saRequest table find all: " + saRequest);
//            mm.addAttribute("sa", saRequest);
//            mm.addAttribute(Consts.Attr_ResultView, listMergeDataOrders);
//            int[] count = saRequestService.countStatus();
//            log.info("Data count status array: " + count);
//            mm.addAttribute("countAct", count[1]);
//            mm.addAttribute("countWait", count[2]);
//            mm.addAttribute("countWFS", count[3]);
//            mm.addAttribute("countDeni", count[4]);
//            return "tuchoithamdinh";
//        }
//    }

    @RequestMapping(value = {"/thamdinhRole"}, method = RequestMethod.GET)
    public String approvalRolePage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        log.info("GET - Go into thamdinhRolePage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            String empThamdinh = u.getUserLogin();
            List<MergeDataOrder> listThamdinhLogin = mergeDataService.getUserThamdinh("wait", empThamdinh);
            log.info("Data merge table order and customer and companies: " + listThamdinhLogin);
            mm.addAttribute(Consts.Attr_ResultView, listThamdinhLogin);
            List<SaRequest> sa = saRequestDAO.findAll();
            log.info("Data saRequest table find all : " + sa);
            mm.addAttribute("sa", sa);
            int[] count = saRequestService.countStatus();
            log.info("Data count status array: " + count);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countDone", count[5]);
            return "thamdinhRole";
        }
    }

    @RequestMapping(value = {"/tongtiepnhan"}, method = RequestMethod.GET)
    public String totalSaRequestPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        log.info("GET - Go into tongtiepnhanPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataTongTiepNhan();
            log.info("Data merge table order and customer and companies: " + listMergeDatumOrders);
            List<SaRequest> sa = saRequestDAO.findAll();
            log.info("Data saRequest table find all : " + sa);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            mm.addAttribute("sa", sa);
            int[] count = saRequestService.countStatus();
            log.info("Data count status array: " + count);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countDone", count[5]);
            return "tongtiepnhan";
        }
    }

    @RequestMapping(value = {"/thamdinh"}, method = RequestMethod.GET)
    public String approvalPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
//        int countWait = mergeDataService.countStatus("wait");
//        int countWFS = mergeDataService.countStatus("wfs");
//        int countAct = mergeDataService.countStatus("act");
//        int countDone = mergeDataService.countStatus("done");
        log.info("GET - Go into thamdinhPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getData("wait");
            log.info("Data merge table order and customer and companies: " + listMergeDatumOrders);
            List<SaRequest> sa = saRequestDAO.findAll();
            log.info("Data saRequest table find all : " + sa);
            List<Useradmin> admin = useradminDAO.findAll();
            log.info("Data userAdmin table find all: " + admin);
            mm.addAttribute("admin", admin);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            mm.addAttribute("sa", sa);
            int[] count = saRequestService.countStatus();
            log.info("Data count status array: " + count);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countDone", count[5]);
            return "thamdinh";
        }
    }

    @RequestMapping(value = "/updateEmployeeThamdinh", method = RequestMethod.POST)
    public @ResponseBody
    String updateEmployeeThamDinh(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - Go into updateEmployeeThamdinh");
        List<SaRequest> lst = new ArrayList<>();
        log.info("Data list saRequest array list: " + lst);
        String[] data = request.getParameterValues("datarequest[]");
        log.info("Data id saRequest: " + data);
        String employeeThamdinh = request.getParameter("employeeThamdinh");
        log.info("Data employee tham dinh: " + employeeThamdinh);
        for (String d : data) {
            log.info("Run for loop data");
            SaRequest s = new SaRequest();
            s.setId(Long.parseLong(d));
            s.setEmployeeThamdinh(employeeThamdinh);
            boolean lsResult = lst.add(s);
            log.info("List add data: " + lsResult);
        }
        try {
            int[][] countUpdate = saRequestService.updateRecordById(lst);
            log.info("Count employee tham dinh : " + countUpdate);
            if (countUpdate.length < 1) {
                log.info("Count employee tham dinh  < 1 --- return error ");
                return "error";
            } else {
                log.info("Count employee tham dinh  > 1 --- return success ");
                return "success";
            }
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/findHistoryModal", method = RequestMethod.POST)
    public @ResponseBody
    String findHistoryModal(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - Go into findHistoryModal");
        String phone = request.getParameter("phone");
        log.info("Data Phone : " + phone);
        List<MergeDataOrder> result = mergeDataService.findhistoryModal(phone);
        log.info("Data result find phone number and show history of this phone number of customer : " + result);
        Gson g = new Gson();
        String responseStr = g.toJson(result);
        log.info("Response String Json : " + responseStr);
        return responseStr;
    }

    @RequestMapping(value = "/changes", method = RequestMethod.POST)
    public @ResponseBody
    String changeStatusOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - Go into changeStatusOrder");
        String data = request.getParameter("datarequest");
        log.info("Data id request : " + data);
        String textDecline = request.getParameter("textDecline");
        log.info("Data description : " + textDecline);
        String status = request.getParameter("status");
        log.info("Data status : " + status);
        String step = request.getParameter("step");
        log.info("Data step : " + step);
        String employeeThamdinh = request.getParameter("employeeThamdinh");
        log.info("Data empployee tham dinh : " + employeeThamdinh);
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            if (!StringUtil.isEmpty(employeeThamdinh) && u.getUserLogin().equals(employeeThamdinh)) {
                log.info("Check employee tham dinh not empty ");
                if (status.equals("wfs")) {
                    log.info("Check status == wfs");
                    SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
                    log.info("Find id saRequest : " + sa);
                    sa.setStatus(status.trim());
                    sa.setDescription(textDecline);
                    sa.setEmployeeThamdinh(employeeThamdinh);
                    sa.setEmployeeThamdinhDate(LocalDateTime.now());
                    sa.setEmployeeDuyet(useradminService.randomUserXetDuyet());
                    sa.setUpdatedDate(LocalDateTime.now());
                    saRequestDAO.update(sa);
                    log.info("Update status wfs");
                    return "success";
                } else {
                    log.info("Check status != deni");
                    SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
                    log.info("Find id saRequest : " + sa);
                    sa.setStatus(status.trim());
                    sa.setDescription(textDecline);
                    sa.setEmployeeThamdinh(employeeThamdinh);
                    sa.setEmployeeThamdinhDate(LocalDateTime.now());
                    sa.setUpdatedDate(LocalDateTime.now());
                    saRequestDAO.update(sa);
                    log.info("Update status deni");
                    return "success";
                }
            } else {
                log.info("Wrong Role - Not allow do action");
                return "errorEmployee";
            }
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage());
            return "error";
        }
    }


    @RequestMapping(value = "/updateStatusDecline", method = RequestMethod.POST)
    public @ResponseBody
    String updateStatusDecline(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - Go into updateStatusDecline");
        String data = request.getParameter("datarequest");
        log.info("Data id request : " + data);
        String status = request.getParameter("status");
        log.info("Data status : " + status);
        String step = request.getParameter("step");
        log.info("Data step : " + step);
        String textDecline = request.getParameter("textDecline");
        log.info("Data description : " + textDecline);
        String employee = request.getParameter("employee");
        log.info("Data empployee tham dinh or ky duyet : " + employee);
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            log.info("Check employee (thamdinh or kyduyet) not empty and  get user login == employee(thamdinh or kyduyet)");
            if (!StringUtil.isEmpty(employee) && u.getUserLogin().equals(employee)) {
                if (u.getRole().equals("nvkyduyet")) {
                    SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
                    log.info("Find id saRequest : " + sa);
                    sa.setStatus(status.trim());
                    sa.setDescription(textDecline);
                    sa.setEmployeeDuyetDate(LocalDateTime.now());
                    sa.setEmployeeDuyet(employee);
                    sa.setCreatedDate(LocalDateTime.now());
                    sa.setUpdatedDate(LocalDateTime.now());
                    saRequestDAO.update(sa);
                    log.info("Update status deni to wait or wfs");
                    return "success";
                } else {
                    SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
                    log.info("Find id saRequest : " + sa);
                    sa.setStatus(status.trim());
                    sa.setDescription(textDecline);
                    sa.setEmployeeThamdinhDate(LocalDateTime.now());
                    sa.setEmployeeThamdinh(employee);
                    sa.setCreatedDate(LocalDateTime.now());
                    sa.setUpdatedDate(LocalDateTime.now());
                    saRequestDAO.update(sa);
                    log.info("Update status deni to wait or wfs");
                    return "success";
                }
            } else {
                log.info("!= Role - Not allow do action");
                return "errorEmployee";
            }
        } catch (Exception ex) {
            log.error("Exception : " + ex.getMessage());
            return "error";
        }
    }

}
