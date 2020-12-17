package com.sgfintech.controller;

import com.sgfintech.entity.Companies;
import com.sgfintech.handler.CompanyHandler;
import com.sgfintech.handler.CustomerHandler;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class CustomerController {

    @Autowired
    MergeDataService mergeDataService;

    @RequestMapping(value = {"/list-customer"}, method = RequestMethod.GET)
    public String listCustomer(Model mm) {
        List<CustomerHandler> listdata = mergeDataService.getDataCustomer();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "list-customer";
    }

    @RequestMapping(value = {"/manage-customer"}, method = RequestMethod.GET)
    public String manageCustomer(Model mm) {
        List<Companies> listdata = mergeDataService.getDataManange();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "manage-customer";
    }


//    @RequestMapping(value="/doSearch", method = RequestMethod.POST)
//    public ModelAndView listSerchClients(@RequestParam("bnCustomerName") String searchText) {
//        Map<String, Object> model = new HashMap<String, Object>();
//        model.put("sclients",  prepareListofBean(clientService.listSearchClientss(searchText))) ;
//        return new ModelAndView("search", model);
//    }

}
