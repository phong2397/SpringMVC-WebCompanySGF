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

@Controller
public class TotalListController {
    @Autowired
    MergeDataService mergeDataService;

    @RequestMapping(value = {"/tongdanhsach"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
        int countAct = mergeDataService.contractStatus("act");
        int countDone = mergeDataService.contractStatus("done");
        List<MergeDataWithdraw> listdata = mergeDataService.getDataWithdraw("done", true, "");
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        mm.addAttribute("countDone", countDone);
        mm.addAttribute("countAct", countAct);
        return "tongdanhsach";
    }
}
