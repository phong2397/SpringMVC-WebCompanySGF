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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
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
    public String signRolePage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        log.info("GET - signRolePage");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            String empDuyet = u.getUserLogin();
            List<MergeDataOrder> listXetduyetLogin = mergeDataService.getUserDuyet("wfs", empDuyet);
            mm.addAttribute(Consts.Attr_ResultView, listXetduyetLogin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            mm.addAttribute("sa", saRequest);
            int count[] = saRequestService.countStatus();
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countDone", count[5]);
            return "kyduyetRole";
        }
    }

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.GET)
    public String signPage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        log.info("GET - kyduyetPage");
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
            int count[] = saRequestService.countStatus();
            mm.addAttribute("countWait", count[2]);
            mm.addAttribute("countWFS", count[3]);
            mm.addAttribute("countAct", count[1]);
            mm.addAttribute("countDone", count[5]);
            return "kyduyet";
        }
    }

    @RequestMapping(value = {"/giaingan"}, method = RequestMethod.GET)
    public String disbursePage(ModelMap mm, HttpServletRequest request, HttpSession session) {
        log.info("GET - giaingan page");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<DetailTransaction> listActive = detailTransactionDAO.findAllByActive(1);
            List<Useradmin> admin = useradminDAO.findAll();
            mm.addAttribute("admin", admin);
            List<SaRequest> saRequest = saRequestDAO.findAll();
            mm.addAttribute("sa", saRequest);
            mm.addAttribute(Consts.Attr_ResultView, listActive);
            int count[] = saRequestService.countStatus();
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
        log.info("POST - update employee duyet");
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

    private ServletContext servletContext;

    @RequestMapping(value = {"/giaingan"}, method = RequestMethod.POST)
    public @ResponseBody
    String disburseRequest(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        log.info("POST - giaingan");
        String id = request.getParameter("id_donhang");
        try {
            String path = System.getProperty("catalina.home") + "/webapps/uynhiemchi/";
            log.info("Path : " + path);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-sss");
            String fileName = sdf.format(date) + multipartFile.getOriginalFilename();
            File file = new File(path, fileName);
            if (!file.exists()) {
                log.info("Check file not exiist : ");
                file.mkdirs();
            }
            multipartFile.transferTo(file);
            String expath = "uynhiemchi/" + fileName;
            if (expath != null) {
                log.info("Check file not null");
                DetailTransaction detailTransaction = detailTransactionDAO.findById(Integer.parseInt(id));
                log.info("detailTransaction: " + detailTransaction);
                Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
                detailTransaction.setPayImages(expath);
                detailTransaction.setPayer(u.getUserLogin());
                detailTransaction.setStatus("done");
                detailTransaction.setPayDate(LocalDateTime.now());
                detailTransactionDAO.update(detailTransaction);
                log.info("success");
                return "success";
            } else {
                log.info("Error no exist path");
                return "errorNoExistPath";

            }

        } catch (Exception ex) {
            return null;
        }
    }


//        log.info("POST - giaingan");
//        String data = request.getParameter("datarequest");
//        log.info("Data id saRequest: " + data);
//        String textDecline = request.getParameter("textDecline");
//        log.info("Data description: " + textDecline);
//        String status = request.getParameter("status");
//        log.info("Data status: " + status);
//        String step = request.getParameter("step");
//        log.info("Data step: " + step);
//        String employeeDuyet = request.getParameter("employeeDuyet");
//        log.info("Data employeeDuyet: " + employeeDuyet);
//        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
//        try {
//            if (!StringUtil.isEmpty(employeeDuyet) && u.getUserLogin().equals(employeeDuyet)) {
//                log.info("Check empty employee duyet ");
//                SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
//                sa.setStatus(status.trim());
//                sa.setDescription(textDecline);
//                sa.setEmployeeDuyet(employeeDuyet);
//                sa.setEmployeeDuyetDate(LocalDateTime.now());
//                sa.setEmployeeDuyet(employeeDuyet);
//                sa.setUpdatedDate(LocalDateTime.now());
//                saRequestDAO.update(sa);
//                return "success";
//            } else {
//                log.info("Error role");
//                return "errorEmployee";
//            }
//        } catch (Exception ex) {
//            log.error("Exception:" + ex.getMessage());
//            return "error";
//        }

    @Autowired
    DetailTransactionDAO detailTransactionDAO;

    @Autowired
    CustomerDAO customerDAO;

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.POST)
    public @ResponseBody
    String handleSignRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
        String employeeDuyet = request.getParameter("employeeDuyet");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
            log.info("Data id sarequest: " + sa);
            Customer cu = customerService.getCustomerByPhone(sa.getCustomerPhone());
            String uuid = UUID.randomUUID().toString();
            String requestId = "BK" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            if (!StringUtil.isEmpty(u) && u.getUserLogin().equals(employeeDuyet)) {
                if (status.equals("act")) {
                    log.info("check status == act");
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
                    sa.setDescription("Chuyển tiền thành công");
                    sa.setEmployeeDuyet(sa.getEmployeeDuyet());
                    sa.setEmployeeDuyetDate(LocalDateTime.now());
                    sa.setStatus(status);
                    sa.setUpdatedDate(LocalDateTime.now());
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
                    sa.setDescription(textDecline);
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

