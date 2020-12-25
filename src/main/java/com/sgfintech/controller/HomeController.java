package com.sgfintech.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class HomeController {

    @RequestMapping(value = {"/home", "/index"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {

        return "index";
    }
    @RequestMapping(value = {"/404"}, method = RequestMethod.GET)
    public String error(Model model) {
        return "404";
    }

    @RequestMapping(value = {"/infoCompany"}, method = RequestMethod.POST)
    public @ResponseBody
    String getInfoCompany(@RequestParam("id") String macongty, ModelMap mm, HttpServletRequest request, HttpServletResponse response) {
        JsonObject j = new JsonObject();
        Gson g = new Gson();
        String resp = g.toJson(j);
        return resp;
    }
}
