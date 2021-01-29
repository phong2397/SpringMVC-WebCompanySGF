package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "sgft_detail_transaction")
@Data
public class DetailTransaction implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "company_code")
    private String companyCode;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "bank_account")
    private String bankAccount;

    @Column(name = "bank_name")
    private String bankName;

    @Column(name = "bank_owner")
    private String bankOwner;

    @Column(name = "customer_phone")
    private String customerPhone;

    @Column(name = "amount")
    private Long amount;

    @Column(name = "interest_rate")
    private Double interestRate;

    @Column(name = "total")
    private Integer total;

    @Column(name = "date_request")
    private LocalDateTime dateRequest = LocalDateTime.now();

    @Column(name = "payer")
    private String payer;

    @Column(name = "pay_date")
    private LocalDateTime payDate;

    @Column(name = "collector")
    private String collector;

    @Column(name = "collect_date")
    private LocalDateTime collectDate;

    @Column(name = "status")
    private String status;

    @Column(name = "pay_images")
    private String payImages;

    @Column(name = "collection_images")
    private String collectionImages;
}
