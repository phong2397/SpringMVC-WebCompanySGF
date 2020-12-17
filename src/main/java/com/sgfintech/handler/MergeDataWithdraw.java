package com.sgfintech.handler;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Customer;
import lombok.Getter;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Getter
public class MergeDataWithdraw {

    private final Companies companies;
    private final Customer customer;
    private final Contract contract;

    public MergeDataWithdraw(Customer cu, Contract co, Companies com) {
        this.customer = cu;
        this.contract = co;
        this.companies = com;
    }
}
