package com.sgfintech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemConfigController {
    
    @RequestMapping(value = {"/giaidoantrehan"}, method = RequestMethod.GET)
    public String latePeriod(Model model) {
        return "giaidoantrehan";
    }
}
