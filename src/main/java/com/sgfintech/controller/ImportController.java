package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.CompaniesDAO;
import com.sgfintech.dao.CustomerDAO;
import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;
import com.sgfintech.handler.CompareListHandler;
import com.sgfintech.handler.ExcelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ImportController implements ServletContextAware {

    String fileLocation = "file-upload/archived_system/";

    @RequestMapping(value = {"/import"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        return "import";
    }


    private ServletContext servletContext;


    @Autowired
    CompaniesDAO companiesDAO;

    @Autowired
    CustomerDAO customerDAO;

    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public @ResponseBody
    String process(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
        String companyCode = request.getParameter("macongty");
        String companyName = request.getParameter("tencongty");
        try {
            String path = servletContext.getRealPath(fileLocation);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-sss");
            String fileName = sdf.format(date) + multipartFile.getOriginalFilename();
            File file = new File(path, fileName);
            if (!file.exists()) {
                file.mkdirs();
            }
            multipartFile.transferTo(file);
            String excelPath = servletContext.getRealPath(fileLocation + fileName);
            ExcelHelper excelHelper = new ExcelHelper(excelPath);
            List<Customer> lstCustomer = excelHelper.parseDataFromExcel("Customer", companyCode);
            long c = companiesDAO.countCompanyByCode(companyCode);
            if (c < 1) {
                Companies com = new Companies();
                com.setCompanyCode(companyCode);
                com.setCompanyName(companyName);
                companiesDAO.save(com);
                customerDAO.saveAllStateless(lstCustomer);
                return new Gson().toJson(lstCustomer);
            } else {
                //todo compare 2 list
                List<Customer> customerList = customerDAO.getAllItemByCode(companyCode);
                List<Customer> importDB = CompareListHandler.compareList(customerList, lstCustomer);
                customerDAO.saveAll(importDB);
                return new Gson().toJson(importDB);
            }
        } catch (Exception ex) {
            ex.toString();
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
