package com.sgfintech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RepaymentController {

    @RequestMapping(value = {"/trasoatthongtin"}, method = RequestMethod.GET)
    public String trasoatthongtinPage(Model model) {
        return "trasoatthongtin";
    }
}
