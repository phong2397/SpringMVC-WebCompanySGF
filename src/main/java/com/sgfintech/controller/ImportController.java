package com.sgfintech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ImportController {
    @RequestMapping(value = {"/import"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        return "import";
    }
}
