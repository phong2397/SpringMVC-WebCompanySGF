package com.sgfintech.controller;

import com.google.gson.Gson;
import com.sgfintech.dao.CompaniesDAO;
import com.sgfintech.dao.CustomerDAO;
import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;
import com.sgfintech.handler.CompareListHandler;
import com.sgfintech.handler.ExcelHelper;
import org.apache.log4j.Logger;
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
    public String importPage(Model model) {
        log.info("GET - importPage");
        return "import";
    }

    private static final Logger log = Logger.getLogger(ImportController.class);

    private ServletContext servletContext;


    @Autowired
    CompaniesDAO companiesDAO;

    @Autowired
    CustomerDAO customerDAO;

    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public @ResponseBody
    String process(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
        log.info("POST - process ");
        String companyCode = request.getParameter("macongty");
        log.info("Company Code : " + companyCode);
        String companyName = request.getParameter("tencongty");
        log.info("Company Name : " + companyName);
        String companyPhone = request.getParameter("sodienthoai");
        log.info("Company Phone : " + companyPhone);
        try {
            String path = servletContext.getRealPath(fileLocation);
            log.info("Path : " + path);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-sss");
            String fileName = sdf.format(date) + multipartFile.getOriginalFilename();
            log.info("FileName : " + fileName);
            File file = new File(path, fileName);
            if (!file.exists()) {
                log.info("Check file not exiist : ");
                file.mkdirs();
            }
            multipartFile.transferTo(file);
            String excelPath = servletContext.getRealPath(fileLocation + fileName);
            log.info("Excel Path : " + excelPath);
            ExcelHelper excelHelper = new ExcelHelper(excelPath);
            List<Customer> lstCustomer = excelHelper.parseDataFromExcel("Customer", companyCode);
            log.info("Parse list customer from excel file : " + lstCustomer);
            long c = companiesDAO.countCompanyByCode(companyCode);
            log.info("Count company by code : " + c);
            if (c < 1) {
                log.info("Check count company code < 1 ");
                Companies com = new Companies();
                com.setCompanyCode(companyCode);
                com.setCompanyName(companyName);
                com.setCompanyPhone(companyPhone);
                companiesDAO.save(com);
                customerDAO.saveAllStateless(lstCustomer);
                return new Gson().toJson(lstCustomer);
            } else {
                log.info("Check count company code > 1 ");
                //todo compare 2 list
                List<Customer> customerList = customerDAO.getAllItemByCode(companyCode);
                log.info("Customer List: " + customerList);
                List<Customer> importDB = CompareListHandler.compareList(customerList, lstCustomer);
                log.info("Compare 2 list: " + importDB);
                customerDAO.saveAll(importDB);
                return new Gson().toJson(importDB);
            }
        } catch (Exception ex) {
            log.error("Error log: " + ex.getMessage());
            return ex.getMessage();
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
