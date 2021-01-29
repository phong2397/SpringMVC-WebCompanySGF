package com.sgfintech.controller;

import com.sgfintech.dao.ContractDAO;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class WriteoffController {
    @Autowired
    UseradminDAO useradminDAO;

    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;

    @Autowired
    SaRequestDAO saRequestDAO;

    private static final Logger log = Logger.getLogger(WriteoffController.class);

    @RequestMapping(value = {"/nhacphi"}, method = RequestMethod.GET)
    public String nhacphiPage(ModelMap mm, HttpSession session) {

        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "redirect:login";
        } else {
            List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("act", true, "");
            List<Contract> contract = contractDAO.findAll();
            List<Useradmin> admin = useradminDAO.findAll();
            mm.addAttribute("admin", admin);
            mm.addAttribute("con", contract);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "nhacphi";
        }
    }

    @RequestMapping(value = {"/gachno"}, method = RequestMethod.GET)
    public String gachnoPage(ModelMap mm, HttpSession session) {

        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "redirect:login";
        } else {
            List<MergeDataWithdraw> listdata = mergeDataService.gachnodata("");
            List<Contract> contract = contractDAO.findAll();
            mm.addAttribute("con", contract);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "gachno";
        }
    }

    @RequestMapping(value = {"/theodoikhoantamung"}, method = RequestMethod.GET)
    public String theodoikhoantamungPage(ModelMap mm, HttpSession session) {

        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "redirect:login";
        } else {
            int countAct = mergeDataService.contractStatus("act");
            int countDone = mergeDataService.contractStatus("done");
            List<MergeDataWithdraw> listdata = mergeDataService.theodoikhoantamung("");
            List<Contract> contract = contractDAO.findAll();
            mm.addAttribute("con", contract);
            mm.addAttribute(Consts.Attr_ResultView, listdata);
            mm.addAttribute("countDone", countDone);
            mm.addAttribute("countAct", countAct);
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "theodoikhoantamung";
        }
    }

    @RequestMapping(value = {"/gachno"}, method = RequestMethod.POST)
    public @ResponseBody
    String gachnotoanphanAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        String data = request.getParameter("datarequest");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            Contract ct = contractDAO.findById(Long.parseLong(data));
            if (!StringUtil.isEmpty(u) && u.getUserLogin().equals("ketoan")) {
                ct.setStatus("done");
                ct.setRemainAmountBorrow(0l);
                ct.setAcceptedBy(u.getUserLogin());
                ct.setDateRepayment(LocalDateTime.now());
                ct.setUpdatedDate(LocalDateTime.now());
                contractDAO.update(ct);
                log.info("test log ===============================");
                log.info(System.getProperty("catalina.base"));
                log.info(System.getProperty("catalina.home"));
                return "success";
            } else {
                log.info("test log ===============================");
                log.info(System.getProperty("catalina.base"));
                log.info(System.getProperty("catalina.home"));
                return "roleError";
            }
        } catch (Exception ex) {
            log.info("test log ===============================");
            log.info(System.getProperty("catalina.base"));
            log.info(System.getProperty("catalina.home"));
            return "error";
        }
    }
}
