package com.sgfintech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ProcessedController {
    @RequestMapping(value = {"/daxuly"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap mm) {
//        List<MergeData> listMergeData = mergeDataService.getDataShow("wfs", false);
//        mm.addAttribute(Consts.Attr_ResultView, listMergeData);
        return "daxuly";
    }
}
