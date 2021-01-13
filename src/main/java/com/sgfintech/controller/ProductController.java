package com.sgfintech.controller;

import com.sgfintech.dao.ProductDAO;
import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Product;
import com.sgfintech.entity.SaRequest;
import com.sgfintech.entity.Useradmin;
import com.sgfintech.handler.MergeDataWithdraw;
import com.sgfintech.service.MergeDataService;
import com.sgfintech.util.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    MergeDataService mergeDataService;

    @Autowired
    ProductDAO productDAO;

    @RequestMapping(value = {"/cauhinh"}, method = RequestMethod.GET)
    public String settings(ModelMap mm) {
        List<Product> listdata = productDAO.findAll();
        mm.addAttribute(Consts.Attr_ResultView, listdata);
        return "cauhinh";
    }

    @RequestMapping(value = "/changeProduct", method = RequestMethod.POST)
    public @ResponseBody
    String changes(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String data = request.getParameter("id");
        String productCode = request.getParameter("productCode");
        String productDetail = request.getParameter("productDetail");
        String productName = request.getParameter("productName");
        String productRate = request.getParameter("productRate");
        String productMin = request.getParameter("productMin");
        String limitCount = request.getParameter("limitCount");
        if (productCode.equals("") || productDetail.equals("") || productName.equals("") || productRate.equals("") || productMin.equals("") || limitCount.equals("")) {
            return "error";
        } else {
            Product p = productDAO.findById(Long.parseLong(data));
            p.setProductCode(productCode);
            p.setLimitCount(Integer.parseInt(limitCount));
            p.setProductRate(Double.parseDouble(productRate));
            p.setProductAmountMin(productMin);
            p.setProductDetail(productDetail);
            p.setProductName(productName);
            p.setUpdatedDate(LocalDateTime.now());
            productDAO.update(p);
            return "success";
        }
    }
}
