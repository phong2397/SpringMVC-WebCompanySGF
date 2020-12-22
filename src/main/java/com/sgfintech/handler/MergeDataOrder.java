package com.sgfintech.handler;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import lombok.Getter;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Getter
public class MergeDataOrder {
    private final Companies company;
    private final Customer customer;
    private final SaRequest saRequest;

    public MergeDataOrder(Customer c, SaRequest s,Companies com) {
        this.customer = c;
        this.saRequest = s;
        this.company = com;
    }

}
