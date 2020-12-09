package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "sgft_transaction")
@Data
public class Transaction implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "transaction_id", nullable = false)
    private String transactionId;

    @Column(name = "account_number")
    private String accountNumber;

    @Column(name = "status")
    private String status;

    @Column(name = "created_date")
    private LocalDateTime createdDate = LocalDateTime.now();

    @Column(name = "account_virtual")
    private String accountVirtual;

    @Column(name = "response")
    private byte[] response;

    @Column(name = "request")
    private byte[] request;

    @Column(name = "reference_id")
    private String referenceId;

    @Column(name = "amount")
    private Long amount;

    @Column(name = "memo")
    private String memo;

}
