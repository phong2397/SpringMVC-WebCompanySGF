package com.sgfintech.handler;

import com.sgfintech.entity.Customer;
import com.sgfintech.entity.SaRequest;
import lombok.Getter;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Getter
public class MergeData {
    private final Customer customer;
    private final SaRequest saRequest;

    public MergeData(Customer c, SaRequest s) {
        this.customer = c;
        this.saRequest = s;
    }
}
