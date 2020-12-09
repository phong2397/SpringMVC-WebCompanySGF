package com.sgfintech.controller;

import com.google.gson.JsonObject;
import com.sgfintech.dao.SaRequestDAO;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.handler.MergeData;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    

    @RequestMapping(value = { "/xetduyet" }, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm, HttpServletRequest request) {
        List<MergeData> listMergeData = mergeDataService.getDataShow("wait");
        mm.addAttribute(Consts.Attr_ResultView, listMergeData);
        System.out.println(listMergeData);
        return "xetduyet";
    }

    @RequestMapping(value = "/xetduyet/changes", method = RequestMethod.POST )
    public String changeStatusOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("datarequest");
        String status = request.getParameter("status");
        try {
            List<SaRequest> list = saRequestDAO.findAll();
            SaRequest sa = saRequestDAO.findById(Long.parseLong(data));
            sa.setStatus(status);
            saRequestDAO.update(sa);
            System.out.println(data + status);
            System.out.println(sa);
            return "success";
        } catch (Exception ex) {
            return "error";
        }
    }
}
