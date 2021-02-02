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
        boolean isExist = false;
        if (listDB.size() > listIP.size()) {

            for (Customer cu : listDB) {
                isExist = false;
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
            for (Customer cu : listIP) {
                isExist = false;
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
