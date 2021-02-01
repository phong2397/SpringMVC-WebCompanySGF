package com.sgfintech.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemConfigController {
    private static final Logger log = Logger.getLogger(SystemConfigController.class);

    @RequestMapping(value = {"/giaidoantrehan"}, method = RequestMethod.GET)
    public String latePeriod(Model model) {
        log.info("GET - giaidoantrehan page ");
        return "giaidoantrehan";
    }
}
