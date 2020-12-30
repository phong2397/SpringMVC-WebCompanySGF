package com.sgfintech.controller;

import com.sgfintech.dao.ContractDAO;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class WriteoffController {

    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ContractDAO contractDAO;

    @Autowired
    SaRequestDAO saRequestDAO;

    @RequestMapping(value = {"/gachno"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("act", true, "");
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "gachno";
    }

    @RequestMapping(value = {"/gachno"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerWriteoffRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("datarequest");
        String status = request.getParameter("status");
        try {
            Contract ct = contractDAO.findById(Long.parseLong(data));
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
//            Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
//            ct.setAcceptedBy(u.getUserLogin());
            sa.setStatus(status);
            ct.setStatus(status);
            ct.setBorrow(0l);
            ct.setDateRepayment(LocalDate.now());
            contractDAO.update(ct);
            saRequestDAO.update(sa);
              return "success";
        } catch (Exception ex) {
            return "error";
        }
    }
}
