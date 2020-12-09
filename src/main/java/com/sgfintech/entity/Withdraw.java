package com.sgfintech.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "sgft_withdraw")
@Data
public class Withdraw implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id_contract", nullable = false)
    private Long idContract;

    @Column(name = "amount_max")
    private String amountMax;

    @Column(name = "amount_min")
    private String amountMin;

    @Column(name = "in_amount")
    private String inAmount;

    @Column(name = "in_date")
    private LocalDateTime inDate;

    @Column(name = "reference_id")
    private String referenceId;

    @Column(name = "account_virtual")
    private String accountVirtual;

    @Column(name = "request")
    private byte[] request;

    @Column(name = "response")
    private byte[] response;

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    @Column(name = "channel")
    private String channel;

}
