package com.sgfintech.controller;

import com.sgfintech.handler.MergeDataOrder;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ExpertiseController {
    @Autowired
    MergeDataService mergeDataService;

    @RequestMapping(value = { "/thamdinh" }, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm, HttpServletRequest request) {
        List<MergeDataOrder> listMergeDatumOrders = mergeDataService.getDataShow("accept", false);
        mm.addAttribute(Consts.Attr_ResultView, listMergeDatumOrders);
        return "thamdinh";
    }

}
