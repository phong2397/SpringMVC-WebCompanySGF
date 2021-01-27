package com.sgfintech.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sgfintech.dao.ContractDAO;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.dao.UseradminDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.handler.RequestGateway;
import com.sgfintech.handler.SignatureRSA;
import com.sgfintech.service.CustomerService;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.service.SaRequestService;
import com.sgfintech.util.Consts;
import com.sgfintech.util.StringUtil;
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
    public String kyduyetRole(ModelMap mm, HttpServletRequest request, HttpSession session) {
        int countAct = mergeDataService.countStatus("act");
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countDone = mergeDataService.countStatus("done");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            String empDuyet = u.getUserLogin();
            List<MergeDataOrder> listXetduyetLogin = mergeDataService.getUserDuyet("wfs", empDuyet);
            mm.addAttribute(Consts.Attr_ResultView, listXetduyetLogin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            mm.addAttribute("sa", saRequest);
            mm.addAttribute("countAct", countAct);
            mm.addAttribute("countWait", countWait);
            mm.addAttribute("countWFS", countWFS);
            mm.addAttribute("countDone", countDone);
            return "kyduyetRole";
        }
    }

    @RequestMapping(value = {"/tuchoikyduyet"}, method = RequestMethod.GET)
    public String tuchoieKyduyetPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        int countAct = mergeDataService.countStatus("act");
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countDeni = mergeDataService.countStatus("deni");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            String empDuyet = u.getUserLogin();
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getUserDuyet("deni", empDuyet);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            mm.addAttribute("countAct", countAct);
            mm.addAttribute("countWait", countWait);
            mm.addAttribute("countWFS", countWFS);
            mm.addAttribute("countDeni", countDeni);
            return "tuchoikyduyet";
        }
    }

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.GET)
    public String kyduyetPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countAct = mergeDataService.countStatus("act");
        int countDone = mergeDataService.countStatus("done");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("wfs", false);
            List<Useradmin> admin = useradminDAO.findAll();
            mm.addAttribute("admin", admin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            mm.addAttribute("countWait", countWait);
            mm.addAttribute("countWFS", countWFS);
            mm.addAttribute("countAct", countAct);
            mm.addAttribute("countDone", countDone);
            return "kyduyet";
        }
    }

    @RequestMapping(value = {"/giaingan"}, method = RequestMethod.GET)
    public String giainganPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        int countWait = mergeDataService.countStatus("wait");
        int countWFS = mergeDataService.countStatus("wfs");
        int countAct = mergeDataService.countStatus("act");
        int countDone = mergeDataService.countStatus("done");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("act", false);
            List<Useradmin> admin = useradminDAO.findAll();
            mm.addAttribute("admin", admin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
            mm.addAttribute("countWait", countWait);
            mm.addAttribute("countWFS", countWFS);
            mm.addAttribute("countAct", countAct);
            mm.addAttribute("countDone", countDone);
            return "giaingan";
        }
    }

    @RequestMapping(value = "/updateEmployeeDuyet", method = RequestMethod.POST)
    public @ResponseBody
    String updateEmployeeDuyet(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<SaRequest> lst = new ArrayList<>();
        String[] data = request.getParameterValues("datarequest[]");
        System.out.println(data);

        String employeeDuyet = request.getParameter("employeeDuyet");
        for (String d : data) {
            SaRequest s = new SaRequest();
            s.setId(Long.parseLong(d));
            s.setEmployeeDuyet(employeeDuyet);
            lst.add(s);
        }
        try {
            int[][] countUpdate = saRequestService.updateemployeeDuyetById(lst);
            if (countUpdate.length < 1) {
                return "error";
            } else {
                return "success";
            }
        } catch (Exception ex) {
            return "error";
        }
    }

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerOrderRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("datarequest");
        String textDecline = request.getParameter("textDecline");
        String status = request.getParameter("status");
        String step = request.getParameter("step");
        String employeeDuyet = request.getParameter("employeeDuyet");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            if (!StringUtil.isEmpty(employeeDuyet) && u.getUserLogin().equals(employeeDuyet)) {
                SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
                sa.setStatus(status.trim());
                sa.setDescription(textDecline);
                sa.setEmployeeDuyet(employeeDuyet);
                sa.setEmployeeDuyetDate(LocalDateTime.now());
                sa.setEmployeeDuyet(employeeDuyet);
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

    @RequestMapping(value = {"/giaingan"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerdisburseRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        SignatureRSA signatureRSA = context.getBean(SignatureRSA.class);
        String data = request.getParameter("datarequest"); //id cua order request
        String status = request.getParameter("status");
        String step = request.getParameter("step");
        String textDecline = request.getParameter("textDecline");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
            Customer cu = customerService.getCustomerByPhone(sa.getCustomerPhone());
            String uuid = UUID.randomUUID().toString();
            String requestId = "BK" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            if (!StringUtil.isEmpty(u) && u.getUserLogin().equals("ketoan")) {
                if (status.equals("done")) {
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
                    return "success";
                } else if (status.equals("deni")) {
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

