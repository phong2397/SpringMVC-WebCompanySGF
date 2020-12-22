package com.sgfintech.controller;

import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ProcessedController {
    @Autowired
    MergeDataService mergeDataService;

    @RequestMapping(value = {"/daxuly"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("done", true, "");
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "daxuly";
    }
}
