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

    @RequestMapping(value = {"/nhacphi"}, method = RequestMethod.GET)
    public String chothuhoi(ModelMap mm) {
        List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("act", true, "");
        List<Contract> contract = contractDAO.findAll();
        List<Useradmin> admin = useradminDAO.findAll();
        mm.addAttribute("admin", admin);
        mm.addAttribute("con", contract);
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "nhacphi";
    }

    @RequestMapping(value = {"/gachno"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        List<MergeDataWithdraw> listdata = mergeDataService.gachnodata("");
        List<Contract> contract = contractDAO.findAll();
        mm.addAttribute("con", contract);
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "gachno";
    }

    @RequestMapping(value = {"/gachno"}, method = RequestMethod.POST)
    public @ResponseBody
    String handlerWriteoffRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("datarequest");
        String moneyRepay = request.getParameter("moneyRepay");
        String moneyRemainAmount = request.getParameter("moneyRemainAmount");
        String Total = request.getParameter("total");
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        try {
            Contract ct = contractDAO.findById(Long.parseLong(data));
            if (!StringUtil.isEmpty(u) && u.getUserLogin().equals("ketoan")) {
                if (Total.equals("0") || Long.parseLong(Total) < 0) {
                    ct.setStatus("done");
                    ct.setRemainAmountBorrow(0l);
                    ct.setAcceptedBy(u.getUserLogin());
                    ct.setDateRepayment(LocalDateTime.now());
                    ct.setUpdatedDate(LocalDateTime.now());
                    contractDAO.update(ct);
                    return "success";
                } else {
                    ct.setStatus("notcomplete");
                    ct.setRemainAmountBorrow(Long.parseLong(Total));
                    ct.setAcceptedBy(u.getUserLogin());
                    ct.setDateRepayment(LocalDateTime.now());
                    ct.setUpdatedDate(LocalDateTime.now());
                    contractDAO.update(ct);
                    return "notcomplete";
                }
            } else {
                return "roleError";
            }


        } catch (Exception ex) {
            return "error";
        }
    }
}
