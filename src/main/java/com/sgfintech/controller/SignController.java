package com.sgfintech.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sgfintech.dao.*;
import com.sgfintech.entity.*;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.handler.RequestGateway;
import com.sgfintech.handler.SignatureRSA;
import com.sgfintech.service.CustomerService;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.service.SaRequestService;
import com.sgfintech.util.Consts;
import com.sgfintech.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class SignController {
    private static final Logger log = Logger.getLogger(SignController.class);
    @Autowired
    private MergeDataService mergeDataService;

    @Autowired
    private SaRequestDAO saRequestDAO;

    @Autowired
    CustomerService customerService;

    @Autowired
    ContractDAO contractDAO;

    @Autowired
    private ApplicationContext context;

    @Autowired
    UseradminDAO useradminDAO;

    @Autowired
    SaRequestService saRequestService;

    @RequestMapping(value = {"/kyduyetRole"}, method = RequestMethod.GET)
    public String kyduyetlogin(ModelMap mm, HttpServletRequest request, HttpSession session) {
//        int countAct = mergeDataService.countStatus("act");
//        int countWait = mergeDataService.countStatus("wait");
//        int countWFS = mergeDataService.countStatus("wfs");
//        int countDone = mergeDataService.countStatus("done");
        log.info("GET - Go into kyduyetRole Page");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            String empDuyet = u.getUserLogin();
            List<MergeDataOrder> listkyduyetLogin = mergeDataService.getUserDuyet("wfs", empDuyet);
            log.info("list employee xet duyet: " + listkyduyetLogin);
            mm.addAttribute(Consts.Attr_ResultView, listkyduyetLogin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            log.info("list saRequest: " + saRequest);
            mm.addAttribute("sa", saRequest);
            int count[] = saRequestService.countStatus();
            log.info("count status: " + count);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countDone", count[5]);
            return "kyduyetRole";
        }
    }

    @RequestMapping(value = {"/tuchoikyduyet"}, method = RequestMethod.GET)
    public String declineKyduyetPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
//        int countAct = mergeDataService.countStatus("act");
//        int countWait = mergeDataService.countStatus("wait");
//        int countWFS = mergeDataService.countStatus("wfs");
//        int countDeni = mergeDataService.countStatus("deni");
        log.info("GET - Go into declineKyduyetPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            String empDuyet = u.getUserLogin();
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getUserDuyet("deni", empDuyet);
            log.info("list tuchoi nhan vien ky duyet: " + listMergeDatumOrders);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            log.info("list saResquest : " + saRequest);
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            int count[] = saRequestService.countStatus();
            log.info("count status : " + count);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countDeni", count[2]);
            return "tuchoikyduyet";
        }
    }

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.GET)
    public String kyduyetPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
//        int countWait = mergeDataService.countStatus("wait");
//        int countWFS = mergeDataService.countStatus("wfs");
//        int countAct = mergeDataService.countStatus("act");
//        int countDone = mergeDataService.countStatus("done");
        log.info("GET - Go into kyduyetPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("wfs", false);
            log.info("list tuchoi nhan vien ky duyet: " + listMergeDatumOrders);
            List<Useradmin> admin = useradminDAO.findAll();
            log.info("list user admin: " + admin);
            mm.addAttribute("admin", admin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            log.info("list saRequest: " + saRequest);
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            int count[] = saRequestService.countStatus();
            log.info("count status : " + count);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countDone", count[5]);
            return "kyduyet";
        }
    }

    @RequestMapping(value = {"/giaingan"}, method = RequestMethod.GET)
    public String giainganPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
