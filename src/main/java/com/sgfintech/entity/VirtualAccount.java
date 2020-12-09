package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "sgft_virtual_account")
public class VirtualAccount implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "account_number", nullable = false)
    private String accountNumber;

    @Column(name = "amount_max")
    private String amountMax;

    @Column(name = "amount_min")
    private String amountMin;

    @Column(name = "expired_date")
    private LocalDateTime expiredDate;

    @Column(name = "account_name")
    private String accountName;

    @Column(name = "account_info")
    private byte[] accountInfo;

    @Column(name = "order_id")
    private String orderId;

}
