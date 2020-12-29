package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Table(name = "sgft_customer")
@Entity
@Data
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "company_code")
    private String companyCode;

    @Column(name = "customer_phone", nullable = false)
    private String customerPhone;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "customer_email")
    private String customerEmail;

    @Column(name = "customer_code")
    private String customerCode;

    @Column(name = "customer_salary")
    private Long customerSalary;

    @Column(name = "customer_bank")
    private String customerBank;

    @Column(name = "customer_bank_acc")
    private String customerBankAcc;

    @Column(name = "customer_bank_name")
    private String customerBankName;

    @Column(name = "customer_id")
    private String customerId;

    @Column(name = "customer_id_date")
    private LocalDateTime customerIdDate;

    @Column(name = "customer_address")
    private String customerAddress;

    @Column(name = "customer_address_temp")
    private String customerAddressTemp;

    @Column(name = "customer_id_location")
    private String customerIdLocation;

    @Column(name = "customer_social_insurance")
    private String customerSocialInsurance;

    @Column(name = "customer_health_insurance")
    private String customerHealthInsurance;

    @Column(name = "customer_position")
    private String customerPosition;

    @Column(name = "customer_tax")
    private String customerTax;

    @Column(name = "customer_contract")
    private Long customerContract;

    @Column(name = "customer_contract_expired")
    private LocalDateTime customerContractExpired;

    @Column(name = "customer_relative")
    private String customerRelative;

    @Column(name = "customer_relative_phone")
    private String customerRelativePhone;

    @Column(name = "customer_birthday")
    private LocalDate customerBirthday;

    @Column(name = "customer_gender")
    private String customerGender;

    @Column(name = "status")
    private String status = "wait";

    @Column(name = "created_date")
    private LocalDateTime createdDate = LocalDateTime.now();

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    @Column(name = "logined_date")
    private LocalDateTime loginedDate;

    public void Customer() {
    }
}
