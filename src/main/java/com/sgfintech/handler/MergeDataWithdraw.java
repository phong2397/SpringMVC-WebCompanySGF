package com.sgfintech.handler;

import com.sgfintech.entity.Contract;
import com.sgfintech.entity.Customer;
import lombok.Getter;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
@Getter
public class MergeDataWithdraw {

    private final Customer customer;
    private final Contract contract;

    public MergeDataWithdraw(Customer cu, Contract co) {
        this.customer = cu;
        this.contract = co;
    }
}
