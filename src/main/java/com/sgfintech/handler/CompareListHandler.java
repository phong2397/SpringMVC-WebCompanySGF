package com.sgfintech.handler;

import com.sgfintech.entity.Customer;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class CompareListHandler {

    public static List<Customer> compareList(List<Customer> listDB, List<Customer> listIP) {
        List<Customer> result = new ArrayList<>();
        if (listDB.size() > listIP.size()) {
            boolean isExist = false;
            for (Customer cu : listDB) {
                for (Customer c : listIP) {
                    if (cu.getCustomerId().equals(c.getCustomerId()) && cu.getCustomerPhone().equals(c.getCustomerPhone())) {
                        isExist = true;
                    }
                }
                if (isExist == false) {
                    result.add(cu);
                }
            }
            return result;
        } else {
            boolean isExist = false;
            for (Customer cu : listIP) {
                for (Customer c : listDB) {
                    if (cu.getCustomerId().equals(c.getCustomerId()) && cu.getCustomerPhone().equals(c.getCustomerPhone())) {
                        isExist = true;
                    }
                }
                if (isExist == false) {
                    result.add(cu);
                }
            }
            return result;
        }
    }
}
