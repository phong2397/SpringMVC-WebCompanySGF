package com.sgfintech.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sgfintech.dao.ContractDAO;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.handler.RequestGateway;
import com.sgfintech.handler.SignatureRSA;
import com.sgfintech.service.CustomerService;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
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
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
    @RequestMapping(value = {"/thamdinh"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm, HttpServletRequest request) {
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("wait",false);
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        return "thamdinh";
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
            sa.setStatus(status);
            sa.setEmployeeThamdinh(u.getUserLogin());
            sa.setEmployeeThamdinhDate(LocalDateTime.now());
            saRequestDAO.update(sa);
            return "success";
        } catch (Exception ex) {
            return "error";
        }
    }

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("wfs", true);
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        return "kyduyet";
    }

    @RequestMapping(value = {"/kyduyet"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerOrderRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        SignatureRSA signatureRSA = context.getBean(SignatureRSA.class);
        String data = request.getParameter("datarequest"); //id cua order request
        String status = request.getParameter("status");
        String step = request.getParameter("step");
        try {
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data)); //sa.getBorrow();
            Customer cu = customerService.getCustomerByPhone(sa.getCustomerPhone());

            Date date = new Date();
            String partnerCode = "VAYSV";
            String requestId = "BK" + new SimpleDateFormat("yyyyMMddHHmmss").format(date);
            String requestTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            Integer operation = 9001;
            String uuid = UUID.randomUUID().toString();
            JsonObject j = new JsonObject();
            j.addProperty("RequestId", requestId);
            j.addProperty("RequestTime", requestTime);
            j.addProperty("PartnerCode", partnerCode);
            j.addProperty("Operation", operation);
            j.addProperty("BankNo", "970457");
            j.addProperty("AccNo", "100100132448");
            j.addProperty("AccType", "0");
            String messageCheck = requestId + "|" + requestTime + "|" + partnerCode + "|" + operation + "|970457|100100132448|0";
            String sign = signatureRSA.sign(messageCheck);
            j.addProperty("Signature", sign);

            String resultCheck = RequestGateway.checkUser(j);
            //todo thuc hien chuyen khoan
            Gson g = new Gson();
            JsonObject resultRes = g.fromJson(resultCheck, JsonObject.class);
//            if (!(resultRes.get("ResponseCode").getAsInt() == 200)) {
//                return "error";
//            }
            j = new JsonObject();
            date = new Date();
            requestId = "BK" + new SimpleDateFormat("yyyyMMddHHmmss").format(date);
            requestTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            operation = 9002;
            j.addProperty("RequestId", requestId);
            j.addProperty("RequestTime", requestTime);
            j.addProperty("PartnerCode", partnerCode);
            j.addProperty("Operation", operation);
            j.addProperty("ReferenceId", uuid);
            j.addProperty("BankNo", "970457");
            j.addProperty("AccNo", "100100132448");
            j.addProperty("AccType", "0");
            j.addProperty("RequestAmount", sa.getBorrow() + "");
            String memo = "Hach toan cho khach hang " + cu.getCustomerName();
            j.addProperty("Memo", memo);
            j.addProperty("AccountName", "CONG TY TNHH THIET KE ZIOVI");
            j.addProperty("ContractNumber", "123456789");
            messageCheck = requestId + "|" + requestTime + "|" + partnerCode + "|" + operation + "|" + uuid + "|970457|100100132448|0|" + sa.getBorrow() + "|" + memo;
            sign = signatureRSA.sign(messageCheck);
            j.addProperty("Signature", sign);
            resultCheck = RequestGateway.checkUser(j);
            resultRes = g.fromJson(resultCheck, JsonObject.class);
//            if (!(resultRes.get("ResponseCode").getAsInt() == 200)) {
//                return "error";
//            } else {
//            }
                Contract ct = new Contract();
                ct.setIdContract(sa.getId());
                ct.setSystemTrace(uuid);
                ct.setCustomerPhone(cu.getCustomerPhone());
                ct.setBorrow(sa.getBorrow());
                ct.setTimeBorrow(sa.getTimeBorrow());
                ct.setRemainAmountBorrow(sa.getBorrow());
                ct.setFeeBorrow(sa.getFeeBorrow());
//                ct.setTransactionId(resultRes.get("TransactionId").getAsString());
                ct.setTransactionId(requestId);
                ct.setStatus("act");
                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, +30);
                ct.setDateRepayment(LocalDateTime.now().plusDays(30));

                Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
                ct.setAcceptedBy(u.getUserLogin());
                contractDAO.save(ct);

                sa.setEmployeeDuyet(u.getUserLogin());
                sa.setEmployeeDuyetDate(LocalDateTime.now());
                sa.setStatus("act");
                saRequestDAO.update(sa);
                return "success";
            //todo virtual account va tao collection point
        } catch (Exception ex) {
            return "error";
        }
    }
}
