package com.sgfintech.handler;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;
import lombok.Getter;

@Getter
public class CustomerHandler {
    private final Customer customer;
    private final Companies company;

    public CustomerHandler(Customer cu,Companies com) {
        this.customer = cu;
        this.company = com;
    }
}
