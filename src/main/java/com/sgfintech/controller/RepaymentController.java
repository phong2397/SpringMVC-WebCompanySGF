package com.sgfintech.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RepaymentController {

    private static final Logger log = Logger.getLogger(RepaymentController.class);


    @RequestMapping(value = {"/trasoatthongtin"}, method = RequestMethod.GET)
    public String trasoatthongtinPage(Model model) {
        log.info("test log ===============================");
        log.info(System.getProperty("catalina.base"));
        log.info(System.getProperty("catalina.home"));
        return "trasoatthongtin";
    }
}
