package com.sgfintech.handler;

import com.sgfintech.entity.Companies;
import com.sgfintech.entity.Customer;

import lombok.Getter;

@Getter
public class CompanyHandler {
    private final Companies company;

    public CompanyHandler(Companies com) {
        this.company = com;
    }

}
