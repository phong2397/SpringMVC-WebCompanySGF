package com.sgfintech.controller;

import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
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
}