//        int countWait = mergeDataService.countStatus("wait");
//        int countWFS = mergeDataService.countStatus("wfs");
//        int countAct = mergeDataService.countStatus("act");
//        int countDone = mergeDataService.countStatus("done");
        log.info("GET - Go into giainganPage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
//            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("act", false);
            List<DetailTransaction> listActive = detailTransactionDAO.findAllByActive(1);
            log.info("list detail transaction: " + listActive);
            List<Useradmin> admin = useradminDAO.findAll();
            log.info("list user admin: " + admin);
            mm.addAttribute("admin", admin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            log.info("list saRequest: " + saRequest);
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listActive);
            int count[] = saRequestService.countStatus();
            log.info("count status : " + count);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countDone", count[5]);
            return "giaingan";
        }
    }

    @RequestMapping(value = "/updateEmployeeDuyet", method = RequestMethod.POST)
    public @ResponseBody
    String updateEmployeeDuyet(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - updateEmployeeDuyet");
        List<SaRequest> lst = new ArrayList<>();
        String[] data = request.getParameterValues("datarequest[]");
        log.info("data id saRequest" + data);
        String employeeDuyet = request.getParameter("employeeDuyet");
        log.info("data employee duyet" + employeeDuyet);
        for (String d : data) {
            log.info("Run for loop data");
            SaRequest s = new SaRequest();
            s.setId(Long.parseLong(d));
            s.setEmployeeDuyet(employeeDuyet);
            boolean lsResult = lst.add(s);
            log.info("List add data: " + lsResult);
        }
        try {
            int[][] countUpdate = saRequestService.updateemployeeDuyetById(lst);
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

    @RequestMapping(value = {"/giaingan"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerOrderRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - giaingan");
        String data = request.getParameter("datarequest");
        log.info("Data id saRequest: " + data);
        String textDecline = request.getParameter("textDecline");
        log.info("Data description: " + textDecline);
        String status = request.getParameter("status");
        log.info("Data status: " + status);
        String step = request.getParameter("step");
        log.info("Data step: " + step);
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            log.info("Check empty employee duyet ");
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
            sa.setStatus(status.trim());
            sa.setDescription(textDecline);
            sa.setUpdatedDate(LocalDateTime.now());
            saRequestDAO.update(sa);
            return "success";

        } catch (Exception ex) {
            log.error("Exception:" + ex.getMessage());
            return "error";
        }
    }

    @Autowired
    DetailTransactionDAO detailTransactionDAO;

    @Autowired
    CustomerDAO customerDAO;

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerdisburseRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
//        SignatureRSA signatureRSA = context.getBean(SignatureRSA.class);
        log.info("POST - kyduyet");
        String data = request.getParameter("datarequest");
        log.info("Data id sarequest: " + data);
        String status = request.getParameter("status");
        log.info("Data status: " + status);
        String step = request.getParameter("step");
        log.info("Data step: " + step);
        String textDecline = request.getParameter("textDecline");
        log.info("Data textDecline: " + textDecline);
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
            log.info("Data id sarequest: " + sa);
            Customer cu = customerService.getCustomerByPhone(sa.getCustomerPhone());
            log.info("customer find by phone: " + cu);
            String uuid = UUID.randomUUID().toString();
            String requestId = "BK" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            if (!StringUtil.isEmpty(u) && u.getUserLogin().equals("ketoan")) {
                if (status.equals("done")) {
                    log.info("check status == done");
                    Contract ct = new Contract();
                    ct.setIdContract(sa.getId());
                    ct.setSystemTrace(uuid);
                    ct.setCustomerPhone(cu.getCustomerPhone());
                    ct.setBorrow(sa.getBorrow());
                    ct.setTimeBorrow(sa.getTimeBorrow());
                    ct.setRemainAmountBorrow(sa.getBorrow());
                    ct.setFeeBorrow(sa.getFeeBorrow());
                    ct.setTransactionId(requestId);
                    ct.setStatus("act");
                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.DATE, +30);
                    ct.setDateRepayment(LocalDateTime.now().plusDays(30));
                    ct.setCreatedDate(sa.getUpdatedDate());
                    ct.setAcceptedBy(u.getUserLogin());
                    contractDAO.save(ct);
                    sa.setDescription(textDecline);
                    sa.setEmployeeDuyet(sa.getEmployeeDuyet());
                    sa.setEmployeeDuyetDate(LocalDateTime.now());
                    sa.setUpdatedDate(LocalDateTime.now());
                    sa.setStatus(status);
                    saRequestDAO.update(sa);
                    Customer c = customerDAO.findByPhone(sa.getCustomerPhone());
                    final DetailTransaction d = new DetailTransaction();
                    d.setId(sa.getId());
                    d.setCompanyCode(c.getCompanyCode());
                    d.setCustomerName(c.getCustomerName());
                    d.setBankAccount(c.getCustomerBankAcc());
                    d.setBankOwner(c.getCustomerBank());
                    d.setBankName(c.getCustomerBankName());
                    d.setCustomerPhone(c.getCustomerPhone());
                    d.setAmount(sa.getBorrow());
                    d.setInterestRate(sa.getInterestRate());
                    d.setDateRequest(LocalDateTime.now());
                    d.setTotal((int) (sa.getBorrow() + ((int) (sa.getBorrow() * sa.getInterestRate()))));
                    d.setStatus("active");
                    final Thread task = new Thread(() -> detailTransactionDAO.save(d));
                    task.start();
                    return "success";
                } else if (status.equals("deni")) {
                    log.info("check status == deni");
                    sa.setEmployeeDuyetDate(LocalDateTime.now());
                    sa.setUpdatedDate(LocalDateTime.now());
                    sa.setStatus(status);
                    saRequestDAO.update(sa);
                    return "success";
                }
                return "errorStatus";
            } else {
                return "errorEmployee";
            }
            //todo virtual account va tao collection point
        } catch (Exception ex) {
            return "error";
        }
    }
}

