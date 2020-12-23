package com.sgfintech.controller;

import com.sgfintech.entity.Customer;
import com.sgfintech.handler.ExcelHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public String process(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws Exception {
        String companyCode = request.getParameter("code");
        String companyName = request.getParameter("name");
        try {
            String path = servletContext.getRealPath(fileLocation);
//        String fileName = uploadExcelFile(file, path);
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
            System.out.println("Customer List");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
            for (Customer item : lstCustomer) {
                item.toString();
            }
        } catch (Exception ex) {
            ex.toString();
            ex.printStackTrace();
        }
        return "product/index";
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
