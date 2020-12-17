package com.sgfintech.controller;

import com.sgfintech.entity.Customer;
import com.sgfintech.handler.ExcelHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Controller
public class ImportController implements ServletContextAware {
    @RequestMapping(value = {"/import"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        return "import";
    }


    private ServletContext servletContext;

    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public String process(@RequestParam("file") MultipartFile file) throws Exception {
        String fileName = uploadExcelFile(file);
        System.out.println("File Name: " + fileName);
        String excelPath = servletContext.getRealPath("/resources/excels/" + fileName);
        System.out.println("Excel Path: " + excelPath);
        ExcelHelper excelHelper = new ExcelHelper(excelPath);
        List<Customer> products = excelHelper.readData(Customer.class.getName());
        System.out.println("Product List");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        for (Customer product : products) {
            product.toString();
        }
        return "product/index";
    }

    private String uploadExcelFile(MultipartFile multipartFile) {
        try {
            byte[] bytes = multipartFile.getBytes();
            Path path = Paths.get(servletContext.getRealPath("/resources/excels/" + multipartFile.getOriginalFilename()));
            Files.write(path, bytes);
            return multipartFile.getOriginalFilename();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
