package com.sgfintech.controller;

import com.sgfintech.dao.DetailTransactionDAO;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.DetailTransaction;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RepaymentController {

    @Autowired
    DetailTransactionDAO detailTransactionDAO;

    @RequestMapping(value = {"/trasoatthongtin"}, method = RequestMethod.GET)
    public String trasoatthongtinPage(ModelMap model, HttpSession session) {
        Useradmin u = (Useradmin) session.getAttribute(Consts.Session_Euser);
        if (u == null) {
            return "redirect:login";
        } else {
            List<DetailTransaction> list = detailTransactionDAO.findAll(1);
            model.addAttribute(Consts.Attr_ResultView, list);
            return "trasoatthongtin";
        }
    }
}
